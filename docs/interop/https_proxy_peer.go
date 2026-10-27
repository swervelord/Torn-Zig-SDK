package main

import (
	"bufio"
	"crypto/rand"
	"crypto/rsa"
	"crypto/tls"
	"crypto/x509"
	"crypto/x509/pkix"
	"encoding/json"
	"encoding/pem"
	"fmt"
	"io"
	"math/big"
	"net"
	"net/http"
	"os"
	"strings"
	"time"
)

func must(err error) {
	if err != nil {
		panic(err)
	}
}

func main() {
	key, err := rsa.GenerateKey(rand.Reader, 2048)
	must(err)
	tmpl := &x509.Certificate{SerialNumber: big.NewInt(1), Subject: pkix.Name{CommonName: "Ephemeral SDK proxy verification"}, NotBefore: time.Now().Add(-time.Hour), NotAfter: time.Now().Add(time.Hour), IsCA: true, BasicConstraintsValid: true, KeyUsage: x509.KeyUsageCertSign | x509.KeyUsageDigitalSignature}
	root, err := x509.CreateCertificate(rand.Reader, tmpl, tmpl, &key.PublicKey, key)
	must(err)
	cert, err := x509.ParseCertificate(root)
	must(err)
	leafKey, err := rsa.GenerateKey(rand.Reader, 2048)
	must(err)
	leaf := &x509.Certificate{SerialNumber: big.NewInt(2), Subject: pkix.Name{CommonName: "localhost"}, DNSNames: []string{"localhost"}, IPAddresses: []net.IP{net.ParseIP("127.0.0.1")}, NotBefore: time.Now().Add(-time.Hour), NotAfter: time.Now().Add(time.Hour), KeyUsage: x509.KeyUsageDigitalSignature | x509.KeyUsageKeyEncipherment, ExtKeyUsage: []x509.ExtKeyUsage{x509.ExtKeyUsageServerAuth}}
	der, err := x509.CreateCertificate(rand.Reader, leaf, cert, &leafKey.PublicKey, key)
	must(err)
	chain := tls.Certificate{Certificate: [][]byte{der, root}, PrivateKey: leafKey}
	conf := &tls.Config{Certificates: []tls.Certificate{chain}, MinVersion: tls.VersionTLS12}
	target, err := tls.Listen("tcp", "127.0.0.1:0", conf)
	must(err)
	defer target.Close()
	go http.Serve(target, http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") != "ApiKey fixture-only-auth" {
			panic("missing target auth")
		}
		w.Header().Set("Content-Type", "application/json")
		fmt.Fprint(w, `{"verified":"nested-target-tls"}`)
	}))
	proxy, err := tls.Listen("tcp", "127.0.0.1:0", conf)
	must(err)
	defer proxy.Close()
	must(os.WriteFile("work/proxy-ca.pem", pem.EncodeToMemory(&pem.Block{Type: "CERTIFICATE", Bytes: root}), 0600))
	endpoints := map[string]string{"target": "https://localhost:" + strings.Split(target.Addr().String(), ":")[1] + "/verify", "proxy": "https://proxy-user:proxy-pass@127.0.0.1:" + strings.Split(proxy.Addr().String(), ":")[1]}
	b, err := json.Marshal(endpoints)
	must(err)
	must(os.WriteFile("work/proxy-endpoints.json", b, 0600))
	fmt.Println(string(b))
	go func() { time.Sleep(240 * time.Second); os.Exit(0) }()
	for {
		c, err := proxy.Accept()
		must(err)
		go func(c net.Conn) {
			defer c.Close()
			r, err := http.ReadRequest(bufio.NewReader(c))
			if err != nil {
				return
			}
			user, pass, ok := func() (string, string, bool) {
				v := r.Header.Get("Proxy-Authorization")
				if v != "Basic cHJveHktdXNlcjpwcm94eS1wYXNz" {
					return "", "", false
				}
				return "proxy-user", "proxy-pass", true
			}()
			_ = user
			_ = pass
			if !ok {
				panic("missing proxy auth")
			}
			if r.Method == "CONNECT" {
				if r.Header.Get("Authorization") != "" {
					panic("origin auth leaked in CONNECT")
				}
				remote, err := net.Dial("tcp", target.Addr().String())
				if err != nil {
					return
				}
				defer remote.Close()
				fmt.Fprint(c, "HTTP/1.1 200 Connection Established\r\n\r\n")
				go io.Copy(remote, c)
				io.Copy(c, remote)
			} else {
				if r.Header.Get("Authorization") != "ApiKey fixture-only-auth" {
					panic("missing http origin auth")
				}
				fmt.Fprint(c, "HTTP/1.1 200 OK\r\nContent-Length: 19\r\nConnection: close\r\n\r\n{\"verified\":\"http\"}")
			}
		}(c)
	}
}

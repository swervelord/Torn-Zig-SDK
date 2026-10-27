const std = @import("std");
const client = @import("client.zig");
const operations = @import("generated/operations.zig");

fn Checked(comptime Op: type) type {
    return struct {
        fn call(c: client.Client, params: Op.Params) anyerror!client.ExactResult(Op) {
            return c.exact(Op, params, .{});
        }
    };
}

// Taking concrete function pointers forces semantic analysis of each generated
// exact request builder and response decoder without executing undefined data.
test "all 236 exact methods instantiate with their concrete public parameters" {
    comptime var count: usize = 0;
    inline for (@typeInfo(operations).@"struct".decl_names) |name| {
        const Op = @field(operations, name);
        if (@TypeOf(Op) == type and @hasDecl(Op, "Params") and @hasDecl(Op, "Response")) {
            const function: *const fn (client.Client, Op.Params) anyerror!client.ExactResult(Op) = &Checked(Op).call;
            try std.testing.expect(@intFromPtr(function) != 0);
            count += 1;
        }
    }
    try std.testing.expectEqual(@as(usize, 236), count);
}

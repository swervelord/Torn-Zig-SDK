const torn = @import("torn");
comptime {
    _ = torn.client.BatchType(.{});
}

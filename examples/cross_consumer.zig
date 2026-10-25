//! An exported function forces consumer bodies to compile in an object file.
//! Cross-compilation does not execute this function or establish native support.
const std = @import("std");
export fn torn_consumer_check(init: *std.process.Init) bool {
    @import("numeric_ownership.zig").main() catch return false;
    @import("typed_batch.zig").main(init.*) catch return false;
    return true;
}

const torn = @import("torn");
comptime {
    const parameters: torn.operations.getMyDetailedTrade.Params = .{ .tradeId = "wrong ID type" };
    _ = parameters;
}

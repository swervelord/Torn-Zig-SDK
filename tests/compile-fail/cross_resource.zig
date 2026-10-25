const torn = @import("torn");
comptime {
    _ = torn.client.BatchType(.{ torn.selections.user.profile, torn.selections.faction.basic });
}

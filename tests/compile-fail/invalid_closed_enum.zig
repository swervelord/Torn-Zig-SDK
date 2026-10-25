const torn = @import("torn");
comptime {
    const state: torn.current.UserStatusStateEnum = .DoesNotExist;
    _ = state;
}

const torn = @import("torn");
comptime {
    // Open enums accept unknown wire values at run time, but the closed `Known`
    // set still rejects misspelled literals at compile time.
    const state: torn.current.UserStatusStateEnum.Known = .DoesNotExist;
    _ = state;
}

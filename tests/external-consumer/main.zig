const std = @import("std");
const torn = @import("torn");
// Fictional, independently specified values; no account data or credentials.
const fixture =
    \\{"profile":{"id":123,"name":"Example","level":1,"rank":"Beginner","title":"Citizen","age":1,"signed_up":1,"faction_id":null,"honor_id":1,"property":{"id":1,"name":"Shack"},"image":null,"gender":"Enby","revivable":false,"role":"Civilian","status":{"description":"Okay","details":null,"state":"Okay","until":null,"color":"green"},"spouse":null,"awards":0,"friends":0,"enemies":0,"forum_posts":0,"karma":0,"last_action":{"status":"Offline","timestamp":1,"relative":"one minute ago"},"life":{"current":100,"maximum":100},"donator_status":null,"revive_setting":"Unknown"},"job":{"type":"job","name":"Army","position":"Private"},"timestamp":1000}
;
const Mock = struct {
    calls: usize = 0,
    fn send(ctx: ?*anyopaque, a: std.mem.Allocator, _: std.Io, request: torn.transport.Request) !torn.transport.Response {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        self.calls += 1;
        if (!std.mem.eql(u8, request.url, "https://api.torn.com/v2/user?selections=job%2Cprofile%2Ctimestamp&id=123")) return error.UnexpectedUrl;
        return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, fixture) };
    }
};
pub fn main(init: std.process.Init) !void {
    const a = init.gpa;
    var mock: Mock = .{};
    var engine = try torn.runtime.Client.init(a, init.io, .{ .keys = &.{"mock-only"} }, .{ .context = &mock, .send_fn = Mock.send });
    defer engine.deinit();
    const client: torn.Client = .{ .engine = &engine };
    var result = try client.batch(.{ torn.selections.user.profile, torn.selections.user.job, torn.selections.user.timestamp }, &.{.{ .name = "id", .value = "123" }}, &.{}, .{});
    defer result.deinit();
    if (result.execution.failure != null) return error.BatchFailed;
    const data = result.value.?;
    if (!std.mem.eql(u8, data[0].profile.name, "Example")) return error.WrongProfile;
    if (data[1].job != .v0) return error.WrongJob;
    if (data[1].job.v0.name != .Army or data[2].timestamp != 1000) return error.WrongValues;
    if (mock.calls != 1 or result.execution.reports.len != 1) return error.WrongCallCount;
}

// Generated maintained compatibility contracts.
const model = @import("../model.zig");
const current = @import("current.zig");
pub const CompanyApplicationStats = struct {
    manual_labor: ?i64,
    intelligence: ?i64,
    endurance: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "manual_labor", .key = "manual_labor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "intelligence", .key = "intelligence", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "endurance", .key = "endurance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"manual_labor\",\"Key\":\"manual_labor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"intelligence\",\"Key\":\"intelligence\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"endurance\",\"Key\":\"endurance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyApplicationSummary = struct {
    id: ?u64,
    user: ?CompanyApplicationUser,
    message: ?[]const u8,
    valid_until: ?u64,
    status: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user", .key = "user", .aliases = &.{
            "player",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "message", .key = "message", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "valid_until", .key = "valid_until", .aliases = &.{
            "expires_at",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyApplicationUser\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"player\"],\"Custom\":\"\"},{\"Name\":\"message\",\"Key\":\"message\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"valid_until\",\"Key\":\"valid_until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"expires_at\"],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyApplicationUser = struct {
    id: ?u64,
    name: ?[]const u8,
    level: ?u32,
    stats: ?CompanyApplicationStats,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyApplicationStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyApplicationsBundle = struct {
    applications: []const CompanyApplicationSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "applications", .key = "applications", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"applications\",\"Key\":\"applications\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"CompanyApplicationSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyCompaniesBundle = struct {
    company: ?CompanyProfile,
    companies: []const CompanyProfile,
    company_timestamp: ?u64,
    company_delay: ?u64,
    companies_timestamp: ?u64,
    companies_delay: ?u64,
    _metadata: ?PaginatedMetadataWithTotal,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "company", .key = "company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "companies", .key = "companies", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company_timestamp", .key = "company_timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company_delay", .key = "company_delay", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "companies_timestamp", .key = "companies_timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "companies_delay", .key = "companies_delay", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"company\",\"Key\":\"company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyProfile\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"companies\",\"Key\":\"companies\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"CompanyProfile\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company_timestamp\",\"Key\":\"company_timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company_delay\",\"Key\":\"company_delay\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"companies_timestamp\",\"Key\":\"companies_timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"companies_delay\",\"Key\":\"companies_delay\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadataWithTotal\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyCustomers = struct {
    daily: ?i64,
    weekly: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "daily", .key = "daily", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "weekly", .key = "weekly", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"daily\",\"Key\":\"daily\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"weekly\",\"Key\":\"weekly\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyDetailedBundle = CompanyProfileBundle;
pub const CompanyDirector = struct {
    id: ?u64,
    name: ?[]const u8,
    status: ?UserStatus,
    last_action: ?UserLastAction,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_action", .key = "last_action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserStatus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_action\",\"Key\":\"last_action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLastAction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyEmployee = struct {
    id: ?u64,
    name: ?[]const u8,
    position: ?[]const u8,
    days_in_company: ?u64,
    joined_at: ?u64,
    wage: ?i64,
    manual_labor: ?i64,
    intelligence: ?i64,
    endurance: ?i64,
    stats: ?CompanyEmployeeStats,
    effectiveness: ?CompanyEmployeeEffectiveness,
    working_stats: ?i64,
    efficiency: ?i64,
    value: ?f64,
    status: ?UserStatus,
    last_action: ?UserLastAction,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "optional_position_name" },
        .{ .name = "days_in_company", .key = "days_in_company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "joined_at", .key = "joined_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "wage", .key = "wage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "manual_labor", .key = "manual_labor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "intelligence", .key = "intelligence", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "endurance", .key = "endurance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "effectiveness", .key = "effectiveness", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "working_stats", .key = "working_stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "efficiency", .key = "efficiency", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_action", .key = "last_action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"optional_position_name\"},{\"Name\":\"days_in_company\",\"Key\":\"days_in_company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"joined_at\",\"Key\":\"joined_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"wage\",\"Key\":\"wage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"manual_labor\",\"Key\":\"manual_labor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"intelligence\",\"Key\":\"intelligence\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"endurance\",\"Key\":\"endurance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyEmployeeStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"effectiveness\",\"Key\":\"effectiveness\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyEmployeeEffectiveness\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"working_stats\",\"Key\":\"working_stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"efficiency\",\"Key\":\"efficiency\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserStatus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_action\",\"Key\":\"last_action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLastAction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyEmployeeEffectiveness = struct {
    working_stats: ?i64,
    settled_in: ?i64,
    book: ?i64,
    merits: ?i64,
    director_education: ?i64,
    management: ?i64,
    wrong_gender: ?i64,
    addiction: ?i64,
    inactivity: ?i64,
    total: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "working_stats", .key = "working_stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "settled_in", .key = "settled_in", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "book", .key = "book", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "merits", .key = "merits", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "director_education", .key = "director_education", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "management", .key = "management", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "wrong_gender", .key = "wrong_gender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "addiction", .key = "addiction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "inactivity", .key = "inactivity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"working_stats\",\"Key\":\"working_stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"settled_in\",\"Key\":\"settled_in\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"book\",\"Key\":\"book\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"merits\",\"Key\":\"merits\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"director_education\",\"Key\":\"director_education\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"management\",\"Key\":\"management\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"wrong_gender\",\"Key\":\"wrong_gender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"addiction\",\"Key\":\"addiction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"inactivity\",\"Key\":\"inactivity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyEmployeeStats = struct {
    manual_labor: ?i64,
    intelligence: ?i64,
    endurance: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "manual_labor", .key = "manual_labor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "intelligence", .key = "intelligence", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "endurance", .key = "endurance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"manual_labor\",\"Key\":\"manual_labor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"intelligence\",\"Key\":\"intelligence\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"endurance\",\"Key\":\"endurance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyEmployeesBundle = struct {
    company_employees: ?model.Map(CompanyEmployee),
    employees: []const CompanyEmployee,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "company_employees", .key = "company_employees", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "employees", .key = "employees", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"company_employees\",\"Key\":\"company_employees\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"CompanyEmployee\"}]}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"employees\",\"Key\":\"employees\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"CompanyEmployee\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyIncome = struct {
    daily: ?i64,
    weekly: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "daily", .key = "daily", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "weekly", .key = "weekly", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"daily\",\"Key\":\"daily\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"weekly\",\"Key\":\"weekly\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyLookupBundle = struct {
    selections: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyNewsBundle = struct {
    news: model.Map(CompanyNewsEntry),
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "news", .key = "news", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "company_news" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"news\",\"Key\":\"news\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"CompanyNewsEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"company_news\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyNewsEntry = struct {
    id: ?[]const u8,
    category: ?[]const u8,
    news: ?[]const u8,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "category", .key = "category", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "news", .key = "news", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"category\",\"Key\":\"category\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"news\",\"Key\":\"news\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyProfile = struct {
    id: ?u64,
    name: ?[]const u8,
    company_type: ?u64,
    company_kind: ?CompanyType,
    rating: ?i64,
    age: ?u64,
    days_old: ?u64,
    created_at: ?u64,
    image: ?[]const u8,
    daily_income: ?i64,
    weekly_income: ?i64,
    income: ?CompanyIncome,
    customers: ?CompanyCustomers,
    employees: ?model.Map(CompanyProfileEmployee),
    director: ?CompanyDirector,
    status: ?UserStatus,
    funds: ?i64,
    popularity: ?i64,
    efficiency: ?i64,
    environment: ?i64,
    trains: ?u32,
    applications_allowed: ?bool,
    advertisement_budget: ?i64,
    upgrades: ?CompanyUpgrades,
    value: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{
            "ID",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company_type", .key = "company_type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company_kind", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rating", .key = "rating", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "age", .key = "age", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "days_old", .key = "days_old", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "created_at", .key = "created_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "image", .key = "image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "daily_income", .key = "daily_income", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "weekly_income", .key = "weekly_income", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "income", .key = "income", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "customers", .key = "customers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "employees", .key = "employees", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "director", .key = "director", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "funds", .key = "funds", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "popularity", .key = "popularity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "efficiency", .key = "efficiency", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "environment", .key = "environment", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "trains", .key = "trains", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "applications_allowed", .key = "applications_allowed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "advertisement_budget", .key = "advertisement_budget", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upgrades", .key = "upgrades", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"ID\"],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company_type\",\"Key\":\"company_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company_kind\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyType\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rating\",\"Key\":\"rating\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"age\",\"Key\":\"age\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"days_old\",\"Key\":\"days_old\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"created_at\",\"Key\":\"created_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"image\",\"Key\":\"image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"daily_income\",\"Key\":\"daily_income\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"weekly_income\",\"Key\":\"weekly_income\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"income\",\"Key\":\"income\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyIncome\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"customers\",\"Key\":\"customers\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyCustomers\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"employees\",\"Key\":\"employees\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"CompanyProfileEmployee\"}]}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"director\",\"Key\":\"director\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyDirector\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserStatus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"funds\",\"Key\":\"funds\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"popularity\",\"Key\":\"popularity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"efficiency\",\"Key\":\"efficiency\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"environment\",\"Key\":\"environment\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"trains\",\"Key\":\"trains\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"applications_allowed\",\"Key\":\"applications_allowed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"advertisement_budget\",\"Key\":\"advertisement_budget\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upgrades\",\"Key\":\"upgrades\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyUpgrades\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyProfileBundle = struct {
    company: CompanyProfile,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "company", .key = "company", .aliases = &.{
            "profile",
        }, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"company\",\"Key\":\"company\",\"Type\":{\"name\":\"CompanyProfile\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"profile\"],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyProfileEmployee = union(enum) {
    v0: *CompanyProfileEmployeeDetails,
    v1: u64,
    pub const compatibility_name = "CompanyProfileEmployee";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"box\",\"arguments\":[{\"name\":\"CompanyProfileEmployeeDetails\"}]},{\"name\":\"uint64\"}],\"Type\":{\"name\":\"\"}}";
};
pub const CompanyProfileEmployeeDetails = struct {
    id: ?u64,
    name: ?[]const u8,
    position: ?[]const u8,
    days_in_company: ?u64,
    status: ?UserStatus,
    last_action: ?UserLastAction,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "optional_position_name" },
        .{ .name = "days_in_company", .key = "days_in_company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_action", .key = "last_action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"optional_position_name\"},{\"Name\":\"days_in_company\",\"Key\":\"days_in_company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserStatus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_action\",\"Key\":\"last_action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLastAction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanySearchBundle = struct {
    search: []const CompanySearchEntry,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "search", .key = "search", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"search\",\"Key\":\"search\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"CompanySearchEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanySearchEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    company_kind: ?CompanyType,
    rating: ?i64,
    days_old: ?u64,
    image: ?[]const u8,
    income: ?CompanyIncome,
    customers: ?CompanyCustomers,
    director: ?CompanyDirector,
    applications_allowed: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company_kind", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rating", .key = "rating", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "days_old", .key = "days_old", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "image", .key = "image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "income", .key = "income", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "customers", .key = "customers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "director", .key = "director", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "applications_allowed", .key = "applications_allowed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company_kind\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyType\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rating\",\"Key\":\"rating\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"days_old\",\"Key\":\"days_old\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"image\",\"Key\":\"image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"income\",\"Key\":\"income\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyIncome\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"customers\",\"Key\":\"customers\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyCustomers\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"director\",\"Key\":\"director\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"CompanyDirector\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"applications_allowed\",\"Key\":\"applications_allowed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyStockBundle = struct {
    company_stock: model.Map(CompanyStockEntry),
    stock: []const CompanyStockEntry,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "company_stock", .key = "company_stock", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stock", .key = "stock", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"company_stock\",\"Key\":\"company_stock\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"CompanyStockEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stock\",\"Key\":\"stock\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"CompanyStockEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyStockEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    cost: ?i64,
    rrp: ?i64,
    price: ?i64,
    in_stock: ?u64,
    on_order: ?u64,
    sold_amount: ?u64,
    sold_worth: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rrp", .key = "rrp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "in_stock", .key = "in_stock", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "on_order", .key = "on_order", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sold_amount", .key = "sold_amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sold_worth", .key = "sold_worth", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rrp\",\"Key\":\"rrp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"in_stock\",\"Key\":\"in_stock\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"on_order\",\"Key\":\"on_order\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sold_amount\",\"Key\":\"sold_amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sold_worth\",\"Key\":\"sold_worth\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyTimestampBundle = struct {
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyType = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const CompanyUpgrades = struct {
    staff_room: ?[]const u8,
    storage: ?[]const u8,
    storage_capacity: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "staff_room", .key = "staff_room", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "storage", .key = "storage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "storage_capacity", .key = "storage_capacity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "optional_stringish" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"staff_room\",\"Key\":\"staff_room\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"storage\",\"Key\":\"storage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"storage_capacity\",\"Key\":\"storage_capacity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"optional_stringish\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const DynamicValue = union(enum) {
    v0: void,
    v1: bool,
    v2: i64,
    v3: model.Raw,
    v4: []const u8,
    v5: []const DynamicValue,
    v6: model.Map(DynamicValue),
    pub const compatibility_name = "DynamicValue";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"null\"},{\"name\":\"bool\"},{\"name\":\"int64\"},{\"name\":\"exact_number\"},{\"name\":\"string\"},{\"name\":\"array\",\"arguments\":[{\"name\":\"DynamicValue\"}]},{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"DynamicValue\"}]}],\"Type\":{\"name\":\"\"}}";
};
pub const FactionApplicantStats = struct {
    strength: ?i64,
    speed: ?i64,
    dexterity: ?i64,
    defense: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "strength", .key = "strength", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "speed", .key = "speed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dexterity", .key = "dexterity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defense", .key = "defense", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"strength\",\"Key\":\"strength\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"speed\",\"Key\":\"speed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dexterity\",\"Key\":\"dexterity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defense\",\"Key\":\"defense\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionApplicantSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    level: ?u32,
    stats: ?FactionApplicantStats,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionApplicantStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionApplicationSummary = struct {
    id: ?u64,
    user: ?FactionApplicantSummary,
    message: ?[]const u8,
    valid_until: ?u64,
    status: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "message", .key = "message", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "valid_until", .key = "valid_until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionApplicantSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"message\",\"Key\":\"message\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"valid_until\",\"Key\":\"valid_until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionApplicationsBundle = struct {
    applications: []const FactionApplicationSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "applications", .key = "applications", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"applications\",\"Key\":\"applications\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionApplicationSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionArmorBundle = struct {
    armor: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "armor", .key = "armor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"armor\",\"Key\":\"armor\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionAttacksBundle = struct {
    attacks: []const UserAttack,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAttack\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionAttacksFullBundle = struct {
    attacks: []const UserAttackFull,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAttackFull\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionBalanceBundle = struct {
    balance: FactionBalanceSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "balance", .key = "balance", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"balance\",\"Key\":\"balance\",\"Type\":{\"name\":\"FactionBalanceSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionBalanceFaction = struct {
    money: ?i64,
    points: ?i64,
    scope: ?u32,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "scope", .key = "scope", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"scope\",\"Key\":\"scope\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionBalanceMember = struct {
    id: ?u64,
    username: ?[]const u8,
    money: ?i64,
    points: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "username", .key = "username", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"username\",\"Key\":\"username\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionBalanceSummary = struct {
    faction: ?FactionBalanceFaction,
    members: []const FactionBalanceMember,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionBalanceFaction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionBalanceMember\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionBasic = struct {
    id: ?u64,
    name: ?[]const u8,
    tag: ?[]const u8,
    tag_image: ?[]const u8,
    respect: ?i64,
    members: ?u32,
    leader_id: ?u64,
    co_leader_id: ?u64,
    rank: ?FactionRank,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tag", .key = "tag", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tag_image", .key = "tag_image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "leader_id", .key = "leader_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "co_leader_id", .key = "co_leader_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tag\",\"Key\":\"tag\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tag_image\",\"Key\":\"tag_image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"leader_id\",\"Key\":\"leader_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"co_leader_id\",\"Key\":\"co_leader_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRank\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionBasicBundle = struct {
    basic: FactionBasic,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "basic", .key = "basic", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"basic\",\"Key\":\"basic\",\"Type\":{\"name\":\"FactionBasic\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionBoostersBundle = struct {
    boosters: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "boosters", .key = "boosters", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"boosters\",\"Key\":\"boosters\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCachesBundle = struct {
    caches: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "caches", .key = "caches", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"caches\",\"Key\":\"caches\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCesiumBundle = struct {
    cesium: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cesium", .key = "cesium", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cesium\",\"Key\":\"cesium\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainBundle = struct {
    chain: FactionOngoingChainSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"FactionOngoingChainSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainReportAttackerRespectSummary = struct {
    total: ?f64,
    average: ?f64,
    best: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "average", .key = "average", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "best", .key = "best", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"average\",\"Key\":\"average\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"best\",\"Key\":\"best\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainReportAttackerSummary = struct {
    id: ?u64,
    respect: ?FactionChainReportAttackerRespectSummary,
    attacks: ?FactionChainReportAttacksSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionChainReportAttackerRespectSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionChainReportAttacksSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainReportAttacksSummary = struct {
    total: ?u64,
    leave: ?u64,
    mug: ?u64,
    hospitalize: ?u64,
    assists: ?u64,
    retaliations: ?u64,
    overseas: ?u64,
    draws: ?u64,
    escapes: ?u64,
    losses: ?u64,
    war: ?u64,
    bonuses: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "leave", .key = "leave", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "mug", .key = "mug", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "hospitalize", .key = "hospitalize", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "assists", .key = "assists", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "retaliations", .key = "retaliations", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "overseas", .key = "overseas", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "draws", .key = "draws", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "escapes", .key = "escapes", .aliases = &.{
            "escpaces",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "losses", .key = "losses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "war", .key = "war", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonuses", .key = "bonuses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"leave\",\"Key\":\"leave\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"mug\",\"Key\":\"mug\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"hospitalize\",\"Key\":\"hospitalize\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"assists\",\"Key\":\"assists\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"retaliations\",\"Key\":\"retaliations\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"overseas\",\"Key\":\"overseas\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"draws\",\"Key\":\"draws\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"escapes\",\"Key\":\"escapes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"escpaces\"],\"Custom\":\"\"},{\"Name\":\"losses\",\"Key\":\"losses\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"war\",\"Key\":\"war\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonuses\",\"Key\":\"bonuses\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainReportBonusSummary = struct {
    attacker_id: ?u64,
    defender_id: ?u64,
    chain: ?u64,
    respect: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacker_id", .key = "attacker_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defender_id", .key = "defender_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacker_id\",\"Key\":\"attacker_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defender_id\",\"Key\":\"defender_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainReportBundle = struct {
    chainreport: FactionChainReportSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "chainreport", .key = "chainreport", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"chainreport\",\"Key\":\"chainreport\",\"Type\":{\"name\":\"FactionChainReportSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainReportDetailsSummary = struct {
    chain: ?u64,
    respect: ?f64,
    members: ?u64,
    targets: ?u64,
    war: ?u64,
    best: ?f64,
    leave: ?u64,
    mug: ?u64,
    hospitalize: ?u64,
    assists: ?u64,
    retaliations: ?u64,
    overseas: ?u64,
    draws: ?u64,
    escapes: ?u64,
    losses: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "targets", .key = "targets", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "war", .key = "war", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "best", .key = "best", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "leave", .key = "leave", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "mug", .key = "mug", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "hospitalize", .key = "hospitalize", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "assists", .key = "assists", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "retaliations", .key = "retaliations", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "overseas", .key = "overseas", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "draws", .key = "draws", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "escapes", .key = "escapes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "losses", .key = "losses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"targets\",\"Key\":\"targets\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"war\",\"Key\":\"war\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"best\",\"Key\":\"best\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"leave\",\"Key\":\"leave\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"mug\",\"Key\":\"mug\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"hospitalize\",\"Key\":\"hospitalize\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"assists\",\"Key\":\"assists\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"retaliations\",\"Key\":\"retaliations\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"overseas\",\"Key\":\"overseas\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"draws\",\"Key\":\"draws\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"escapes\",\"Key\":\"escapes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"losses\",\"Key\":\"losses\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainReportSummary = struct {
    id: ?u64,
    faction_id: ?u64,
    start: ?u64,
    end: ?u64,
    details: ?FactionChainReportDetailsSummary,
    bonuses: []const FactionChainReportBonusSummary,
    attackers: []const FactionChainReportAttackerSummary,
    non_attackers: []const u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonuses", .key = "bonuses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attackers", .key = "attackers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "non_attackers", .key = "non_attackers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionChainReportDetailsSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonuses\",\"Key\":\"bonuses\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionChainReportBonusSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attackers\",\"Key\":\"attackers\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionChainReportAttackerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"non_attackers\",\"Key\":\"non_attackers\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainSummary = struct {
    id: ?u64,
    chain: ?u64,
    respect: ?f64,
    start: ?u64,
    end: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainWarfareSummary = struct {
    id: ?u64,
    chain: ?u64,
    respect: ?f64,
    start: ?u64,
    end: ?u64,
    faction: ?FactionWarfareFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionWarfareFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionChainsBundle = struct {
    chains: []const FactionChainSummary,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "chains", .key = "chains", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"chains\",\"Key\":\"chains\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionChainSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionContributorSummary = struct {
    id: ?u64,
    username: ?[]const u8,
    value: ?i64,
    in_faction: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "username", .key = "username", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "in_faction", .key = "in_faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"username\",\"Key\":\"username\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"in_faction\",\"Key\":\"in_faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionContributorsBundle = struct {
    contributors: []const FactionContributorSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "contributors", .key = "contributors", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"contributors\",\"Key\":\"contributors\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionContributorSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrime = struct {
    id: ?u64,
    previous_crime_id: ?u64,
    name: ?[]const u8,
    difficulty: ?u32,
    status: ?[]const u8,
    created_at: ?u64,
    planning_at: ?u64,
    ready_at: ?u64,
    expired_at: ?u64,
    executed_at: ?u64,
    slots: []const FactionCrimeSlot,
    rewards: ?FactionCrimeReward,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "previous_crime_id", .key = "previous_crime_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "difficulty", .key = "difficulty", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "created_at", .key = "created_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "planning_at", .key = "planning_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ready_at", .key = "ready_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "expired_at", .key = "expired_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "executed_at", .key = "executed_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "slots", .key = "slots", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rewards", .key = "rewards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"previous_crime_id\",\"Key\":\"previous_crime_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"difficulty\",\"Key\":\"difficulty\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"created_at\",\"Key\":\"created_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"planning_at\",\"Key\":\"planning_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ready_at\",\"Key\":\"ready_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"expired_at\",\"Key\":\"expired_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"executed_at\",\"Key\":\"executed_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"slots\",\"Key\":\"slots\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionCrimeSlot\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rewards\",\"Key\":\"rewards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionCrimeReward\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeBundle = struct {
    crime: FactionCrime,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "crime", .key = "crime", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"crime\",\"Key\":\"crime\",\"Type\":{\"name\":\"FactionCrime\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeExpBundle = struct {
    crimeexp: FactionCrimeExpSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "crimeexp", .key = "crimeexp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"crimeexp\",\"Key\":\"crimeexp\",\"Type\":{\"name\":\"FactionCrimeExpSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeExpEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    crime_exp: ?i64,
    position: ?[]const u8,
    rank: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "crime_exp", .key = "crimeexp", .aliases = &.{
            "crime_exp",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"crime_exp\",\"Key\":\"crimeexp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"crime_exp\"],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeExpSelection = union(enum) {
    v0: model.Map(FactionCrimeExpEntry),
    v1: []const FactionCrimeExpEntry,
    v2: model.Raw,
    pub const compatibility_name = "FactionCrimeExpSelection";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"FactionCrimeExpEntry\"}]},{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionCrimeExpEntry\"}]},{\"name\":\"raw\"}],\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeItemRequirement = struct {
    id: ?u64,
    is_reusable: ?bool,
    is_available: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_reusable", .key = "is_reusable", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_available", .key = "is_available", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_reusable\",\"Key\":\"is_reusable\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_available\",\"Key\":\"is_available\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimePositionInfo = struct {
    id: ?[]const u8,
    label: ?[]const u8,
    number: ?u32,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "label", .key = "label", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "number", .key = "number", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"label\",\"Key\":\"label\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"number\",\"Key\":\"number\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeReward = struct {
    money: ?i64,
    items: []const FactionCrimeRewardItem,
    respect: ?i64,
    scope: ?u32,
    payout: ?FactionCrimeRewardPayout,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "scope", .key = "scope", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "payout", .key = "payout", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionCrimeRewardItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"scope\",\"Key\":\"scope\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"payout\",\"Key\":\"payout\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionCrimeRewardPayout\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeRewardItem = struct {
    id: ?u64,
    quantity: ?u32,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeRewardPayout = struct {
    payout_type: ?[]const u8,
    percentage: ?f64,
    paid_by: ?u64,
    paid_at: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "payout_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "percentage", .key = "percentage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "paid_by", .key = "paid_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "paid_at", .key = "paid_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"payout_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"percentage\",\"Key\":\"percentage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"paid_by\",\"Key\":\"paid_by\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"paid_at\",\"Key\":\"paid_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeSlot = struct {
    position: ?[]const u8,
    position_info: ?FactionCrimePositionInfo,
    item_requirement: ?FactionCrimeItemRequirement,
    user: ?FactionCrimeUser,
    checkpoint_pass_rate: ?u32,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position_info", .key = "position_info", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_requirement", .key = "item_requirement", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "checkpoint_pass_rate", .key = "checkpoint_pass_rate", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position_info\",\"Key\":\"position_info\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionCrimePositionInfo\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_requirement\",\"Key\":\"item_requirement\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionCrimeItemRequirement\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionCrimeUser\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"checkpoint_pass_rate\",\"Key\":\"checkpoint_pass_rate\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeUser = struct {
    id: ?u64,
    outcome: ?[]const u8,
    outcome_duration: ?u32,
    item_outcome: ?FactionCrimeUserItemOutcome,
    joined_at: ?u64,
    progress: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "outcome", .key = "outcome", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "outcome_duration", .key = "outcome_duration", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_outcome", .key = "item_outcome", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "joined_at", .key = "joined_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "progress", .key = "progress", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"outcome\",\"Key\":\"outcome\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"outcome_duration\",\"Key\":\"outcome_duration\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_outcome\",\"Key\":\"item_outcome\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionCrimeUserItemOutcome\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"joined_at\",\"Key\":\"joined_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"progress\",\"Key\":\"progress\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimeUserItemOutcome = struct {
    owned_by: ?[]const u8,
    item_id: ?u64,
    item_uid: ?u64,
    outcome: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "owned_by", .key = "owned_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_id", .key = "item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_uid", .key = "item_uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "outcome", .key = "outcome", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"owned_by\",\"Key\":\"owned_by\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_id\",\"Key\":\"item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_uid\",\"Key\":\"item_uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"outcome\",\"Key\":\"outcome\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionCrimesBundle = struct {
    crimes: []const FactionCrime,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "crimes", .key = "crimes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"crimes\",\"Key\":\"crimes\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionCrime\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionDrugsBundle = struct {
    drugs: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "drugs", .key = "drugs", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"drugs\",\"Key\":\"drugs\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionHofBundle = struct {
    hof: FactionHofSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "hof", .key = "hof", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"hof\",\"Key\":\"hof\",\"Type\":{\"name\":\"FactionHofSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionHofSummary = struct {
    rank: ?FactionHofValueString,
    respect: ?FactionHofValue,
    chain: ?FactionHofValue,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionHofValueString\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionHofValue = struct {
    rank: ?u64,
    value: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionHofValueString = struct {
    rank: ?[]const u8,
    value: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionLastAction = struct {
    status: ?[]const u8,
    relative: ?[]const u8,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "relative", .key = "relative", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"relative\",\"Key\":\"relative\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionLegacyItemEntry = struct {
    id: ?u64,
    item_id: ?u64,
    uid: ?u64,
    name: ?[]const u8,
    item_type: ?[]const u8,
    category: ?[]const u8,
    quantity: ?i64,
    available: ?i64,
    loaned: ?i64,
    loaned_to: ?FactionLegacyItemLoanTarget,
    market_price: ?i64,
    average_price: ?i64,
    damage: ?f64,
    accuracy: ?f64,
    armor: ?f64,
    quality: ?f64,
    bonus: ?[]const u8,
    required: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "ID", .aliases = &.{
            "id",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_id", .key = "item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "category", .key = "category", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "available", .key = "available", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "loaned", .key = "loaned", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "loaned_to", .key = "loaned_to", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market_price", .key = "market_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "average_price", .key = "average_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "damage", .key = "damage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "accuracy", .key = "accuracy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "armor", .key = "armor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quality", .key = "quality", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonus", .key = "bonus", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "required", .key = "required", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"ID\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"id\"],\"Custom\":\"\"},{\"Name\":\"item_id\",\"Key\":\"item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"category\",\"Key\":\"category\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"available\",\"Key\":\"available\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"loaned\",\"Key\":\"loaned\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"loaned_to\",\"Key\":\"loaned_to\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionLegacyItemLoanTarget\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market_price\",\"Key\":\"market_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"average_price\",\"Key\":\"average_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"damage\",\"Key\":\"damage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"accuracy\",\"Key\":\"accuracy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"armor\",\"Key\":\"armor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quality\",\"Key\":\"quality\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonus\",\"Key\":\"bonus\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"required\",\"Key\":\"required\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionLegacyItemLoanTarget = union(enum) {
    v0: u64,
    v1: []const u8,
    v2: FactionLegacyItemLoanUser,
    v3: bool,
    pub const compatibility_name = "FactionLegacyItemLoanTarget";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"uint64\"},{\"name\":\"string\"},{\"name\":\"FactionLegacyItemLoanUser\"},{\"name\":\"bool\"}],\"Type\":{\"name\":\"\"}}";
};
pub const FactionLegacyItemLoanUser = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionLegacyItemSelection = union(enum) {
    v0: model.Map(FactionLegacyItemEntry),
    v1: []const FactionLegacyItemEntry,
    v2: model.Raw,
    pub const compatibility_name = "FactionLegacyItemSelection";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"FactionLegacyItemEntry\"}]},{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionLegacyItemEntry\"}]},{\"name\":\"raw\"}],\"Type\":{\"name\":\"\"}}";
};
pub const FactionLookupBundle = struct {
    selections: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionMedicalBundle = struct {
    medical: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "medical", .key = "medical", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"medical\",\"Key\":\"medical\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionMemberStatus = struct {
    state: ?[]const u8,
    color: ?[]const u8,
    description: ?[]const u8,
    details: ?[]const u8,
    plane_image_type: ?[]const u8,
    until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "state", .key = "state", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "color", .key = "color", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "plane_image_type", .key = "plane_image_type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "until", .key = "until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"state\",\"Key\":\"state\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"color\",\"Key\":\"color\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"plane_image_type\",\"Key\":\"plane_image_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"until\",\"Key\":\"until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionMemberSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    level: ?u32,
    position: ?[]const u8,
    days_in_faction: ?u32,
    is_revivable: ?bool,
    status: ?FactionMemberStatus,
    last_action: ?FactionLastAction,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "days_in_faction", .key = "days_in_faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_revivable", .key = "is_revivable", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_action", .key = "last_action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"days_in_faction\",\"Key\":\"days_in_faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_revivable\",\"Key\":\"is_revivable\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionMemberStatus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_action\",\"Key\":\"last_action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionLastAction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionMembersBundle = struct {
    members: []const FactionMemberSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionMemberSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionNewsBundle = struct {
    news: []const FactionNewsEntry,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "news", .key = "news", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"news\",\"Key\":\"news\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionNewsEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionNewsEntry = struct {
    id: ?[]const u8,
    text: ?[]const u8,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "text", .key = "text", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"text\",\"Key\":\"text\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionOngoingChainSummary = struct {
    id: ?u64,
    current: ?u64,
    max: ?u64,
    timeout: ?u64,
    modifier: ?f64,
    cooldown: ?u64,
    start: ?u64,
    end: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "max", .key = "max", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timeout", .key = "timeout", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifier", .key = "modifier", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cooldown", .key = "cooldown", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"max\",\"Key\":\"max\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timeout\",\"Key\":\"timeout\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifier\",\"Key\":\"modifier\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cooldown\",\"Key\":\"cooldown\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionPactSummary = struct {
    faction_id: ?u64,
    faction_name: ?[]const u8,
    until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_name", .key = "faction_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "until", .key = "until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_name\",\"Key\":\"faction_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"until\",\"Key\":\"until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionPositionSummary = struct {
    name: ?[]const u8,
    is_default: ?bool,
    abilities: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_default", .key = "is_default", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "abilities", .key = "abilities", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_default\",\"Key\":\"is_default\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"abilities\",\"Key\":\"abilities\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionPositionsBundle = struct {
    positions: []const FactionPositionSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "positions", .key = "positions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"positions\",\"Key\":\"positions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionPositionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRacketRewardSummary = struct {
    reward_type: ?[]const u8,
    quantity: ?i64,
    id: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "reward_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"reward_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRacketSummary = struct {
    territory: ?[]const u8,
    faction_id: ?u64,
    name: ?[]const u8,
    level: ?u64,
    description: ?[]const u8,
    reward: ?FactionRacketRewardSummary,
    created_at: ?u64,
    changed_at: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "territory", .key = "territory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reward", .key = "reward", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "created_at", .key = "created_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "changed_at", .key = "changed_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"territory\",\"Key\":\"territory\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reward\",\"Key\":\"reward\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRacketRewardSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"created_at\",\"Key\":\"created_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"changed_at\",\"Key\":\"changed_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRacketsBundle = struct {
    rackets: []const FactionRacketSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rackets", .key = "rackets", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rackets\",\"Key\":\"rackets\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRacketSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidReportAttackerSummary = struct {
    user: ?FactionRaidReportUserSummary,
    attacks: ?u64,
    damage: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "damage", .key = "damage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRaidReportUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"damage\",\"Key\":\"damage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidReportBundle = struct {
    raidreport: FactionRaidReportSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "raidreport", .key = "raidreport", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"raidreport\",\"Key\":\"raidreport\",\"Type\":{\"name\":\"FactionRaidReportSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidReportSideSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    score: ?f64,
    attackers: []const FactionRaidReportAttackerSummary,
    non_attackers: []const FactionRaidReportUserSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attackers", .key = "attackers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "non_attackers", .key = "non_attackers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attackers\",\"Key\":\"attackers\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRaidReportAttackerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"non_attackers\",\"Key\":\"non_attackers\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRaidReportUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidReportSummary = struct {
    id: ?u64,
    start: ?u64,
    end: ?u64,
    aggressor: ?FactionRaidReportSideSummary,
    defender: ?FactionRaidReportSideSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "aggressor", .key = "aggressor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defender", .key = "defender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"aggressor\",\"Key\":\"aggressor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRaidReportSideSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defender\",\"Key\":\"defender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRaidReportSideSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidReportUserSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidSummary = struct {
    id: ?u64,
    start: ?u64,
    end: ?u64,
    aggressor: ?FactionWarfareFactionSummary,
    defender: ?FactionWarfareFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "aggressor", .key = "aggressor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defender", .key = "defender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"aggressor\",\"Key\":\"aggressor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionWarfareFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defender\",\"Key\":\"defender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionWarfareFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidWarSummary = struct {
    war_id: ?u64,
    start: ?u64,
    end: ?u64,
    factions: []const FactionWarFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "war_id", .key = "war_id", .aliases = &.{
            "id",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "factions", .key = "factions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"war_id\",\"Key\":\"war_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"id\"],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"factions\",\"Key\":\"factions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionWarFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRaidsBundle = struct {
    raids: []const FactionRaidSummary,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "raids", .key = "raids", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"raids\",\"Key\":\"raids\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRaidSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRank = struct {
    division: ?u32,
    level: ?u32,
    name: ?[]const u8,
    position: ?u32,
    wins: ?u32,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "division", .key = "division", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "wins", .key = "wins", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"division\",\"Key\":\"division\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"wins\",\"Key\":\"wins\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarDetails = struct {
    war_id: ?u64,
    target: ?u64,
    start: ?u64,
    end: ?u64,
    winner: ?u64,
    factions: []const FactionWarFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "war_id", .key = "war_id", .aliases = &.{
            "id",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target", .key = "target", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "winner", .key = "winner", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "factions", .key = "factions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"war_id\",\"Key\":\"war_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"id\"],\"Custom\":\"\"},{\"Name\":\"target\",\"Key\":\"target\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"winner\",\"Key\":\"winner\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"factions\",\"Key\":\"factions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionWarFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarReportBundle = struct {
    rankedwarreport: FactionRankedWarReportSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rankedwarreport", .key = "rankedwarreport", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rankedwarreport\",\"Key\":\"rankedwarreport\",\"Type\":{\"name\":\"FactionRankedWarReportSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarReportFactionSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    score: ?f64,
    attacks: ?u64,
    rank: ?FactionRankedWarReportRankSummary,
    rewards: ?FactionRankedWarReportRewardsSummary,
    members: []const FactionRankedWarReportMemberSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rewards", .key = "rewards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRankedWarReportRankSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rewards\",\"Key\":\"rewards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRankedWarReportRewardsSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRankedWarReportMemberSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarReportMemberSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    level: ?u64,
    score: ?f64,
    attacks: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarReportRankSummary = struct {
    before: ?[]const u8,
    after: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "before", .key = "before", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "after", .key = "after", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"before\",\"Key\":\"before\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"after\",\"Key\":\"after\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarReportRewardItemSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    quantity: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarReportRewardsSummary = struct {
    respect: ?f64,
    points: ?u64,
    items: []const FactionRankedWarReportRewardItemSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRankedWarReportRewardItemSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarReportSummary = struct {
    id: ?u64,
    start: ?u64,
    end: ?u64,
    winner: ?u64,
    forfeit: ?bool,
    factions: []const FactionRankedWarReportFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "winner", .key = "winner", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "forfeit", .key = "forfeit", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "factions", .key = "factions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"winner\",\"Key\":\"winner\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"forfeit\",\"Key\":\"forfeit\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"factions\",\"Key\":\"factions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRankedWarReportFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarSummary = struct {
    id: ?u64,
    start: ?u64,
    end: ?u64,
    target: ?u64,
    winner: ?u64,
    factions: []const FactionWarFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{
            "war_id",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target", .key = "target", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "winner", .key = "winner", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "factions", .key = "factions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"war_id\"],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target\",\"Key\":\"target\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"winner\",\"Key\":\"winner\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"factions\",\"Key\":\"factions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionWarFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRankedWarsBundle = struct {
    rankedwars: []const FactionRankedWarSummary,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rankedwars", .key = "rankedwars", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rankedwars\",\"Key\":\"rankedwars\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRankedWarSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionReportsBundle = struct {
    reports: []const UserReportSummary,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "reports", .key = "reports", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"reports\",\"Key\":\"reports\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserReportSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRevivesBundle = struct {
    revives: []const UserRevive,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "revives", .key = "revives", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"revives\",\"Key\":\"revives\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserRevive\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionRevivesFullBundle = struct {
    revives: []const UserReviveFull,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "revives", .key = "revives", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"revives\",\"Key\":\"revives\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserReviveFull\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionSearchBundle = struct {
    search: []const FactionSearchSummary,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "search", .key = "search", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"search\",\"Key\":\"search\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionSearchSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionSearchLeader = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionSearchSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    respect: ?i64,
    members: ?u32,
    members_max: ?u32,
    leader: ?FactionSearchLeader,
    co_leader: ?FactionSearchLeader,
    image: ?[]const u8,
    tag_image: ?[]const u8,
    tag: ?[]const u8,
    is_destroyed: ?bool,
    is_recruiting: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members_max", .key = "members_max", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "leader", .key = "leader", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "co_leader", .key = "co_leader", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "image", .key = "image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tag_image", .key = "tag_image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tag", .key = "tag", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_destroyed", .key = "is_destroyed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_recruiting", .key = "is_recruiting", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members_max\",\"Key\":\"members_max\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"leader\",\"Key\":\"leader\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionSearchLeader\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"co_leader\",\"Key\":\"co_leader\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionSearchLeader\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"image\",\"Key\":\"image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tag_image\",\"Key\":\"tag_image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tag\",\"Key\":\"tag\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_destroyed\",\"Key\":\"is_destroyed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_recruiting\",\"Key\":\"is_recruiting\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionStatSummary = struct {
    name: ?[]const u8,
    value: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionStatsBundle = struct {
    stats: []const FactionStatSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionStatSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTemporaryBundle = struct {
    temporary: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "temporary", .key = "temporary", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"temporary\",\"Key\":\"temporary\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryBundle = struct {
    territory: []const FactionTerritorySummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "territory", .key = "territory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"territory\",\"Key\":\"territory\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionTerritorySummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryCoordinatesSummary = struct {
    x: ?f64,
    y: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "x", .key = "x", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "y", .key = "y", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"x\",\"Key\":\"x\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"y\",\"Key\":\"y\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryOwnershipBundle = struct {
    territory_ownership: []const FactionTerritoryOwnershipSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "territory_ownership", .key = "territoryOwnership", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"territory_ownership\",\"Key\":\"territoryOwnership\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionTerritoryOwnershipSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryOwnershipSummary = struct {
    id: ?[]const u8,
    irradiated: ?bool,
    owned_by: ?u64,
    acquired_at: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "irradiated", .key = "irradiated", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "owned_by", .key = "owned_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acquired_at", .key = "acquired_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"irradiated\",\"Key\":\"irradiated\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"owned_by\",\"Key\":\"owned_by\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acquired_at\",\"Key\":\"acquired_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritorySummary = struct {
    id: ?[]const u8,
    acquired_at: ?u64,
    sector: ?u64,
    size: ?u64,
    density: ?u64,
    slots: ?u64,
    respect: ?u64,
    coordinates: ?FactionTerritoryCoordinatesSummary,
    racket: ?FactionRacketSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acquired_at", .key = "acquired_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sector", .key = "sector", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "size", .key = "size", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "density", .key = "density", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "slots", .key = "slots", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "coordinates", .key = "coordinates", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "racket", .key = "racket", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acquired_at\",\"Key\":\"acquired_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sector\",\"Key\":\"sector\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"size\",\"Key\":\"size\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"density\",\"Key\":\"density\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"slots\",\"Key\":\"slots\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"coordinates\",\"Key\":\"coordinates\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionTerritoryCoordinatesSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"racket\",\"Key\":\"racket\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRacketSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarHistoryEntry = struct {
    id: ?u64,
    war_id: ?u64,
    territory: ?[]const u8,
    start: ?u64,
    end: ?u64,
    target: ?u64,
    result: ?[]const u8,
    factions: []const FactionTerritoryWarParticipantSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "war_id", .key = "war_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "territory", .key = "territory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target", .key = "target", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "result", .key = "result", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "factions", .key = "factions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"war_id\",\"Key\":\"war_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"territory\",\"Key\":\"territory\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target\",\"Key\":\"target\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"result\",\"Key\":\"result\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"factions\",\"Key\":\"factions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionTerritoryWarParticipantSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarParticipantSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    score: ?f64,
    is_aggressor: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_aggressor", .key = "is_aggressor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_aggressor\",\"Key\":\"is_aggressor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarReportBundle = struct {
    territorywarreport: FactionTerritoryWarReportSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "territorywarreport", .key = "territorywarreport", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"territorywarreport\",\"Key\":\"territorywarreport\",\"Type\":{\"name\":\"FactionTerritoryWarReportSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarReportFactionSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    score: ?f64,
    is_aggressor: ?bool,
    clears: ?u64,
    joins: ?u64,
    members: []const FactionTerritoryWarReportMemberSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_aggressor", .key = "is_aggressor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "clears", .key = "clears", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "joins", .key = "joins", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_aggressor\",\"Key\":\"is_aggressor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"clears\",\"Key\":\"clears\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"joins\",\"Key\":\"joins\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionTerritoryWarReportMemberSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarReportMemberSummary = struct {
    id: ?u64,
    username: ?[]const u8,
    level: ?u64,
    score: ?f64,
    joins: ?u64,
    clears: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "username", .key = "username", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "joins", .key = "joins", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "clears", .key = "clears", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"username\",\"Key\":\"username\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"joins\",\"Key\":\"joins\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"clears\",\"Key\":\"clears\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarReportSummary = struct {
    id: ?u64,
    territory: ?[]const u8,
    started_at: ?u64,
    ended_at: ?u64,
    winner: ?u64,
    result: ?[]const u8,
    factions: []const FactionTerritoryWarReportFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "territory", .key = "territory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "started_at", .key = "started_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ended_at", .key = "ended_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "winner", .key = "winner", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "result", .key = "result", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "factions", .key = "factions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"territory\",\"Key\":\"territory\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"started_at\",\"Key\":\"started_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ended_at\",\"Key\":\"ended_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"winner\",\"Key\":\"winner\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"result\",\"Key\":\"result\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"factions\",\"Key\":\"factions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionTerritoryWarReportFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarfareSummary = struct {
    id: ?u64,
    territory: ?[]const u8,
    start: ?u64,
    end: ?u64,
    target: ?u64,
    result: ?[]const u8,
    aggressor: ?FactionWarfareFactionSummary,
    defender: ?FactionWarfareFactionSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "territory", .key = "territory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target", .key = "target", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "result", .key = "result", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "aggressor", .key = "aggressor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defender", .key = "defender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"territory\",\"Key\":\"territory\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target\",\"Key\":\"target\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"result\",\"Key\":\"result\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"aggressor\",\"Key\":\"aggressor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionWarfareFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defender\",\"Key\":\"defender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionWarfareFactionSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTerritoryWarsBundle = struct {
    territorywars: []const FactionTerritoryWarHistoryEntry,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "territorywars", .key = "territorywars", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"territorywars\",\"Key\":\"territorywars\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionTerritoryWarHistoryEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionTimestampBundle = struct {
    timestamp: ?u64,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionUnknownWarfareEntry = struct {
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionUpgradeBranch = struct {
    name: ?[]const u8,
    order: ?u32,
    multiplier: ?f64,
    upgrades: []const FactionUpgradeDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "order", .key = "order", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "multiplier", .key = "multiplier", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upgrades", .key = "upgrades", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"order\",\"Key\":\"order\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"multiplier\",\"Key\":\"multiplier\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upgrades\",\"Key\":\"upgrades\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionUpgradeDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionUpgradeCore = struct {
    upgrades: []const FactionUpgradeDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "upgrades", .key = "upgrades", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"upgrades\",\"Key\":\"upgrades\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionUpgradeDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionUpgradeDetails = struct {
    id: ?u64,
    name: ?[]const u8,
    ability: ?[]const u8,
    level: ?u32,
    cost: ?i64,
    unlocked_at: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ability", .key = "ability", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "unlocked_at", .key = "unlocked_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ability\",\"Key\":\"ability\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"unlocked_at\",\"Key\":\"unlocked_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionUpgradesBundle = struct {
    state: ?[]const u8,
    upgrades: ?FactionUpgradesSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "state", .key = "state", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upgrades", .key = "upgrades", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"state\",\"Key\":\"state\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upgrades\",\"Key\":\"upgrades\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionUpgradesSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionUpgradesSummary = struct {
    core: ?FactionUpgradeCore,
    peace: []const FactionUpgradeBranch,
    war: []const FactionUpgradeBranch,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "core", .key = "core", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "peace", .key = "peace", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "war", .key = "war", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"core\",\"Key\":\"core\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionUpgradeCore\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"peace\",\"Key\":\"peace\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionUpgradeBranch\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"war\",\"Key\":\"war\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionUpgradeBranch\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionUtilitiesBundle = struct {
    utilities: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "utilities", .key = "utilities", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"utilities\",\"Key\":\"utilities\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarFactionSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    score: ?f64,
    chain: ?u64,
    is_aggressor: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_aggressor", .key = "is_aggressor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_aggressor\",\"Key\":\"is_aggressor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarfareBundle = struct {
    warfare: []const FactionWarfareEntry,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "warfare", .key = "warfare", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"warfare\",\"Key\":\"warfare\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionWarfareEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarfareEntry = union(enum) {
    v0: FactionRankedWarDetails,
    v1: FactionTerritoryWarfareSummary,
    v2: FactionChainWarfareSummary,
    v3: FactionRaidSummary,
    v4: FactionUnknownWarfareEntry,
    pub const compatibility_name = "FactionWarfareEntry";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"FactionRankedWarDetails\"},{\"name\":\"FactionTerritoryWarfareSummary\"},{\"name\":\"FactionChainWarfareSummary\"},{\"name\":\"FactionRaidSummary\"},{\"name\":\"FactionUnknownWarfareEntry\"}],\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarfareFactionSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    score: ?f64,
    chain: ?u64,
    is_aggressor: ?bool,
    respect_lost: ?i64,
    players_on_wall: []const FactionWarfareWallPlayerSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_aggressor", .key = "is_aggressor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect_lost", .key = "respect_lost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "players_on_wall", .key = "players_on_wall", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_aggressor\",\"Key\":\"is_aggressor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect_lost\",\"Key\":\"respect_lost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"players_on_wall\",\"Key\":\"players_on_wall\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionWarfareWallPlayerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarfareUserSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarfareWallPlayerSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarsBundle = struct {
    wars: FactionWarsSummary,
    pacts: []const FactionPactSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "wars", .key = "wars", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "pacts", .key = "pacts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"wars\",\"Key\":\"wars\",\"Type\":{\"name\":\"FactionWarsSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"pacts\",\"Key\":\"pacts\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionPactSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWarsSummary = struct {
    raids: []const FactionRaidWarSummary,
    ranked: ?FactionRankedWarDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "raids", .key = "raids", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ranked", .key = "ranked", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"raids\",\"Key\":\"raids\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"FactionRaidWarSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ranked\",\"Key\":\"ranked\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"FactionRankedWarDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const FactionWeaponsBundle = struct {
    weapons: FactionLegacyItemSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "weapons", .key = "weapons", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"weapons\",\"Key\":\"weapons\",\"Type\":{\"name\":\"FactionLegacyItemSelection\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumCategoriesBundle = struct {
    categories: []const ForumCategory,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "categories", .key = "categories", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"categories\",\"Key\":\"categories\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"ForumCategory\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumCategory = struct {
    id: ?u64,
    title: ?[]const u8,
    acronym: ?[]const u8,
    threads: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acronym", .key = "acronym", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "threads", .key = "threads", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acronym\",\"Key\":\"acronym\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"threads\",\"Key\":\"threads\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumLookupBundle = struct {
    selections: []const []const u8,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumPoll = struct {
    question: ?[]const u8,
    answers_count: ?u64,
    answers: []const ForumPollAnswer,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "question", .key = "question", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "answers_count", .key = "answers_count", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "answers", .key = "answers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"question\",\"Key\":\"question\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"answers_count\",\"Key\":\"answers_count\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"answers\",\"Key\":\"answers\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"ForumPollAnswer\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumPollAnswer = struct {
    answer: ?[]const u8,
    votes: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "answer", .key = "answer", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "votes", .key = "votes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"answer\",\"Key\":\"answer\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"votes\",\"Key\":\"votes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumPost = struct {
    id: ?u64,
    thread_id: ?u64,
    author: ?ForumUserSummary,
    is_legacy: ?bool,
    is_topic: ?bool,
    is_edited: ?bool,
    is_pinned: ?bool,
    created_time: ?u64,
    edited_by: ?u64,
    has_quote: ?bool,
    quoted_post_id: ?u64,
    content: ?[]const u8,
    likes: ?u64,
    dislikes: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "thread_id", .key = "thread_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "author", .key = "author", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_legacy", .key = "is_legacy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_topic", .key = "is_topic", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_edited", .key = "is_edited", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_pinned", .key = "is_pinned", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "created_time", .key = "created_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "edited_by", .key = "edited_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "has_quote", .key = "has_quote", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quoted_post_id", .key = "quoted_post_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "content", .key = "content", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "likes", .key = "likes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dislikes", .key = "dislikes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"thread_id\",\"Key\":\"thread_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"author\",\"Key\":\"author\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"ForumUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_legacy\",\"Key\":\"is_legacy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_topic\",\"Key\":\"is_topic\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_edited\",\"Key\":\"is_edited\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_pinned\",\"Key\":\"is_pinned\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"created_time\",\"Key\":\"created_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"edited_by\",\"Key\":\"edited_by\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"has_quote\",\"Key\":\"has_quote\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quoted_post_id\",\"Key\":\"quoted_post_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"content\",\"Key\":\"content\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"likes\",\"Key\":\"likes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dislikes\",\"Key\":\"dislikes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumPostsBundle = struct {
    posts: []const ForumPost,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "posts", .key = "posts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"posts\",\"Key\":\"posts\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"ForumPost\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumThread = struct {
    id: ?u64,
    title: ?[]const u8,
    forum_id: ?u64,
    posts: ?u64,
    views: ?u64,
    rating: ?i64,
    is_locked: ?bool,
    is_sticky: ?bool,
    has_poll: ?bool,
    first_post_time: ?u64,
    last_post_time: ?u64,
    content: ?[]const u8,
    content_raw: ?[]const u8,
    poll: ?ForumPoll,
    author: ?ForumUserSummary,
    last_poster: ?ForumUserSummary,
    new_posts: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "forum_id", .key = "forum_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "posts", .key = "posts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "views", .key = "views", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rating", .key = "rating", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_locked", .key = "is_locked", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_sticky", .key = "is_sticky", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "has_poll", .key = "has_poll", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "first_post_time", .key = "first_post_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_post_time", .key = "last_post_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "content", .key = "content", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "content_raw", .key = "content_raw", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "poll", .key = "poll", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "author", .key = "author", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_poster", .key = "last_poster", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "new_posts", .key = "new_posts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"forum_id\",\"Key\":\"forum_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"posts\",\"Key\":\"posts\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"views\",\"Key\":\"views\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rating\",\"Key\":\"rating\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_locked\",\"Key\":\"is_locked\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_sticky\",\"Key\":\"is_sticky\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"has_poll\",\"Key\":\"has_poll\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"first_post_time\",\"Key\":\"first_post_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_post_time\",\"Key\":\"last_post_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"content\",\"Key\":\"content\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"content_raw\",\"Key\":\"content_raw\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"poll\",\"Key\":\"poll\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"ForumPoll\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"author\",\"Key\":\"author\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"ForumUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_poster\",\"Key\":\"last_poster\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"ForumUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"new_posts\",\"Key\":\"new_posts\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumThreadBundle = struct {
    thread: ForumThread,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "thread", .key = "thread", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"thread\",\"Key\":\"thread\",\"Type\":{\"name\":\"ForumThread\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumThreadsBundle = struct {
    threads: []const ForumThread,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "threads", .key = "threads", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"threads\",\"Key\":\"threads\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"ForumThread\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumTimestampBundle = struct {
    timestamp: ?u64,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const ForumUserSummary = struct {
    id: ?u64,
    username: ?[]const u8,
    karma: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "username", .key = "username", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "karma", .key = "karma", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"username\",\"Key\":\"username\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"karma\",\"Key\":\"karma\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyAccess = struct {
    access_type: ?[]const u8,
    level: ?u32,
    company: ?bool,
    faction: ?bool,
    log: ?KeyLogAccess,
    custom_permissions: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "access_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company", .key = "company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "log", .key = "log", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "custom_permissions", .key = "custom_permissions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"access_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company\",\"Key\":\"company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"log\",\"Key\":\"log\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"KeyLogAccess\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"custom_permissions\",\"Key\":\"custom_permissions\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyInfo = struct {
    access: ?KeyAccess,
    selections: ?KeySelections,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "access", .key = "access", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"access\",\"Key\":\"access\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"KeyAccess\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"KeySelections\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyInfoBundle = struct {
    info: KeyInfo,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "info", .key = "info", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"info\",\"Key\":\"info\",\"Type\":{\"name\":\"KeyInfo\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyLogAccess = struct {
    available: []const KeyLogCategoryAccess,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "available", .key = "available", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"available\",\"Key\":\"available\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"KeyLogCategoryAccess\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyLogBundle = struct {
    log: []const KeyLogEntry,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "log", .key = "log", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"log\",\"Key\":\"log\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"KeyLogEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyLogCategoryAccess = struct {
    category_id: ?u64,
    log_ids: []const u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "category_id", .key = "category_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "log_ids", .key = "log_ids", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"category_id\",\"Key\":\"category_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"log_ids\",\"Key\":\"log_ids\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyLogEntry = struct {
    timestamp: ?u64,
    entry_type: ?[]const u8,
    selections: ?[]const u8,
    id: ?KeyLogTargetId,
    comment: ?[]const u8,
    ip: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "entry_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "comment", .key = "comment", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ip", .key = "ip", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"entry_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"KeyLogTargetId\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"comment\",\"Key\":\"comment\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ip\",\"Key\":\"ip\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const KeyLogTargetId = union(enum) {
    v0: u64,
    v1: []const u8,
    pub const compatibility_name = "KeyLogTargetId";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"uint64\"},{\"name\":\"string\"}],\"Type\":{\"name\":\"\"}}";
};
pub const KeySelections = struct {
    user: []const []const u8,
    faction: []const []const u8,
    forum: []const []const u8,
    key: []const []const u8,
    market: []const []const u8,
    property: []const []const u8,
    racing: []const []const u8,
    torn: []const []const u8,
    company: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "forum", .key = "forum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "key", .key = "key", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market", .key = "market", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "property", .key = "property", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "racing", .key = "racing", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "torn", .key = "torn", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company", .key = "company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"forum\",\"Key\":\"forum\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"key\",\"Key\":\"key\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market\",\"Key\":\"market\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"property\",\"Key\":\"property\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"racing\",\"Key\":\"racing\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"torn\",\"Key\":\"torn\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company\",\"Key\":\"company\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketAuctionHouseBundle = struct {
    auctionhouse: []const MarketAuctionHouseListing,
    _metadata: ?MarketMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "auctionhouse", .key = "auctionhouse", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"auctionhouse\",\"Key\":\"auctionhouse\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketAuctionHouseListing\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketAuctionHouseListing = struct {
    id: ?u64,
    seller: ?MarketUserSummary,
    buyer: ?MarketUserSummary,
    timestamp: ?u64,
    price: ?u64,
    bids: ?u64,
    item: ?MarketAuctionItem,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "seller", .key = "seller", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "buyer", .key = "buyer", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bids", .key = "bids", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item", .key = "item", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"seller\",\"Key\":\"seller\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"buyer\",\"Key\":\"buyer\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bids\",\"Key\":\"bids\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item\",\"Key\":\"item\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketAuctionItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketAuctionHouseListingBundle = struct {
    auctionhouselisting: MarketAuctionHouseListing,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "auctionhouselisting", .key = "auctionhouselisting", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"auctionhouselisting\",\"Key\":\"auctionhouselisting\",\"Type\":{\"name\":\"MarketAuctionHouseListing\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketAuctionItem = struct {
    id: ?u64,
    uid: ?u64,
    name: ?[]const u8,
    item_type: ?[]const u8,
    sub_type: ?[]const u8,
    stats: ?MarketItemStats,
    bonuses: []const MarketItemBonus,
    rarity: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sub_type", .key = "sub_type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonuses", .key = "bonuses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rarity", .key = "rarity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sub_type\",\"Key\":\"sub_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketItemStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonuses\",\"Key\":\"bonuses\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketItemBonus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rarity\",\"Key\":\"rarity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketBazaar = struct {
    advanced_item: []const MarketBazaarSellerSummary,
    bargain: []const MarketBazaarSellerSummary,
    bulk: []const MarketBazaarSellerSummary,
    busiest: []const MarketBazaarSellerSummary,
    dollar_sale: []const MarketBazaarSellerSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "advanced_item", .key = "advanced_item", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bargain", .key = "bargain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bulk", .key = "bulk", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "busiest", .key = "busiest", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dollar_sale", .key = "dollar_sale", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"advanced_item\",\"Key\":\"advanced_item\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketBazaarSellerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bargain\",\"Key\":\"bargain\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketBazaarSellerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bulk\",\"Key\":\"bulk\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketBazaarSellerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"busiest\",\"Key\":\"busiest\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketBazaarSellerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dollar_sale\",\"Key\":\"dollar_sale\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketBazaarSellerSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketBazaarBundle = struct {
    bazaar: MarketBazaar,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "bazaar", .key = "bazaar", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"bazaar\",\"Key\":\"bazaar\",\"Type\":{\"name\":\"MarketBazaar\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketBazaarSellerSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    is_open: ?bool,
    weekly_customers: ?u64,
    advanced_item_sales: ?u64,
    bargain_sales: ?u64,
    bulk_sales: ?u64,
    dollar_sales: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_open", .key = "is_open", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "weekly_customers", .key = "weekly_customers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "advanced_item_sales", .key = "advanced_item_sales", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bargain_sales", .key = "bargain_sales", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bulk_sales", .key = "bulk_sales", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dollar_sales", .key = "dollar_sales", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_open\",\"Key\":\"is_open\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"weekly_customers\",\"Key\":\"weekly_customers\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"advanced_item_sales\",\"Key\":\"advanced_item_sales\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bargain_sales\",\"Key\":\"bargain_sales\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bulk_sales\",\"Key\":\"bulk_sales\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dollar_sales\",\"Key\":\"dollar_sales\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketItemBonus = struct {
    id: ?u64,
    title: ?[]const u8,
    description: ?[]const u8,
    value: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketItemDetails = struct {
    uid: ?u64,
    rarity: ?[]const u8,
    stats: ?MarketItemStats,
    bonuses: []const MarketItemBonus,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rarity", .key = "rarity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonuses", .key = "bonuses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rarity\",\"Key\":\"rarity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketItemStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonuses\",\"Key\":\"bonuses\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketItemBonus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketItemMarket = struct {
    cache_timestamp: ?u64,
    cache_delay: ?u64,
    total: ?u64,
    item: ?MarketItemSummary,
    listings: []const MarketListingSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cache_timestamp", .key = "cache_timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cache_delay", .key = "cache_delay", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item", .key = "item", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "listings", .key = "listings", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cache_timestamp\",\"Key\":\"cache_timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cache_delay\",\"Key\":\"cache_delay\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item\",\"Key\":\"item\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketItemSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"listings\",\"Key\":\"listings\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketListingSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketItemMarketBundle = struct {
    itemmarket: MarketItemMarket,
    _metadata: ?MarketMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "itemmarket", .key = "itemmarket", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"itemmarket\",\"Key\":\"itemmarket\",\"Type\":{\"name\":\"MarketItemMarket\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketItemStats = struct {
    damage: ?f64,
    accuracy: ?f64,
    armor: ?f64,
    quality: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "damage", .key = "damage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "accuracy", .key = "accuracy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "armor", .key = "armor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quality", .key = "quality", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"damage\",\"Key\":\"damage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"accuracy\",\"Key\":\"accuracy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"armor\",\"Key\":\"armor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quality\",\"Key\":\"quality\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketItemSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    item_type: ?[]const u8,
    average_price: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "average_price", .key = "average_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"average_price\",\"Key\":\"average_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketListingSummary = struct {
    amount: ?u64,
    price: ?u64,
    item_details: ?MarketItemDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_details", .key = "item_details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_details\",\"Key\":\"item_details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketItemDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketLookupBundle = struct {
    selections: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketMetadata = PaginatedMetadataWithTotal;
pub const MarketPaginationLinks = PaginatedLinks;
pub const MarketPointsMarketBundle = struct {
    pointsmarket: model.Map(MarketPointsMarketListing),
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "pointsmarket", .key = "pointsmarket", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"pointsmarket\",\"Key\":\"pointsmarket\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"MarketPointsMarketListing\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketPointsMarketListing = struct {
    cost: ?u64,
    quantity: ?u64,
    total_cost: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total_cost", .key = "total_cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total_cost\",\"Key\":\"total_cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketPropertiesBundle = struct {
    properties: MarketPropertyCatalog,
    properties_timestamp: ?u64,
    properties_delay: ?u64,
    _metadata: ?MarketMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "properties", .key = "properties", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "properties_timestamp", .key = "properties_timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "properties_delay", .key = "properties_delay", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"properties\",\"Key\":\"properties\",\"Type\":{\"name\":\"MarketPropertyCatalog\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"properties_timestamp\",\"Key\":\"properties_timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"properties_delay\",\"Key\":\"properties_delay\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketPropertyCatalog = struct {
    total: ?u64,
    listings: []const MarketPropertyListing,
    property: ?MarketPropertyTypeSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "listings", .key = "listings", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "property", .key = "property", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"listings\",\"Key\":\"listings\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketPropertyListing\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"property\",\"Key\":\"property\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketPropertyTypeSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketPropertyListing = struct {
    happy: ?u64,
    cost: ?u64,
    market_price: ?u64,
    upkeep: ?u64,
    modifications: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "happy", .key = "happy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market_price", .key = "market_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upkeep", .key = "upkeep", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifications", .key = "modifications", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"happy\",\"Key\":\"happy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market_price\",\"Key\":\"market_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upkeep\",\"Key\":\"upkeep\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifications\",\"Key\":\"modifications\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketPropertyTypeSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketRentalCatalog = struct {
    total: ?u64,
    listings: []const MarketRentalListing,
    property: ?MarketPropertyTypeSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "listings", .key = "listings", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "property", .key = "property", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"listings\",\"Key\":\"listings\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"MarketRentalListing\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"property\",\"Key\":\"property\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketPropertyTypeSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketRentalListing = struct {
    happy: ?u64,
    cost: ?u64,
    cost_per_day: ?u64,
    rental_period: ?u64,
    market_price: ?u64,
    upkeep: ?u64,
    modifications: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "happy", .key = "happy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost_per_day", .key = "cost_per_day", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rental_period", .key = "rental_period", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market_price", .key = "market_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upkeep", .key = "upkeep", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifications", .key = "modifications", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"happy\",\"Key\":\"happy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost_per_day\",\"Key\":\"cost_per_day\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rental_period\",\"Key\":\"rental_period\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market_price\",\"Key\":\"market_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upkeep\",\"Key\":\"upkeep\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifications\",\"Key\":\"modifications\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketRentalsBundle = struct {
    rentals: MarketRentalCatalog,
    rentals_timestamp: ?u64,
    rentals_delay: ?u64,
    _metadata: ?MarketMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rentals", .key = "rentals", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "rentals_timestamp", .key = "rentals_timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rentals_delay", .key = "rentals_delay", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rentals\",\"Key\":\"rentals\",\"Type\":{\"name\":\"MarketRentalCatalog\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rentals_timestamp\",\"Key\":\"rentals_timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rentals_delay\",\"Key\":\"rentals_delay\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"MarketMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketTimestampBundle = struct {
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const MarketUserSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PaginatedLinks = struct {
    prev: ?[]const u8,
    next: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "prev", .key = "prev", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "next", .key = "next", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"prev\",\"Key\":\"prev\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"next\",\"Key\":\"next\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PaginatedMetadata = struct {
    links: ?PaginatedLinks,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "links", .key = "links", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"links\",\"Key\":\"links\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedLinks\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PaginatedMetadataWithTotal = struct {
    links: ?PaginatedLinks,
    total: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "links", .key = "links", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"links\",\"Key\":\"links\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedLinks\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyActor = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyBundle = struct {
    property: PropertyDetails,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "property", .key = "property", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"property\",\"Key\":\"property\",\"Type\":{\"name\":\"PropertyDetails\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyDetails = struct {
    id: ?u64,
    happy: ?u64,
    market_price: ?u64,
    status: ?[]const u8,
    owner: ?PropertyActor,
    rented_by: ?PropertyActor,
    used_by: []const PropertyActor,
    staff: []const PropertyStaffSummary,
    property: ?PropertyTypeSummary,
    upkeep: ?PropertyUpkeep,
    modifications: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "happy", .key = "happy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market_price", .key = "market_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "owner", .key = "owner", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rented_by", .key = "rented_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "used_by", .key = "used_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "staff", .key = "staff", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "property", .key = "property", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upkeep", .key = "upkeep", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifications", .key = "modifications", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"happy\",\"Key\":\"happy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market_price\",\"Key\":\"market_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"owner\",\"Key\":\"owner\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PropertyActor\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rented_by\",\"Key\":\"rented_by\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PropertyActor\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"used_by\",\"Key\":\"used_by\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"PropertyActor\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"staff\",\"Key\":\"staff\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"PropertyStaffSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"property\",\"Key\":\"property\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PropertyTypeSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upkeep\",\"Key\":\"upkeep\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PropertyUpkeep\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifications\",\"Key\":\"modifications\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyLookupBundle = struct {
    selections: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyStaffSummary = struct {
    staff_type: ?[]const u8,
    amount: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "staff_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"staff_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyTimestampBundle = struct {
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyTypeSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const PropertyUpkeep = struct {
    property: ?u64,
    staff: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "property", .key = "property", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "staff", .key = "staff", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"property\",\"Key\":\"property\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"staff\",\"Key\":\"staff\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingCar = struct {
    car_item_id: ?u64,
    car_item_name: ?[]const u8,
    top_speed: ?i64,
    acceleration: ?i64,
    braking: ?i64,
    dirt: ?i64,
    handling: ?i64,
    safety: ?i64,
    tarmac: ?i64,
    car_class: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "car_item_id", .key = "car_item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_name", .key = "car_item_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "top_speed", .key = "top_speed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acceleration", .key = "acceleration", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "braking", .key = "braking", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dirt", .key = "dirt", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "handling", .key = "handling", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "safety", .key = "safety", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tarmac", .key = "tarmac", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_class", .key = "class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"car_item_id\",\"Key\":\"car_item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_name\",\"Key\":\"car_item_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"top_speed\",\"Key\":\"top_speed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acceleration\",\"Key\":\"acceleration\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"braking\",\"Key\":\"braking\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dirt\",\"Key\":\"dirt\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"handling\",\"Key\":\"handling\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"safety\",\"Key\":\"safety\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tarmac\",\"Key\":\"tarmac\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_class\",\"Key\":\"class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingCarUpgrade = struct {
    id: ?u64,
    class_required: ?[]const u8,
    name: ?[]const u8,
    description: ?[]const u8,
    category: ?[]const u8,
    subcategory: ?[]const u8,
    effects: ?RacingCarUpgradeEffects,
    cost: ?RacingCarUpgradeCost,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "class_required", .key = "class_required", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "category", .key = "category", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "subcategory", .key = "subcategory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "effects", .key = "effects", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"class_required\",\"Key\":\"class_required\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"category\",\"Key\":\"category\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"subcategory\",\"Key\":\"subcategory\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"effects\",\"Key\":\"effects\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"RacingCarUpgradeEffects\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"RacingCarUpgradeCost\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingCarUpgradeCost = struct {
    points: ?i64,
    cash: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cash", .key = "cash", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cash\",\"Key\":\"cash\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingCarUpgradeEffects = struct {
    top_speed: ?i64,
    acceleration: ?i64,
    braking: ?i64,
    handling: ?i64,
    safety: ?i64,
    dirt: ?i64,
    tarmac: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "top_speed", .key = "top_speed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acceleration", .key = "acceleration", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "braking", .key = "braking", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "handling", .key = "handling", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "safety", .key = "safety", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dirt", .key = "dirt", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tarmac", .key = "tarmac", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"top_speed\",\"Key\":\"top_speed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acceleration\",\"Key\":\"acceleration\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"braking\",\"Key\":\"braking\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"handling\",\"Key\":\"handling\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"safety\",\"Key\":\"safety\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dirt\",\"Key\":\"dirt\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tarmac\",\"Key\":\"tarmac\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingCarUpgradesBundle = struct {
    carupgrades: []const RacingCarUpgrade,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "carupgrades", .key = "carupgrades", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"carupgrades\",\"Key\":\"carupgrades\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"RacingCarUpgrade\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingCarsBundle = struct {
    cars: []const RacingCar,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cars", .key = "cars", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cars\",\"Key\":\"cars\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"RacingCar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingLookupBundle = struct {
    selections: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingParticipants = struct {
    minimum: ?u32,
    maximum: ?u32,
    current: ?u32,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "minimum", .key = "minimum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "maximum", .key = "maximum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"minimum\",\"Key\":\"minimum\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"maximum\",\"Key\":\"maximum\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingRace = struct {
    id: ?u64,
    title: ?[]const u8,
    track_id: ?u64,
    creator_id: ?u64,
    status: ?[]const u8,
    is_official: ?bool,
    laps: ?u32,
    participants: ?RacingParticipants,
    requirements: ?RacingRequirements,
    schedule: ?RacingSchedule,
    results: []const RacingResult,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "track_id", .key = "track_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "creator_id", .key = "creator_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_official", .key = "is_official", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "laps", .key = "laps", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "participants", .key = "participants", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "requirements", .key = "requirements", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "schedule", .key = "schedule", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "results", .key = "results", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"track_id\",\"Key\":\"track_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"creator_id\",\"Key\":\"creator_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_official\",\"Key\":\"is_official\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"laps\",\"Key\":\"laps\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"participants\",\"Key\":\"participants\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"RacingParticipants\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"requirements\",\"Key\":\"requirements\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"RacingRequirements\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"schedule\",\"Key\":\"schedule\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"RacingSchedule\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"results\",\"Key\":\"results\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"RacingResult\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingRaceBundle = struct {
    race: RacingRace,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "race", .key = "race", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"race\",\"Key\":\"race\",\"Type\":{\"name\":\"RacingRace\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingRacesBundle = struct {
    races: []const RacingRace,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "races", .key = "races", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"races\",\"Key\":\"races\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"RacingRace\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingRecord = struct {
    driver_id: ?u64,
    driver_name: ?[]const u8,
    car_item_id: ?u64,
    lap_time: ?f64,
    car_item_name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "driver_id", .key = "driver_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "driver_name", .key = "driver_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_id", .key = "car_item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "lap_time", .key = "lap_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_name", .key = "car_item_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"driver_id\",\"Key\":\"driver_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"driver_name\",\"Key\":\"driver_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_id\",\"Key\":\"car_item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"lap_time\",\"Key\":\"lap_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_name\",\"Key\":\"car_item_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingRecordsBundle = struct {
    records: []const RacingRecord,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "records", .key = "records", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"records\",\"Key\":\"records\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"RacingRecord\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingRequirements = struct {
    car_class: ?[]const u8,
    car_item_id: ?u64,
    driver_class: ?[]const u8,
    join_fee: ?u64,
    requires_password: ?bool,
    requires_stock_car: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "car_class", .key = "car_class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_id", .key = "car_item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "driver_class", .key = "driver_class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "join_fee", .key = "join_fee", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "requires_password", .key = "requires_password", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "requires_stock_car", .key = "requires_stock_car", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"car_class\",\"Key\":\"car_class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_id\",\"Key\":\"car_item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"driver_class\",\"Key\":\"driver_class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"join_fee\",\"Key\":\"join_fee\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"requires_password\",\"Key\":\"requires_password\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"requires_stock_car\",\"Key\":\"requires_stock_car\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingResult = struct {
    position: ?u32,
    driver_id: ?u64,
    car_id: ?u64,
    car_item_id: ?u64,
    car_item_name: ?[]const u8,
    car_class: ?[]const u8,
    race_time: ?f64,
    best_lap_time: ?f64,
    has_crashed: ?bool,
    time_ended: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "driver_id", .key = "driver_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_id", .key = "car_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_id", .key = "car_item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_name", .key = "car_item_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_class", .key = "car_class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "race_time", .key = "race_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "best_lap_time", .key = "best_lap_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "has_crashed", .key = "has_crashed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "time_ended", .key = "time_ended", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"driver_id\",\"Key\":\"driver_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_id\",\"Key\":\"car_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_id\",\"Key\":\"car_item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_name\",\"Key\":\"car_item_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_class\",\"Key\":\"car_class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"race_time\",\"Key\":\"race_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"best_lap_time\",\"Key\":\"best_lap_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"has_crashed\",\"Key\":\"has_crashed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"time_ended\",\"Key\":\"time_ended\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingSchedule = struct {
    join_from: ?u64,
    join_until: ?u64,
    start: ?u64,
    end: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "join_from", .key = "join_from", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "join_until", .key = "join_until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"join_from\",\"Key\":\"join_from\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"join_until\",\"Key\":\"join_until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingTimestampBundle = struct {
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingTrack = struct {
    id: ?u64,
    title: ?[]const u8,
    description: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const RacingTracksBundle = struct {
    tracks: []const RacingTrack,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "tracks", .key = "tracks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"tracks\",\"Key\":\"tracks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"RacingTrack\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAmmoItem = struct {
    id: ?u64,
    name: ?[]const u8,
    price: ?u64,
    types: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "types", .key = "types", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"types\",\"Key\":\"types\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAttackItem = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAttackLog = struct {
    log: []const TornAttackLogEntry,
    summary: []const TornAttackLogSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "log", .key = "log", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "summary", .key = "summary", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"log\",\"Key\":\"log\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornAttackLogEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"summary\",\"Key\":\"summary\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornAttackLogSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAttackLogBundle = struct {
    attacklog: TornAttackLog,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacklog", .key = "attacklog", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacklog\",\"Key\":\"attacklog\",\"Type\":{\"name\":\"TornAttackLog\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAttackLogEntry = struct {
    text: ?[]const u8,
    timestamp: ?u64,
    action: ?[]const u8,
    icon: ?[]const u8,
    attacker: ?TornAttackParticipant,
    defender: ?TornAttackParticipant,
    attacker_item: ?TornAttackItem,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "text", .key = "text", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "action", .key = "action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "icon", .key = "icon", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacker", .key = "attacker", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defender", .key = "defender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacker_item", .key = "attacker_item", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"text\",\"Key\":\"text\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"action\",\"Key\":\"action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"icon\",\"Key\":\"icon\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacker\",\"Key\":\"attacker\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornAttackParticipant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defender\",\"Key\":\"defender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornAttackParticipant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacker_item\",\"Key\":\"attacker_item\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornAttackItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAttackLogSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    hits: ?u64,
    misses: ?u64,
    damage: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "hits", .key = "hits", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "misses", .key = "misses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "damage", .key = "damage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"hits\",\"Key\":\"hits\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"misses\",\"Key\":\"misses\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"damage\",\"Key\":\"damage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAttackParticipant = struct {
    id: ?u64,
    name: ?[]const u8,
    item: ?TornAttackItem,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item", .key = "item", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item\",\"Key\":\"item\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornAttackItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornAwardType = struct {
    id: ?u64,
    title: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornBankBundle = struct {
    bank: TornBankRates,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "bank", .key = "bank", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"bank\",\"Key\":\"bank\",\"Type\":{\"name\":\"TornBankRates\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornBankRates = struct {
    one_week: ?f64,
    two_weeks: ?f64,
    one_month: ?f64,
    two_months: ?f64,
    three_months: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "one_week", .key = "1w", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "two_weeks", .key = "2w", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "one_month", .key = "1m", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "two_months", .key = "2m", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "three_months", .key = "3m", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"one_week\",\"Key\":\"1w\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"two_weeks\",\"Key\":\"2w\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"one_month\",\"Key\":\"1m\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"two_months\",\"Key\":\"2m\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"three_months\",\"Key\":\"3m\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornBountiesBundle = struct {
    bounties: []const TornBounty,
    bounties_timestamp: ?u64,
    bounties_delay: ?u64,
    _metadata: ?PaginatedMetadataWithTotal,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "bounties", .key = "bounties", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bounties_timestamp", .key = "bounties_timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bounties_delay", .key = "bounties_delay", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"bounties\",\"Key\":\"bounties\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornBounty\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bounties_timestamp\",\"Key\":\"bounties_timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bounties_delay\",\"Key\":\"bounties_delay\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadataWithTotal\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornBounty = struct {
    target_id: ?u64,
    target_name: ?[]const u8,
    target_level: ?u64,
    lister_id: ?u64,
    lister_name: ?[]const u8,
    reward: ?u64,
    reason: ?[]const u8,
    quantity: ?u64,
    is_anonymous: ?bool,
    valid_until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "target_id", .key = "target_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target_name", .key = "target_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target_level", .key = "target_level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "lister_id", .key = "lister_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "lister_name", .key = "lister_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reward", .key = "reward", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reason", .key = "reason", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_anonymous", .key = "is_anonymous", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "valid_until", .key = "valid_until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"target_id\",\"Key\":\"target_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target_name\",\"Key\":\"target_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target_level\",\"Key\":\"target_level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"lister_id\",\"Key\":\"lister_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"lister_name\",\"Key\":\"lister_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reward\",\"Key\":\"reward\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reason\",\"Key\":\"reason\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_anonymous\",\"Key\":\"is_anonymous\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"valid_until\",\"Key\":\"valid_until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCalendar = struct {
    competitions: []const TornCalendarEntry,
    events: []const TornCalendarEntry,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "competitions", .key = "competitions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "events", .key = "events", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"competitions\",\"Key\":\"competitions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornCalendarEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"events\",\"Key\":\"events\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornCalendarEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCalendarBundle = struct {
    calendar: TornCalendar,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "calendar", .key = "calendar", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"calendar\",\"Key\":\"calendar\",\"Type\":{\"name\":\"TornCalendar\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCalendarEntry = struct {
    title: ?[]const u8,
    description: ?[]const u8,
    start: ?u64,
    end: ?u64,
    fixed_start_time: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "fixed_start_time", .key = "fixed_start_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"fixed_start_time\",\"Key\":\"fixed_start_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCard = struct {
    name: ?[]const u8,
    short: ?TornCardShort,
    rank: ?u64,
    css_class: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "short", .key = "short", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "css_class", .key = "class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"short\",\"Key\":\"short\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornCardShort\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"css_class\",\"Key\":\"class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCardShort = union(enum) {
    v0: u64,
    v1: []const u8,
    pub const compatibility_name = "TornCardShort";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"uint64\"},{\"name\":\"string\"}],\"Type\":{\"name\":\"\"}}";
};
pub const TornCardsBundle = struct {
    cards: model.Map(TornCard),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cards", .key = "cards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cards\",\"Key\":\"cards\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornCard\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCityShop = struct {
    name: ?[]const u8,
    inventory: model.Map(TornCityShopItem),
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "inventory", .key = "inventory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"inventory\",\"Key\":\"inventory\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornCityShopItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCityShopItem = struct {
    name: ?[]const u8,
    item_type: ?[]const u8,
    price: ?u64,
    in_stock: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "in_stock", .key = "in_stock", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"in_stock\",\"Key\":\"in_stock\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCityShopsBundle = struct {
    cityshops: model.Map(TornCityShop),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cityshops", .key = "cityshops", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cityshops\",\"Key\":\"cityshops\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornCityShop\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCompaniesBundle = struct {
    companies: model.Map(TornCompany),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "companies", .key = "companies", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"companies\",\"Key\":\"companies\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornCompany\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCompany = struct {
    name: ?[]const u8,
    cost: ?u64,
    default_employees: ?u64,
    positions: model.Map(TornCompanyPosition),
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "default_employees", .key = "default_employees", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "positions", .key = "positions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"default_employees\",\"Key\":\"default_employees\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"positions\",\"Key\":\"positions\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornCompanyPosition\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCompanyPosition = struct {
    man_required: ?u64,
    int_required: ?u64,
    end_required: ?u64,
    man_gain: ?i64,
    int_gain: ?i64,
    end_gain: ?i64,
    special_ability: ?[]const u8,
    description: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "man_required", .key = "man_required", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "int_required", .key = "int_required", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end_required", .key = "end_required", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "man_gain", .key = "man_gain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "int_gain", .key = "int_gain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end_gain", .key = "end_gain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "special_ability", .key = "special_ability", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"man_required\",\"Key\":\"man_required\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"int_required\",\"Key\":\"int_required\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end_required\",\"Key\":\"end_required\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"man_gain\",\"Key\":\"man_gain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"int_gain\",\"Key\":\"int_gain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end_gain\",\"Key\":\"end_gain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"special_ability\",\"Key\":\"special_ability\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCompetitionBundle = struct {
    competition: []const TornCompetitionEntry,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "competition", .key = "competition", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"competition\",\"Key\":\"competition\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornCompetitionEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCompetitionEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    competition_type: ?[]const u8,
    title: ?[]const u8,
    status: ?[]const u8,
    start: ?u64,
    end: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "competition_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"competition_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCountEntry = struct {
    entry_type: ?[]const u8,
    count: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "entry_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "count", .key = "count", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"entry_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"count\",\"Key\":\"count\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCrime = struct {
    id: ?u64,
    name: ?[]const u8,
    category: ?[]const u8,
    nerve: ?u64,
    notes: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "category", .key = "category", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "nerve", .key = "nerve", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "notes", .key = "notes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"category\",\"Key\":\"category\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"nerve\",\"Key\":\"nerve\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"notes\",\"Key\":\"notes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornCrimesBundle = struct {
    crimes: []const TornCrime,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "crimes", .key = "crimes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"crimes\",\"Key\":\"crimes\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornCrime\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornDynamicObject = model.Map(DynamicValue);
pub const TornEducationBundle = struct {
    education: []const TornEducationCourse,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "education", .key = "education", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"education\",\"Key\":\"education\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornEducationCourse\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornEducationCourse = struct {
    id: ?u64,
    name: ?[]const u8,
    description: ?[]const u8,
    money_cost: ?u64,
    tier: ?u64,
    duration: ?u64,
    results: []const []const u8,
    prerequisites: []const u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "money_cost", .key = "money_cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tier", .key = "tier", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "duration", .key = "duration", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "results", .key = "results", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "prerequisites", .key = "prerequisites", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"money_cost\",\"Key\":\"money_cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tier\",\"Key\":\"tier\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"duration\",\"Key\":\"duration\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"results\",\"Key\":\"results\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"prerequisites\",\"Key\":\"prerequisites\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornEliminationBundle = struct {
    elimination: ?TornDynamicObject,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "elimination", .key = "elimination", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"elimination\",\"Key\":\"elimination\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornDynamicObject\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornEliminationTeamBundle = struct {
    eliminationteam: []const TornEliminationTeamEntry,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "eliminationteam", .key = "eliminationteam", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"eliminationteam\",\"Key\":\"eliminationteam\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornEliminationTeamEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornEliminationTeamEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    rank: ?u64,
    score: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornFactionHofBundle = struct {
    factionhof: ?TornDynamicObject,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "factionhof", .key = "factionhof", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"factionhof\",\"Key\":\"factionhof\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornDynamicObject\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornFactionTreeBundle = struct {
    factiontree: ?TornDynamicObject,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "factiontree", .key = "factiontree", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"factiontree\",\"Key\":\"factiontree\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornDynamicObject\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornGym = struct {
    name: ?[]const u8,
    stage: ?u64,
    cost: ?u64,
    energy: ?u64,
    strength: ?i64,
    speed: ?i64,
    defense: ?i64,
    dexterity: ?i64,
    note: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stage", .key = "stage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "energy", .key = "energy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "strength", .key = "strength", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "speed", .key = "speed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defense", .key = "defense", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dexterity", .key = "dexterity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "note", .key = "note", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stage\",\"Key\":\"stage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"energy\",\"Key\":\"energy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"strength\",\"Key\":\"strength\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"speed\",\"Key\":\"speed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defense\",\"Key\":\"defense\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dexterity\",\"Key\":\"dexterity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"note\",\"Key\":\"note\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornGymsBundle = struct {
    gyms: model.Map(TornGym),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "gyms", .key = "gyms", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"gyms\",\"Key\":\"gyms\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornGym\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornHofBundle = struct {
    hof: ?TornDynamicObject,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "hof", .key = "hof", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"hof\",\"Key\":\"hof\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornDynamicObject\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornHonorSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    description: ?[]const u8,
    rarity: ?[]const u8,
    circulation: ?u64,
    equipped: ?bool,
    honor_type: ?TornAwardType,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rarity", .key = "rarity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "circulation", .key = "circulation", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "equipped", .key = "equipped", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "honor_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rarity\",\"Key\":\"rarity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"circulation\",\"Key\":\"circulation\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"equipped\",\"Key\":\"equipped\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"honor_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornAwardType\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornHonorsBundle = struct {
    honors: []const TornHonorSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "honors", .key = "honors", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"honors\",\"Key\":\"honors\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornHonorSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemAmmoBundle = struct {
    itemammo: []const TornAmmoItem,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "itemammo", .key = "itemammo", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"itemammo\",\"Key\":\"itemammo\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornAmmoItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemBaseStats = struct {
    damage: ?f64,
    accuracy: ?f64,
    armor: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "damage", .key = "damage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "accuracy", .key = "accuracy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "armor", .key = "armor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"damage\",\"Key\":\"damage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"accuracy\",\"Key\":\"accuracy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"armor\",\"Key\":\"armor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemDetails = struct {
    category: ?[]const u8,
    base_stats: ?TornItemBaseStats,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "category", .key = "category", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "base_stats", .key = "base_stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"category\",\"Key\":\"category\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"base_stats\",\"Key\":\"base_stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornItemBaseStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemDetailsBundle = struct {
    itemdetails: ?TornItemDetailsSelection,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "itemdetails", .key = "itemdetails", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"itemdetails\",\"Key\":\"itemdetails\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornItemDetailsSelection\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemDetailsSelection = struct {
    id: ?u64,
    name: ?[]const u8,
    item_type: ?[]const u8,
    details: ?DynamicValue,
    items: []const TornItemSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"DynamicValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornItemSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemMod = struct {
    id: ?u64,
    name: ?[]const u8,
    image: ?[]const u8,
    description: ?[]const u8,
    dual_fit: ?bool,
    weapons: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "image", .key = "image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dual_fit", .key = "dual_fit", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "weapons", .key = "weapons", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"image\",\"Key\":\"image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dual_fit\",\"Key\":\"dual_fit\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"weapons\",\"Key\":\"weapons\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemModsBundle = struct {
    itemmods: []const TornItemMod,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "itemmods", .key = "itemmods", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"itemmods\",\"Key\":\"itemmods\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornItemMod\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemStats = struct {
    armory_id: ?u64,
    id: ?u64,
    sell: ?u64,
    qty: ?u64,
    sell_total: ?u64,
    name: ?[]const u8,
    type2: ?[]const u8,
    dmg: ?f64,
    damage: ?f64,
    accuracy: ?f64,
    acc: ?f64,
    arm: ?f64,
    weptype: ?[]const u8,
    uid: ?u64,
    item_type: ?[]const u8,
    original_type: ?[]const u8,
    market_price: ?u64,
    stats: []const DynamicValue,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "armory_id", .key = "armoryID", .aliases = &.{
            "armory_id",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "ID", .aliases = &.{
            "id",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sell", .key = "sell", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "qty", .key = "Qty", .aliases = &.{
            "qty",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sell_total", .key = "SellTotal", .aliases = &.{
            "sell_total",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "type2", .key = "type2", .aliases = &.{
            "sub_type",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dmg", .key = "dmg", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "damage", .key = "damage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "accuracy", .key = "accuracy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acc", .key = "acc", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "arm", .key = "arm", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "weptype", .key = "weptype", .aliases = &.{
            "weapon_type",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "UID", .aliases = &.{
            "uid",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "original_type", .key = "originalType", .aliases = &.{
            "original_type",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market_price", .key = "market_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"armory_id\",\"Key\":\"armoryID\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"armory_id\"],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"ID\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"id\"],\"Custom\":\"\"},{\"Name\":\"sell\",\"Key\":\"sell\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"qty\",\"Key\":\"Qty\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"qty\"],\"Custom\":\"\"},{\"Name\":\"sell_total\",\"Key\":\"SellTotal\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"sell_total\"],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"type2\",\"Key\":\"type2\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"sub_type\"],\"Custom\":\"\"},{\"Name\":\"dmg\",\"Key\":\"dmg\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"damage\",\"Key\":\"damage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"accuracy\",\"Key\":\"accuracy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acc\",\"Key\":\"acc\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"arm\",\"Key\":\"arm\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"weptype\",\"Key\":\"weptype\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"weapon_type\"],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"UID\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"uid\"],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"original_type\",\"Key\":\"originalType\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"original_type\"],\"Custom\":\"\"},{\"Name\":\"market_price\",\"Key\":\"market_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"DynamicValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemStatsBundle = struct {
    itemstats: TornItemStats,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "itemstats", .key = "itemstats", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"itemstats\",\"Key\":\"itemstats\",\"Type\":{\"name\":\"TornItemStats\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    item_type: ?[]const u8,
    circulation: ?u64,
    is_tradable: ?bool,
    is_found_in_city: ?bool,
    description: ?[]const u8,
    details: ?TornItemDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "circulation", .key = "circulation", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_tradable", .key = "is_tradable", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_found_in_city", .key = "is_found_in_city", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"circulation\",\"Key\":\"circulation\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_tradable\",\"Key\":\"is_tradable\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_found_in_city\",\"Key\":\"is_found_in_city\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornItemDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornItemsBundle = struct {
    items: []const TornItemSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornItemSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornLogCategoriesBundle = struct {
    logcategories: []const TornLogCategory,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "logcategories", .key = "logcategories", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"logcategories\",\"Key\":\"logcategories\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornLogCategory\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornLogCategory = struct {
    id: ?u64,
    title: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornLogType = struct {
    id: ?u64,
    title: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornLogTypesBundle = struct {
    logtypes: []const TornLogType,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "logtypes", .key = "logtypes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"logtypes\",\"Key\":\"logtypes\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornLogType\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornLookupBundle = struct {
    selections: []const []const u8,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornMedalSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    description: ?[]const u8,
    rarity: ?[]const u8,
    circulation: ?u64,
    medal_type: ?TornAwardType,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rarity", .key = "rarity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "circulation", .key = "circulation", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "medal_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rarity\",\"Key\":\"rarity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"circulation\",\"Key\":\"circulation\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"medal_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornAwardType\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornMedalsBundle = struct {
    medals: []const TornMedalSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "medals", .key = "medals", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"medals\",\"Key\":\"medals\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornMedalSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornMerit = struct {
    id: ?u64,
    name: ?[]const u8,
    description: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornMeritsBundle = struct {
    merits: []const TornMerit,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "merits", .key = "merits", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"merits\",\"Key\":\"merits\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornMerit\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornOrganisedCrime = struct {
    id: ?u64,
    name: ?[]const u8,
    members: ?u64,
    time: ?u64,
    cost: ?u64,
    success_chance: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "members", .key = "members", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "time", .key = "time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "success_chance", .key = "success_chance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"members\",\"Key\":\"members\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"time\",\"Key\":\"time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"success_chance\",\"Key\":\"success_chance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornOrganisedCrimesBundle = struct {
    organisedcrimes: model.Map(TornOrganisedCrime),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "organisedcrimes", .key = "organisedcrimes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"organisedcrimes\",\"Key\":\"organisedcrimes\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornOrganisedCrime\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornOrganizedCrime = struct {
    id: ?u64,
    name: ?[]const u8,
    difficulty: ?u64,
    scope: ?[]const u8,
    slots: []const TornOrganizedCrimeSlot,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "difficulty", .key = "difficulty", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "scope", .key = "scope", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "slots", .key = "slots", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"difficulty\",\"Key\":\"difficulty\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"scope\",\"Key\":\"scope\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"slots\",\"Key\":\"slots\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornOrganizedCrimeSlot\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornOrganizedCrimePositionInfo = struct {
    id: ?[]const u8,
    label: ?[]const u8,
    number: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "label", .key = "label", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "number", .key = "number", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"label\",\"Key\":\"label\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"number\",\"Key\":\"number\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornOrganizedCrimeSlot = struct {
    position_info: ?TornOrganizedCrimePositionInfo,
    position: ?[]const u8,
    item_requirement: ?DynamicValue,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "position_info", .key = "position_info", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_requirement", .key = "item_requirement", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"position_info\",\"Key\":\"position_info\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornOrganizedCrimePositionInfo\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_requirement\",\"Key\":\"item_requirement\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"DynamicValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornOrganizedCrimesBundle = struct {
    organizedcrimes: []const TornOrganizedCrime,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "organizedcrimes", .key = "organizedcrimes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"organizedcrimes\",\"Key\":\"organizedcrimes\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornOrganizedCrime\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornPawnshop = struct {
    points_value: ?u64,
    donatorpack_value: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "points_value", .key = "points_value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "donatorpack_value", .key = "donatorpack_value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"points_value\",\"Key\":\"points_value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"donatorpack_value\",\"Key\":\"donatorpack_value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornPawnshopBundle = struct {
    pawnshop: TornPawnshop,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "pawnshop", .key = "pawnshop", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"pawnshop\",\"Key\":\"pawnshop\",\"Type\":{\"name\":\"TornPawnshop\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornPercentageEntry = struct {
    title: ?[]const u8,
    percentage: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "percentage", .key = "percentage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"percentage\",\"Key\":\"percentage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornPokerTable = struct {
    name: ?[]const u8,
    big_blind: ?u64,
    small_blind: ?u64,
    speed: ?u64,
    current_players: ?u64,
    maximum_players: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "big_blind", .key = "big_blind", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "small_blind", .key = "small_blind", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "speed", .key = "speed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current_players", .key = "current_players", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "maximum_players", .key = "maximum_players", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"big_blind\",\"Key\":\"big_blind\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"small_blind\",\"Key\":\"small_blind\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"speed\",\"Key\":\"speed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current_players\",\"Key\":\"current_players\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"maximum_players\",\"Key\":\"maximum_players\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornPokerTablesBundle = struct {
    pokertables: model.Map(TornPokerTable),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "pokertables", .key = "pokertables", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"pokertables\",\"Key\":\"pokertables\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornPokerTable\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornPropertiesBundle = struct {
    properties: []const TornPropertyCatalogEntry,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "properties", .key = "properties", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"properties\",\"Key\":\"properties\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornPropertyCatalogEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornPropertyCatalogEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    cost: ?u64,
    happy: ?u64,
    upkeep: ?u64,
    modifications: []const []const u8,
    staff: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "happy", .key = "happy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upkeep", .key = "upkeep", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifications", .key = "modifications", .aliases = &.{
            "upgrades_available",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "staff", .key = "staff", .aliases = &.{
            "staff_available",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"happy\",\"Key\":\"happy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upkeep\",\"Key\":\"upkeep\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifications\",\"Key\":\"modifications\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"upgrades_available\"],\"Custom\":\"\"},{\"Name\":\"staff\",\"Key\":\"staff\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"staff_available\"],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornRockPaperScissorsBundle = struct {
    rockpaperscissors: []const TornCountEntry,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "rockpaperscissors", .key = "rockpaperscissors", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"rockpaperscissors\",\"Key\":\"rockpaperscissors\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornCountEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornSearchForCashBundle = struct {
    searchforcash: model.Map(TornPercentageEntry),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "searchforcash", .key = "searchforcash", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"searchforcash\",\"Key\":\"searchforcash\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"TornPercentageEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornShopliftingBundle = struct {
    shoplifting: model.Map([]const TornShopliftingEntry),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "shoplifting", .key = "shoplifting", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"shoplifting\",\"Key\":\"shoplifting\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"array\",\"arguments\":[{\"name\":\"TornShopliftingEntry\"}]}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornShopliftingEntry = struct {
    title: ?[]const u8,
    disabled: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "disabled", .key = "disabled", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"disabled\",\"Key\":\"disabled\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStatsBundle = struct {
    stats: model.Map(DynamicValue),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"DynamicValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockBonus = struct {
    passive: ?bool,
    frequency: ?u64,
    requirement: ?u64,
    description: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "passive", .key = "passive", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "frequency", .key = "frequency", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "requirement", .key = "requirement", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"passive\",\"Key\":\"passive\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"frequency\",\"Key\":\"frequency\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"requirement\",\"Key\":\"requirement\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockBundle = struct {
    stock: TornStockDetailed,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "stock", .key = "stocks", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"stock\",\"Key\":\"stocks\",\"Type\":{\"name\":\"TornStockDetailed\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockChart = struct {
    performance: ?TornStockPerformance,
    history: []const TornStockHistoryEntry,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "performance", .key = "performance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "history", .key = "history", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"performance\",\"Key\":\"performance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockPerformance\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"history\",\"Key\":\"history\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornStockHistoryEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockDetailed = struct {
    id: ?u64,
    name: ?[]const u8,
    acronym: ?[]const u8,
    images: ?TornStockImages,
    market: ?TornStockMarket,
    bonus: ?TornStockBonus,
    chart: ?TornStockChart,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acronym", .key = "acronym", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "images", .key = "images", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market", .key = "market", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonus", .key = "bonus", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chart", .key = "chart", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acronym\",\"Key\":\"acronym\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"images\",\"Key\":\"images\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockImages\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market\",\"Key\":\"market\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockMarket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonus\",\"Key\":\"bonus\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockBonus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chart\",\"Key\":\"chart\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockChart\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockHistoryEntry = struct {
    timestamp: ?u64,
    price: ?f64,
    change: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "change", .key = "change", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"change\",\"Key\":\"change\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockImages = struct {
    logo: ?[]const u8,
    full: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "logo", .key = "logo", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "full", .key = "full", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"logo\",\"Key\":\"logo\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"full\",\"Key\":\"full\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockMarket = struct {
    price: ?f64,
    cap: ?u64,
    shares: ?u64,
    investors: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cap", .key = "cap", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "shares", .key = "shares", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "investors", .key = "investors", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cap\",\"Key\":\"cap\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"shares\",\"Key\":\"shares\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"investors\",\"Key\":\"investors\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockPerformance = struct {
    last_hour: ?TornStockPerformanceWindow,
    last_day: ?TornStockPerformanceWindow,
    last_week: ?TornStockPerformanceWindow,
    last_month: ?TornStockPerformanceWindow,
    last_year: ?TornStockPerformanceWindow,
    all_time: ?TornStockPerformanceWindow,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "last_hour", .key = "last_hour", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_day", .key = "last_day", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_week", .key = "last_week", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_month", .key = "last_month", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_year", .key = "last_year", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "all_time", .key = "all_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"last_hour\",\"Key\":\"last_hour\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockPerformanceWindow\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_day\",\"Key\":\"last_day\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockPerformanceWindow\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_week\",\"Key\":\"last_week\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockPerformanceWindow\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_month\",\"Key\":\"last_month\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockPerformanceWindow\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_year\",\"Key\":\"last_year\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockPerformanceWindow\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"all_time\",\"Key\":\"all_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockPerformanceWindow\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockPerformanceWindow = struct {
    change: ?f64,
    change_percentage: ?f64,
    start: ?f64,
    end: ?f64,
    high: ?f64,
    low: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "change", .key = "change", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "change_percentage", .key = "change_percentage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "high", .key = "high", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "low", .key = "low", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"change\",\"Key\":\"change\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"change_percentage\",\"Key\":\"change_percentage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"high\",\"Key\":\"high\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"low\",\"Key\":\"low\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStockSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    acronym: ?[]const u8,
    images: ?TornStockImages,
    market: ?TornStockMarket,
    bonus: ?TornStockBonus,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acronym", .key = "acronym", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "images", .key = "images", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market", .key = "market", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonus", .key = "bonus", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acronym\",\"Key\":\"acronym\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"images\",\"Key\":\"images\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockImages\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market\",\"Key\":\"market\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockMarket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonus\",\"Key\":\"bonus\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornStockBonus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornStocksBundle = struct {
    stocks: []const TornStockSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "stocks", .key = "stocks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"stocks\",\"Key\":\"stocks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornStockSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornSubcrimesBundle = struct {
    subcrimes: ?TornDynamicObject,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "subcrimes", .key = "subcrimes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"subcrimes\",\"Key\":\"subcrimes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornDynamicObject\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornTerritoryBundle = struct {
    territory: ?TornDynamicObject,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "territory", .key = "territory", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"territory\",\"Key\":\"territory\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"TornDynamicObject\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TornTimestampBundle = struct {
    timestamp: ?u64,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeCompanyDetails = struct {
    id: ?u64,
    name: ?[]const u8,
    value: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeCompanyItem = struct {
    user_id: ?u64,
    details: TradeCompanyDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"TradeCompanyDetails\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeFactionDetails = struct {
    id: ?u64,
    name: ?[]const u8,
    respect: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeFactionItem = struct {
    user_id: ?u64,
    details: TradeFactionDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"TradeFactionDetails\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeInventoryItem = struct {
    user_id: ?u64,
    details: TradeInventoryItemDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"TradeInventoryItemDetails\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeInventoryItemDetails = struct {
    id: ?u64,
    uid: ?u64,
    amount: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeItem = union(enum) {
    v0: TradeMoneyItem,
    v1: TradeInventoryItem,
    v2: TradeFactionItem,
    v3: TradeCompanyItem,
    v4: TradePropertyItem,
    v5: TradeNapItem,
    v6: UnknownTradeItem,
    pub const compatibility_name = "TradeItem";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"TradeMoneyItem\"},{\"name\":\"TradeInventoryItem\"},{\"name\":\"TradeFactionItem\"},{\"name\":\"TradeCompanyItem\"},{\"name\":\"TradePropertyItem\"},{\"name\":\"TradeNapItem\"},{\"name\":\"UnknownTradeItem\"}],\"Type\":{\"name\":\"\"}}";
};
pub const TradeMoneyDetails = struct {
    amount: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeMoneyItem = struct {
    user_id: ?u64,
    details: TradeMoneyDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"TradeMoneyDetails\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeNapDetails = struct {
    days: ?u64,
    factions: []const TradeNapFaction,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "days", .key = "days", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "factions", .key = "factions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"days\",\"Key\":\"days\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"factions\",\"Key\":\"factions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TradeNapFaction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeNapFaction = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradeNapItem = struct {
    user_id: ?u64,
    details: TradeNapDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"TradeNapDetails\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradePropertyDetails = struct {
    id: ?u64,
    happiness: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "happiness", .key = "happiness", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"happiness\",\"Key\":\"happiness\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const TradePropertyItem = struct {
    user_id: ?u64,
    details: TradePropertyDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"TradePropertyDetails\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UnknownTradeItem = struct {
    user_id: ?u64,
    item_type: ?[]const u8,
    details: ?DynamicValue,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "item_type", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"item_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"DynamicValue\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UnknownUserCompetition = struct {
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UnknownUserEmployment = struct {
    job_type: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "job_type", .key = "job_type", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"job_type\",\"Key\":\"job_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAmmoBundle = struct {
    ammo: []const UserAmmoItem,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "ammo", .key = "ammo", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"ammo\",\"Key\":\"ammo\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAmmoItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAmmoItem = struct {
    id: ?u64,
    name: ?[]const u8,
    types: []const UserAmmoVariant,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "types", .key = "types", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"types\",\"Key\":\"types\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAmmoVariant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAmmoVariant = struct {
    name: ?[]const u8,
    quantity: ?i64,
    equipped: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "equipped", .key = "equipped", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"equipped\",\"Key\":\"equipped\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttack = struct {
    is_territory_war: ?bool,
    territory_war_id: ?u64,
    id: ?u64,
    code: ?[]const u8,
    started: ?u64,
    ended: ?u64,
    attacker: ?UserAttackCombatant,
    defender: ?UserAttackCombatant,
    result: ?[]const u8,
    respect_gain: ?f64,
    respect_loss: ?f64,
    chain: ?u64,
    is_interrupted: ?bool,
    is_stealthed: ?bool,
    is_raid: ?bool,
    is_ranked_war: ?bool,
    modifiers: ?UserAttackModifiers,
    finishing_hit_effects: []const UserAttackFinishingHitEffect,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "is_territory_war", .key = "is_territory_war", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "territory_war_id", .key = "territory_war_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "code", .key = "code", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "started", .key = "started", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ended", .key = "ended", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacker", .key = "attacker", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defender", .key = "defender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "result", .key = "result", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect_gain", .key = "respect_gain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect_loss", .key = "respect_loss", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_interrupted", .key = "is_interrupted", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_stealthed", .key = "is_stealthed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_raid", .key = "is_raid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_ranked_war", .key = "is_ranked_war", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifiers", .key = "modifiers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "finishing_hit_effects", .key = "finishing_hit_effects", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"is_territory_war\",\"Key\":\"is_territory_war\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"territory_war_id\",\"Key\":\"territory_war_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"code\",\"Key\":\"code\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"started\",\"Key\":\"started\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ended\",\"Key\":\"ended\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacker\",\"Key\":\"attacker\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackCombatant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defender\",\"Key\":\"defender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackCombatant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"result\",\"Key\":\"result\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect_gain\",\"Key\":\"respect_gain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect_loss\",\"Key\":\"respect_loss\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_interrupted\",\"Key\":\"is_interrupted\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_stealthed\",\"Key\":\"is_stealthed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_raid\",\"Key\":\"is_raid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_ranked_war\",\"Key\":\"is_ranked_war\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifiers\",\"Key\":\"modifiers\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackModifiers\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"finishing_hit_effects\",\"Key\":\"finishing_hit_effects\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAttackFinishingHitEffect\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttackCombatant = struct {
    id: ?u64,
    name: ?[]const u8,
    level: ?u64,
    faction: ?UserAttackFaction,
    faction_id: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackFaction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttackFaction = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttackFinishingHitEffect = struct {
    name: ?[]const u8,
    value: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttackFull = struct {
    id: ?u64,
    code: ?[]const u8,
    started: ?u64,
    ended: ?u64,
    attacker: ?UserAttackCombatant,
    defender: ?UserAttackCombatant,
    result: ?[]const u8,
    respect_gain: ?f64,
    respect_loss: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "code", .key = "code", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "started", .key = "started", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ended", .key = "ended", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacker", .key = "attacker", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defender", .key = "defender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "result", .key = "result", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect_gain", .key = "respect_gain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect_loss", .key = "respect_loss", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"code\",\"Key\":\"code\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"started\",\"Key\":\"started\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ended\",\"Key\":\"ended\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacker\",\"Key\":\"attacker\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackCombatant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defender\",\"Key\":\"defender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackCombatant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"result\",\"Key\":\"result\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect_gain\",\"Key\":\"respect_gain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect_loss\",\"Key\":\"respect_loss\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttackModifiers = struct {
    fair_fight: ?f64,
    war: ?f64,
    retaliation: ?f64,
    group: ?f64,
    overseas: ?f64,
    chain: ?f64,
    warlord: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "fair_fight", .key = "fair_fight", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "war", .key = "war", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "retaliation", .key = "retaliation", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "group", .key = "group", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "overseas", .key = "overseas", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "warlord", .key = "warlord", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"fair_fight\",\"Key\":\"fair_fight\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"war\",\"Key\":\"war\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"retaliation\",\"Key\":\"retaliation\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"group\",\"Key\":\"group\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"overseas\",\"Key\":\"overseas\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"warlord\",\"Key\":\"warlord\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttacksBundle = struct {
    attacks: []const UserAttack,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAttack\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAttacksFullBundle = struct {
    attacks: []const UserAttackFull,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAttackFull\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserAwardUnlock = struct {
    id: ?u64,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBars = struct {
    energy: ?UserResourceBar,
    happy: ?UserResourceBar,
    life: ?UserLifeBar,
    nerve: ?UserResourceBar,
    chain: ?UserChainBar,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "energy", .key = "energy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "happy", .key = "happy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "life", .key = "life", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "nerve", .key = "nerve", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "chain", .key = "chain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"energy\",\"Key\":\"energy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserResourceBar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"happy\",\"Key\":\"happy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserResourceBar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"life\",\"Key\":\"life\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLifeBar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"nerve\",\"Key\":\"nerve\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserResourceBar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"chain\",\"Key\":\"chain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserChainBar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBarsBundle = struct {
    bars: UserBars,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "bars", .key = "bars", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"bars\",\"Key\":\"bars\",\"Type\":{\"name\":\"UserBars\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBasicBundle = struct {
    profile: UserBasicProfile,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "profile", .key = "profile", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"profile\",\"Key\":\"profile\",\"Type\":{\"name\":\"UserBasicProfile\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBasicProfile = struct {
    id: ?u64,
    name: ?[]const u8,
    level: ?u32,
    gender: ?[]const u8,
    status: ?UserStatus,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "gender", .key = "gender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"gender\",\"Key\":\"gender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserStatus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBattleStat = struct {
    value: ?i64,
    modifier: ?f64,
    modifiers: []const UserBattleStatModifier,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifier", .key = "modifier", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifiers", .key = "modifiers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifier\",\"Key\":\"modifier\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifiers\",\"Key\":\"modifiers\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserBattleStatModifier\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBattleStatModifier = struct {
    effect: ?[]const u8,
    value: ?f64,
    modifier_type: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "effect", .key = "effect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifier_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"effect\",\"Key\":\"effect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifier_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBattleStats = struct {
    strength: ?UserBattleStat,
    defense: ?UserBattleStat,
    speed: ?UserBattleStat,
    dexterity: ?UserBattleStat,
    total: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "strength", .key = "strength", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defense", .key = "defense", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "speed", .key = "speed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dexterity", .key = "dexterity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"strength\",\"Key\":\"strength\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserBattleStat\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defense\",\"Key\":\"defense\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserBattleStat\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"speed\",\"Key\":\"speed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserBattleStat\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dexterity\",\"Key\":\"dexterity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserBattleStat\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBattleStatsBundle = struct {
    battlestats: UserBattleStats,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "battlestats", .key = "battlestats", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"battlestats\",\"Key\":\"battlestats\",\"Type\":{\"name\":\"UserBattleStats\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBazaarBundle = struct {
    bazaar_is_open: ?bool,
    bazaar: []const UserLegacyItemSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "bazaar_is_open", .key = "bazaar_is_open", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bazaar", .key = "bazaar", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"bazaar_is_open\",\"Key\":\"bazaar_is_open\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bazaar\",\"Key\":\"bazaar\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserLegacyItemSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBountiesBundle = struct {
    bounties: []const UserBounty,
    bounties_timestamp: ?u64,
    bounties_delay: ?u64,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "bounties", .key = "bounties", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bounties_timestamp", .key = "bounties_timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bounties_delay", .key = "bounties_delay", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"bounties\",\"Key\":\"bounties\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserBounty\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bounties_timestamp\",\"Key\":\"bounties_timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bounties_delay\",\"Key\":\"bounties_delay\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserBounty = struct {
    target_id: ?u64,
    target_name: ?[]const u8,
    target_level: ?u64,
    lister_id: ?u64,
    lister_name: ?[]const u8,
    reward: ?i64,
    reason: ?[]const u8,
    quantity: ?u64,
    is_anonymous: ?bool,
    valid_until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "target_id", .key = "target_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target_name", .key = "target_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target_level", .key = "target_level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "lister_id", .key = "lister_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "lister_name", .key = "lister_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reward", .key = "reward", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reason", .key = "reason", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_anonymous", .key = "is_anonymous", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "valid_until", .key = "valid_until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"target_id\",\"Key\":\"target_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target_name\",\"Key\":\"target_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target_level\",\"Key\":\"target_level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"lister_id\",\"Key\":\"lister_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"lister_name\",\"Key\":\"lister_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reward\",\"Key\":\"reward\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reason\",\"Key\":\"reason\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_anonymous\",\"Key\":\"is_anonymous\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"valid_until\",\"Key\":\"valid_until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCalendar = struct {
    start_time: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "start_time", .key = "start_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"start_time\",\"Key\":\"start_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCalendarBundle = struct {
    calendar: UserCalendar,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "calendar", .key = "calendar", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"calendar\",\"Key\":\"calendar\",\"Type\":{\"name\":\"UserCalendar\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCasino = struct {
    tokens: ?i64,
    streak: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "tokens", .key = "tokens", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "streak", .key = "streak", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"tokens\",\"Key\":\"tokens\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"streak\",\"Key\":\"streak\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCasinoBundle = struct {
    casino: UserCasino,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "casino", .key = "casino", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"casino\",\"Key\":\"casino\",\"Type\":{\"name\":\"UserCasino\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserChainBar = struct {
    id: ?u64,
    current: ?u64,
    max: ?u64,
    modifier: ?f64,
    cooldown: ?u64,
    start: ?u64,
    end: ?u64,
    timeout: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "max", .key = "max", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifier", .key = "modifier", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cooldown", .key = "cooldown", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timeout", .key = "timeout", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"max\",\"Key\":\"max\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifier\",\"Key\":\"modifier\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cooldown\",\"Key\":\"cooldown\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timeout\",\"Key\":\"timeout\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCityBank = struct {
    amount: ?i64,
    duration: ?u64,
    interest_rate: ?f64,
    invested_at: ?u64,
    profit: ?i64,
    until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "duration", .key = "duration", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "interest_rate", .key = "interest_rate", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "invested_at", .key = "invested_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "profit", .key = "profit", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "until", .key = "until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"duration\",\"Key\":\"duration\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"interest_rate\",\"Key\":\"interest_rate\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"invested_at\",\"Key\":\"invested_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"profit\",\"Key\":\"profit\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"until\",\"Key\":\"until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCityJob = struct {
    job_type: ?[]const u8,
    name: ?[]const u8,
    position: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "job_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"job_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserClothingItem = struct {
    id: ?u64,
    name: ?[]const u8,
    uid: ?u64,
    item_type: ?[]const u8,
    sub_type: ?[]const u8,
    slot: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sub_type", .key = "sub_type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "slot", .key = "slot", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sub_type\",\"Key\":\"sub_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"slot\",\"Key\":\"slot\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCompanyJob = struct {
    job_type: ?[]const u8,
    id: ?u64,
    type_id: ?u64,
    name: ?[]const u8,
    rating: ?i64,
    position: ?[]const u8,
    days_in_company: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "job_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "type_id", .key = "type_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rating", .key = "rating", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "days_in_company", .key = "days_in_company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"job_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"type_id\",\"Key\":\"type_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rating\",\"Key\":\"rating\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"days_in_company\",\"Key\":\"days_in_company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCompanyPointCompany = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCompanyPoints = struct {
    company: ?UserCompanyPointCompany,
    points: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "company", .key = "company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"company\",\"Key\":\"company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCompanyPointCompany\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCompetition = union(enum) {
    v0: UserHalloweenCompetition,
    v1: UserEasterCompetition,
    v2: UserRpsCompetition,
    v3: UserEliminationCompetition,
    v4: UnknownUserCompetition,
    pub const compatibility_name = "UserCompetition";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"UserHalloweenCompetition\"},{\"name\":\"UserEasterCompetition\"},{\"name\":\"UserRpsCompetition\"},{\"name\":\"UserEliminationCompetition\"},{\"name\":\"UnknownUserCompetition\"}],\"Type\":{\"name\":\"\"}}";
};
pub const UserCompetitionBasket = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCompetitionBundle = struct {
    competition: ?UserCompetition,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "competition", .key = "competition", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"competition\",\"Key\":\"competition\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCompetition\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCompetitionHp = struct {
    current: ?u64,
    maximum: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "maximum", .key = "maximum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"maximum\",\"Key\":\"maximum\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCooldowns = struct {
    booster: ?u64,
    drug: ?u64,
    medical: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "booster", .key = "booster", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "drug", .key = "drug", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "medical", .key = "medical", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"booster\",\"Key\":\"booster\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"drug\",\"Key\":\"drug\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"medical\",\"Key\":\"medical\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCooldownsBundle = struct {
    cooldowns: UserCooldowns,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cooldowns", .key = "cooldowns", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cooldowns\",\"Key\":\"cooldowns\",\"Type\":{\"name\":\"UserCooldowns\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeAttemptSubcrime = struct {
    id: ?u64,
    total: ?u64,
    success: ?u64,
    fail: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "success", .key = "success", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "fail", .key = "fail", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"success\",\"Key\":\"success\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"fail\",\"Key\":\"fail\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeAttempts = struct {
    total: ?u64,
    success: ?u64,
    fail: ?u64,
    critical_fail: ?u64,
    subcrimes: []const UserCrimeAttemptSubcrime,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "success", .key = "success", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "fail", .key = "fail", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "critical_fail", .key = "critical_fail", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "subcrimes", .key = "subcrimes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"success\",\"Key\":\"success\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"fail\",\"Key\":\"fail\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"critical_fail\",\"Key\":\"critical_fail\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"subcrimes\",\"Key\":\"subcrimes\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserCrimeAttemptSubcrime\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeMiscellaneous = struct {
    fields: model.Map(DynamicValue),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "fields", .key = "fields", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"fields\",\"Key\":\"fields\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"DynamicValue\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeRewardAmmo = struct {
    standard: ?u64,
    special: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "standard", .key = "standard", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "special", .key = "special", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"standard\",\"Key\":\"standard\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"special\",\"Key\":\"special\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeRewardItem = struct {
    id: ?u64,
    amount: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{
            "amount",
            "quantity",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"amount\",\"quantity\"],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeRewards = struct {
    money: ?u64,
    ammo: ?UserCrimeRewardAmmo,
    items: []const UserCrimeRewardItem,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ammo", .key = "ammo", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ammo\",\"Key\":\"ammo\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCrimeRewardAmmo\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserCrimeRewardItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeSummary = struct {
    nerve_spent: ?u64,
    skill: ?u64,
    progression_bonus: ?u64,
    rewards: ?UserCrimeRewards,
    attempts: ?UserCrimeAttempts,
    uniques: []const UserCrimeUnique,
    miscellaneous: ?UserCrimeMiscellaneous,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "nerve_spent", .key = "nerve_spent", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "skill", .key = "skill", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "progression_bonus", .key = "progression_bonus", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rewards", .key = "rewards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attempts", .key = "attempts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uniques", .key = "uniques", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "miscellaneous", .key = "miscellaneous", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"nerve_spent\",\"Key\":\"nerve_spent\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"skill\",\"Key\":\"skill\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"progression_bonus\",\"Key\":\"progression_bonus\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rewards\",\"Key\":\"rewards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCrimeRewards\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attempts\",\"Key\":\"attempts\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCrimeAttempts\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uniques\",\"Key\":\"uniques\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserCrimeUnique\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"miscellaneous\",\"Key\":\"miscellaneous\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCrimeMiscellaneous\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeUnique = struct {
    id: ?u64,
    rewards: ?UserCrimeUniqueRewards,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rewards", .key = "rewards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rewards\",\"Key\":\"rewards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCrimeUniqueRewards\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimeUniqueRewards = struct {
    money: ?u64,
    ammo: ?UserCrimeRewardAmmo,
    items: []const UserCrimeRewardItem,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ammo", .key = "ammo", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ammo\",\"Key\":\"ammo\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCrimeRewardAmmo\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserCrimeRewardItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCrimesBundle = struct {
    crimes: UserCrimeSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "crimes", .key = "crimes", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"crimes\",\"Key\":\"crimes\",\"Type\":{\"name\":\"UserCrimeSummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCriminalRecord = struct {
    vandalism: ?u64,
    theft: ?u64,
    counterfeiting: ?u64,
    fraud: ?u64,
    illicitservices: ?u64,
    cybercrime: ?u64,
    extortion: ?u64,
    illegalproduction: ?u64,
    total: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "vandalism", .key = "vandalism", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "theft", .key = "theft", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "counterfeiting", .key = "counterfeiting", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "fraud", .key = "fraud", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "illicitservices", .key = "illicitservices", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cybercrime", .key = "cybercrime", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extortion", .key = "extortion", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "illegalproduction", .key = "illegalproduction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"vandalism\",\"Key\":\"vandalism\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"theft\",\"Key\":\"theft\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"counterfeiting\",\"Key\":\"counterfeiting\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"fraud\",\"Key\":\"fraud\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"illicitservices\",\"Key\":\"illicitservices\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cybercrime\",\"Key\":\"cybercrime\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extortion\",\"Key\":\"extortion\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"illegalproduction\",\"Key\":\"illegalproduction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCriminalRecordBundle = struct {
    criminalrecord: UserCriminalRecord,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "criminalrecord", .key = "criminalrecord", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"criminalrecord\",\"Key\":\"criminalrecord\",\"Type\":{\"name\":\"UserCriminalRecord\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserCurrentEducation = struct {
    id: ?u64,
    until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "until", .key = "until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"until\",\"Key\":\"until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserDiscord = struct {
    discord_id: ?[]const u8,
    user_id: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "discord_id", .key = "discord_id", .aliases = &.{
            "discordID",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user_id", .key = "user_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"discord_id\",\"Key\":\"discord_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"discordID\"],\"Custom\":\"\"},{\"Name\":\"user_id\",\"Key\":\"user_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserDiscordBundle = struct {
    discord: UserDiscord,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "discord", .key = "discord", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"discord\",\"Key\":\"discord\",\"Type\":{\"name\":\"UserDiscord\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserDisplayBundle = struct {
    display: []const UserLegacyItemSummary,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "display", .key = "display", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"display\",\"Key\":\"display\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserLegacyItemSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEasterCompetition = struct {
    name: ?[]const u8,
    score: ?u64,
    total: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEducation = struct {
    complete: []const u64,
    current: ?UserCurrentEducation,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "complete", .key = "complete", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"complete\",\"Key\":\"complete\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCurrentEducation\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEducationBundle = struct {
    education: UserEducation,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "education", .key = "education", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"education\",\"Key\":\"education\",\"Type\":{\"name\":\"UserEducation\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEliminationCompetition = struct {
    name: ?[]const u8,
    score: ?u64,
    attacks: ?u64,
    team: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "score", .key = "score", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "team", .key = "team", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"score\",\"Key\":\"score\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"team\",\"Key\":\"team\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEmployment = union(enum) {
    v0: UserCityJob,
    v1: UserCompanyJob,
    v2: UnknownUserEmployment,
    pub const compatibility_name = "UserEmployment";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"UserCityJob\"},{\"name\":\"UserCompanyJob\"},{\"name\":\"UnknownUserEmployment\"}],\"Type\":{\"name\":\"\"}}";
};
pub const UserEnlistedCar = struct {
    id: ?u64,
    car_item_id: ?u64,
    car_item_name: ?[]const u8,
    car_name: ?[]const u8,
    top_speed: ?i64,
    acceleration: ?i64,
    braking: ?i64,
    dirt: ?i64,
    handling: ?i64,
    safety: ?i64,
    tarmac: ?i64,
    car_class: ?[]const u8,
    worth: ?i64,
    points_spent: ?u64,
    races_entered: ?u64,
    races_won: ?u64,
    is_removed: ?bool,
    parts: []const u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_id", .key = "car_item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_name", .key = "car_item_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_name", .key = "car_name", .aliases = &.{
            "name",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "top_speed", .key = "top_speed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "acceleration", .key = "acceleration", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "braking", .key = "braking", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dirt", .key = "dirt", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "handling", .key = "handling", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "safety", .key = "safety", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tarmac", .key = "tarmac", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_class", .key = "class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "worth", .key = "worth", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points_spent", .key = "points_spent", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "races_entered", .key = "races_entered", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "races_won", .key = "races_won", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_removed", .key = "is_removed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "parts", .key = "parts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_id\",\"Key\":\"car_item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_name\",\"Key\":\"car_item_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_name\",\"Key\":\"car_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"name\"],\"Custom\":\"\"},{\"Name\":\"top_speed\",\"Key\":\"top_speed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"acceleration\",\"Key\":\"acceleration\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"braking\",\"Key\":\"braking\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dirt\",\"Key\":\"dirt\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"handling\",\"Key\":\"handling\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"safety\",\"Key\":\"safety\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tarmac\",\"Key\":\"tarmac\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_class\",\"Key\":\"class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"worth\",\"Key\":\"worth\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points_spent\",\"Key\":\"points_spent\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"races_entered\",\"Key\":\"races_entered\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"races_won\",\"Key\":\"races_won\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_removed\",\"Key\":\"is_removed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"parts\",\"Key\":\"parts\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEnlistedCarsBundle = struct {
    enlistedcars: []const UserEnlistedCar,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "enlistedcars", .key = "enlistedcars", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"enlistedcars\",\"Key\":\"enlistedcars\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserEnlistedCar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEquipmentAmmo = struct {
    id: ?u64,
    name: ?[]const u8,
    ammo_type: ?[]const u8,
    quantity: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ammo_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ammo_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEquipmentBundle = struct {
    equipment: []const UserEquipmentItem,
    clothing: []const UserClothingItem,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "equipment", .key = "equipment", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "clothing", .key = "clothing", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"equipment\",\"Key\":\"equipment\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserEquipmentItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"clothing\",\"Key\":\"clothing\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserClothingItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEquipmentItem = struct {
    id: ?u64,
    name: ?[]const u8,
    uid: ?u64,
    item_type: ?[]const u8,
    sub_type: ?[]const u8,
    stats: ?UserItemMarketItemStats,
    bonuses: []const UserItemMarketItemBonus,
    rarity: ?[]const u8,
    slot: ?u64,
    ammo: ?UserEquipmentAmmo,
    mods: []const UserEquipmentMod,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sub_type", .key = "sub_type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonuses", .key = "bonuses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rarity", .key = "rarity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "slot", .key = "slot", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ammo", .key = "ammo", .aliases = &.{
            "current_ammo",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "mods", .key = "mods", .aliases = &.{
            "equipped_mods",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sub_type\",\"Key\":\"sub_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserItemMarketItemStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonuses\",\"Key\":\"bonuses\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserItemMarketItemBonus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rarity\",\"Key\":\"rarity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"slot\",\"Key\":\"slot\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ammo\",\"Key\":\"ammo\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserEquipmentAmmo\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"current_ammo\"],\"Custom\":\"\"},{\"Name\":\"mods\",\"Key\":\"mods\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserEquipmentMod\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"equipped_mods\"],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEquipmentMod = struct {
    id: ?u64,
    name: ?[]const u8,
    image: ?[]const u8,
    description: ?[]const u8,
    dual_fit: ?bool,
    weapons: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "image", .key = "image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "dual_fit", .key = "dual_fit", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "weapons", .key = "weapons", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"image\",\"Key\":\"image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"dual_fit\",\"Key\":\"dual_fit\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"weapons\",\"Key\":\"weapons\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEvent = struct {
    id: ?[]const u8,
    timestamp: ?u64,
    text: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "text", .key = "event", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"text\",\"Key\":\"event\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserEventsBundle = struct {
    events: []const UserEvent,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "events", .key = "events", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"events\",\"Key\":\"events\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserEvent\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserFaction = struct {
    id: ?u64,
    name: ?[]const u8,
    position: ?[]const u8,
    tag: ?[]const u8,
    tag_image: ?[]const u8,
    days_in_faction: ?u32,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tag", .key = "tag", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tag_image", .key = "tag_image", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "days_in_faction", .key = "days_in_faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tag\",\"Key\":\"tag\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tag_image\",\"Key\":\"tag_image\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"days_in_faction\",\"Key\":\"days_in_faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserFactionBalance = struct {
    money: ?i64,
    points: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserFactionBalanceBundle = struct {
    faction_balance: ?UserFactionBalance,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "faction_balance", .key = "factionBalance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"faction_balance\",\"Key\":\"factionBalance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserFactionBalance\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserFactionBundle = struct {
    faction: UserFaction,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"UserFaction\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserFactionMoney = struct {
    money: ?i64,
    points: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumFeedBundle = struct {
    forum_feed: []const UserForumFeedEntry,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "forum_feed", .key = "forumFeed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"forum_feed\",\"Key\":\"forumFeed\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserForumFeedEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumFeedEntry = struct {
    thread_id: ?u64,
    post_id: ?u64,
    user: ?ForumUserSummary,
    title: ?[]const u8,
    text: ?[]const u8,
    timestamp: ?u64,
    is_seen: ?bool,
    entry_type: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "thread_id", .key = "thread_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "post_id", .key = "post_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "text", .key = "text", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_seen", .key = "is_seen", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "entry_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"thread_id\",\"Key\":\"thread_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"post_id\",\"Key\":\"post_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"ForumUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"text\",\"Key\":\"text\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_seen\",\"Key\":\"is_seen\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"entry_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumFriendsBundle = struct {
    forum_friends: []const UserForumFeedEntry,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "forum_friends", .key = "forumFriends", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"forum_friends\",\"Key\":\"forumFriends\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserForumFeedEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumPostsBundle = struct {
    forum_posts: []const ForumPost,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "forum_posts", .key = "forumPosts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"forum_posts\",\"Key\":\"forumPosts\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"ForumPost\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumSubscribedThread = struct {
    id: ?u64,
    forum_id: ?u64,
    author: ?ForumUserSummary,
    title: ?[]const u8,
    posts: ?UserForumSubscribedThreadPosts,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "forum_id", .key = "forum_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "author", .key = "author", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "posts", .key = "posts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"forum_id\",\"Key\":\"forum_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"author\",\"Key\":\"author\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"ForumUserSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"posts\",\"Key\":\"posts\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserForumSubscribedThreadPosts\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumSubscribedThreadPosts = struct {
    new_posts: ?u64,
    total: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "new_posts", .key = "new", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"new_posts\",\"Key\":\"new\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumSubscribedThreadsBundle = struct {
    forum_subscribed_threads: []const UserForumSubscribedThread,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "forum_subscribed_threads", .key = "forumSubscribedThreads", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"forum_subscribed_threads\",\"Key\":\"forumSubscribedThreads\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserForumSubscribedThread\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserForumThreadsBundle = struct {
    forum_threads: []const ForumThread,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "forum_threads", .key = "forumThreads", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"forum_threads\",\"Key\":\"forumThreads\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"ForumThread\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserGymBundle = struct {
    active_gym: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "active_gym", .key = "active_gym", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"active_gym\",\"Key\":\"active_gym\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserHalloweenCompetition = struct {
    name: ?[]const u8,
    treats_collected: ?u64,
    basket: ?UserCompetitionBasket,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "treats_collected", .key = "treats_collected", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "basket", .key = "basket", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"treats_collected\",\"Key\":\"treats_collected\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"basket\",\"Key\":\"basket\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCompetitionBasket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserHofBundle = struct {
    hof: UserHofStats,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "hof", .key = "hof", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"hof\",\"Key\":\"hof\",\"Type\":{\"name\":\"UserHofStats\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserHofStats = struct {
    attacks: ?UserHofValue,
    busts: ?UserHofValue,
    defends: ?UserHofValue,
    networth: ?UserHofValue,
    offences: ?UserHofValue,
    revives: ?UserHofValue,
    level: ?UserHofValue,
    rank: ?UserHofValue,
    awards: ?UserHofValue,
    racing_skill: ?UserHofValueFloat,
    racing_points: ?UserHofValue,
    racing_wins: ?UserHofValue,
    travel_time: ?UserHofValue,
    working_stats: ?UserHofValue,
    battle_stats: ?UserHofValue,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacks", .key = "attacks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "busts", .key = "busts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "defends", .key = "defends", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "networth", .key = "networth", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "offences", .key = "offences", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "revives", .key = "revives", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "awards", .key = "awards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "racing_skill", .key = "racing_skill", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "racing_points", .key = "racing_points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "racing_wins", .key = "racing_wins", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "travel_time", .key = "travel_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "working_stats", .key = "working_stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "battle_stats", .key = "battle_stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacks\",\"Key\":\"attacks\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"busts\",\"Key\":\"busts\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"defends\",\"Key\":\"defends\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"networth\",\"Key\":\"networth\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"offences\",\"Key\":\"offences\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"revives\",\"Key\":\"revives\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"awards\",\"Key\":\"awards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"racing_skill\",\"Key\":\"racing_skill\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValueFloat\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"racing_points\",\"Key\":\"racing_points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"racing_wins\",\"Key\":\"racing_wins\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"travel_time\",\"Key\":\"travel_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"working_stats\",\"Key\":\"working_stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"battle_stats\",\"Key\":\"battle_stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserHofValue\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserHofValue = struct {
    value: ?i64,
    rank: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserHofValueFloat = struct {
    value: ?f64,
    rank: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserHonorsBundle = struct {
    honors: []const UserAwardUnlock,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "honors", .key = "honors", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"honors\",\"Key\":\"honors\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAwardUnlock\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserIcon = struct {
    id: ?u64,
    title: ?[]const u8,
    description: ?[]const u8,
    until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "until", .key = "until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"until\",\"Key\":\"until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserIconsBundle = struct {
    icons: []const UserIcon,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "icons", .key = "icons", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"icons\",\"Key\":\"icons\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserIcon\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserIdentitySummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserInventory = struct {
    items: []const UserInventoryItem,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserInventoryItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserInventoryBundle = struct {
    inventory: UserInventory,
    _metadata: ?PaginatedMetadataWithTotal,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "inventory", .key = "inventory", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"inventory\",\"Key\":\"inventory\",\"Type\":{\"name\":\"UserInventory\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadataWithTotal\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserInventoryItem = struct {
    id: ?u64,
    amount: ?u64,
    equipped: ?bool,
    name: ?[]const u8,
    faction_owned: ?bool,
    uid: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "equipped", .key = "equipped", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_owned", .key = "faction_owned", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"equipped\",\"Key\":\"equipped\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_owned\",\"Key\":\"faction_owned\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserItemMarketBundle = struct {
    itemmarket: []const UserItemMarketListing,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "itemmarket", .key = "itemmarket", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"itemmarket\",\"Key\":\"itemmarket\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserItemMarketListing\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserItemMarketItemBonus = struct {
    id: ?u64,
    title: ?[]const u8,
    description: ?[]const u8,
    value: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserItemMarketItemDetails = struct {
    id: ?u64,
    name: ?[]const u8,
    item_type: ?[]const u8,
    rarity: ?[]const u8,
    uid: ?u64,
    stats: ?UserItemMarketItemStats,
    bonuses: []const UserItemMarketItemBonus,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rarity", .key = "rarity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "uid", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonuses", .key = "bonuses", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rarity\",\"Key\":\"rarity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"uid\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserItemMarketItemStats\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonuses\",\"Key\":\"bonuses\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserItemMarketItemBonus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserItemMarketItemStats = struct {
    damage: ?f64,
    accuracy: ?f64,
    armor: ?f64,
    quality: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "damage", .key = "damage", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "accuracy", .key = "accuracy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "armor", .key = "armor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quality", .key = "quality", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"damage\",\"Key\":\"damage\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"accuracy\",\"Key\":\"accuracy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"armor\",\"Key\":\"armor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quality\",\"Key\":\"quality\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserItemMarketListing = struct {
    id: ?u64,
    price: ?i64,
    average_price: ?i64,
    amount: ?u64,
    is_anonymous: ?bool,
    available: ?u64,
    item: ?UserItemMarketItemDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "average_price", .key = "average_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_anonymous", .key = "is_anonymous", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "available", .key = "available", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item", .key = "item", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"average_price\",\"Key\":\"average_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_anonymous\",\"Key\":\"is_anonymous\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"available\",\"Key\":\"available\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item\",\"Key\":\"item\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserItemMarketItemDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserItemModsBundle = struct {
    itemmods: []const TornItemMod,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "itemmods", .key = "itemmods", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"itemmods\",\"Key\":\"itemmods\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TornItemMod\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserJobBundle = struct {
    job: ?UserEmployment,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "job", .key = "job", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"job\",\"Key\":\"job\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserEmployment\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserJobPointTotals = struct {
    army: ?u64,
    casino: ?u64,
    education: ?u64,
    grocer: ?u64,
    law: ?u64,
    medical: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "army", .key = "army", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "casino", .key = "casino", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "education", .key = "education", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "grocer", .key = "grocer", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "law", .key = "law", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "medical", .key = "medical", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"army\",\"Key\":\"army\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"casino\",\"Key\":\"casino\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"education\",\"Key\":\"education\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"grocer\",\"Key\":\"grocer\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"law\",\"Key\":\"law\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"medical\",\"Key\":\"medical\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserJobPoints = struct {
    jobs: ?UserJobPointTotals,
    companies: []const UserCompanyPoints,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "jobs", .key = "jobs", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "companies", .key = "companies", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"jobs\",\"Key\":\"jobs\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserJobPointTotals\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"companies\",\"Key\":\"companies\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserCompanyPoints\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserJobPointsBundle = struct {
    jobpoints: UserJobPoints,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "jobpoints", .key = "jobpoints", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"jobpoints\",\"Key\":\"jobpoints\",\"Type\":{\"name\":\"UserJobPoints\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserJobRanks = struct {
    army: ?[]const u8,
    grocer: ?[]const u8,
    casino: ?[]const u8,
    medical: ?[]const u8,
    law: ?[]const u8,
    education: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "army", .key = "army", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "grocer", .key = "grocer", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "casino", .key = "casino", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "medical", .key = "medical", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "law", .key = "law", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "education", .key = "education", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"army\",\"Key\":\"army\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"grocer\",\"Key\":\"grocer\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"casino\",\"Key\":\"casino\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"medical\",\"Key\":\"medical\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"law\",\"Key\":\"law\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"education\",\"Key\":\"education\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserJobRanksBundle = struct {
    jobranks: UserJobRanks,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "jobranks", .key = "jobranks", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"jobranks\",\"Key\":\"jobranks\",\"Type\":{\"name\":\"UserJobRanks\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserLastAction = struct {
    status: ?[]const u8,
    relative: ?[]const u8,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "relative", .key = "relative", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"relative\",\"Key\":\"relative\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserLegacyItemSummary = struct {
    id: ?u64,
    uid: ?u64,
    name: ?[]const u8,
    item_type: ?[]const u8,
    quantity: ?i64,
    circulation: ?i64,
    market_price: ?i64,
    cost: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "ID", .aliases = &.{
            "id",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "uid", .key = "UID", .aliases = &.{
            "uid",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "quantity", .key = "quantity", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "circulation", .key = "circulation", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market_price", .key = "market_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"ID\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"id\"],\"Custom\":\"\"},{\"Name\":\"uid\",\"Key\":\"UID\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"uid\"],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"quantity\",\"Key\":\"quantity\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"circulation\",\"Key\":\"circulation\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market_price\",\"Key\":\"market_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserLifeBar = struct {
    increment: ?u64,
    interval: ?u64,
    tick_time: ?u64,
    full_time: ?u64,
    current: ?u64,
    maximum: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "increment", .key = "increment", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "interval", .key = "interval", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tick_time", .key = "tick_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "full_time", .key = "full_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "maximum", .key = "maximum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"increment\",\"Key\":\"increment\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"interval\",\"Key\":\"interval\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tick_time\",\"Key\":\"tick_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"full_time\",\"Key\":\"full_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"maximum\",\"Key\":\"maximum\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserListBundle = struct {
    list: []const UserListEntry,
    _metadata: ?PaginatedMetadataWithTotal,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "list", .key = "list", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"list\",\"Key\":\"list\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserListEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadataWithTotal\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserListEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    level: ?u32,
    faction_id: ?u64,
    status: ?UserStatus,
    last_action: ?UserLastAction,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_action", .key = "last_action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserStatus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_action\",\"Key\":\"last_action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLastAction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserLogBundle = struct {
    log: []const UserLogEntry,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "log", .key = "log", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"log\",\"Key\":\"log\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserLogEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserLogDetails = struct {
    id: ?u64,
    title: ?[]const u8,
    category: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "category", .key = "category", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"category\",\"Key\":\"category\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserLogEntry = struct {
    id: ?[]const u8,
    timestamp: ?u64,
    details: ?UserLogDetails,
    data: DynamicValue,
    params: DynamicValue,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "data", .key = "data", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "params", .key = "params", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLogDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"data\",\"Key\":\"data\",\"Type\":{\"name\":\"DynamicValue\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"params\",\"Key\":\"params\",\"Type\":{\"name\":\"DynamicValue\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserLookupBundle = struct {
    selections: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "selections", .key = "selections", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"selections\",\"Key\":\"selections\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMedalsBundle = struct {
    medals: []const UserAwardUnlock,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "medals", .key = "medals", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"medals\",\"Key\":\"medals\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserAwardUnlock\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMeritUpgrade = struct {
    id: ?u64,
    level: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMerits = struct {
    upgrades: []const UserMeritUpgrade,
    available: ?u64,
    used: ?u64,
    medals: ?u64,
    honors: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "upgrades", .key = "upgrades", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "available", .key = "available", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "used", .key = "used", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "medals", .key = "medals", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "honors", .key = "honors", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"upgrades\",\"Key\":\"upgrades\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserMeritUpgrade\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"available\",\"Key\":\"available\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"used\",\"Key\":\"used\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"medals\",\"Key\":\"medals\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"honors\",\"Key\":\"honors\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMeritsBundle = struct {
    merits: UserMerits,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "merits", .key = "merits", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"merits\",\"Key\":\"merits\",\"Type\":{\"name\":\"UserMerits\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMessage = struct {
    id: ?u64,
    sender: ?UserIdentitySummary,
    timestamp: ?u64,
    topic: ?[]const u8,
    message_type: ?[]const u8,
    seen: ?bool,
    read: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sender", .key = "sender", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "topic", .key = "topic", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "message_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "seen", .key = "seen", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "read", .key = "read", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sender\",\"Key\":\"sender\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserIdentitySummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"topic\",\"Key\":\"topic\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"message_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"seen\",\"Key\":\"seen\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"read\",\"Key\":\"read\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMessagesBundle = struct {
    messages: []const UserMessage,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "messages", .key = "messages", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"messages\",\"Key\":\"messages\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserMessage\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMissionContract = struct {
    title: ?[]const u8,
    difficulty: ?[]const u8,
    status: ?[]const u8,
    created_at: ?u64,
    started_at: ?u64,
    expires_at: ?u64,
    completed_at: ?u64,
    rewards: ?UserMissionContractRewards,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "difficulty", .key = "difficulty", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "created_at", .key = "created_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "started_at", .key = "started_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "expires_at", .key = "expires_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "completed_at", .key = "completed_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rewards", .key = "rewards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"difficulty\",\"Key\":\"difficulty\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"created_at\",\"Key\":\"created_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"started_at\",\"Key\":\"started_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"expires_at\",\"Key\":\"expires_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"completed_at\",\"Key\":\"completed_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rewards\",\"Key\":\"rewards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserMissionContractRewards\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMissionContractRewards = struct {
    money: ?i64,
    credits: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "credits", .key = "credits", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"credits\",\"Key\":\"credits\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMissionGiver = struct {
    id: ?u64,
    name: ?[]const u8,
    contracts: []const UserMissionContract,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "contracts", .key = "contracts", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"contracts\",\"Key\":\"contracts\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserMissionContract\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMissionReward = struct {
    reward_type: ?[]const u8,
    details: ?UserMissionRewardDetails,
    amount: ?i64,
    cost: ?i64,
    expires_at: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "reward_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "expires_at", .key = "expires_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"reward_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserMissionRewardDetails\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"expires_at\",\"Key\":\"expires_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMissionRewardDetails = struct {
    id: ?u64,
    name: ?[]const u8,
    detail_type: ?[]const u8,
    sub_type: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "detail_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "sub_type", .key = "sub_type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"detail_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"sub_type\",\"Key\":\"sub_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMissions = struct {
    credits: ?u64,
    givers: []const UserMissionGiver,
    rewards: []const UserMissionReward,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "credits", .key = "credits", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "givers", .key = "givers", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rewards", .key = "rewards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"credits\",\"Key\":\"credits\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"givers\",\"Key\":\"givers\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserMissionGiver\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rewards\",\"Key\":\"rewards\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserMissionReward\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMissionsBundle = struct {
    missions: UserMissions,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "missions", .key = "missions", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"missions\",\"Key\":\"missions\",\"Type\":{\"name\":\"UserMissions\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMoney = struct {
    wallet: ?i64,
    vault: ?i64,
    company: ?i64,
    points: ?i64,
    cayman_bank: ?i64,
    daily_networth: ?i64,
    city_bank: ?UserCityBank,
    faction: ?UserFactionMoney,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "wallet", .key = "wallet", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "vault", .key = "vault", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company", .key = "company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cayman_bank", .key = "cayman_bank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "daily_networth", .key = "daily_networth", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "city_bank", .key = "city_bank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"wallet\",\"Key\":\"wallet\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"vault\",\"Key\":\"vault\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company\",\"Key\":\"company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cayman_bank\",\"Key\":\"cayman_bank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"daily_networth\",\"Key\":\"daily_networth\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"city_bank\",\"Key\":\"city_bank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCityBank\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserFactionMoney\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserMoneyBundle = struct {
    money: UserMoney,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"UserMoney\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserNetworth = struct {
    pending: ?i64,
    wallet: ?i64,
    bank: ?i64,
    points: ?i64,
    cayman: ?i64,
    vault: ?i64,
    piggybank: ?i64,
    items: ?i64,
    displaycase: ?i64,
    bazaar: ?i64,
    trade: ?i64,
    itemmarket: ?i64,
    properties: ?i64,
    stockmarket: ?i64,
    auctionhouse: ?i64,
    company: ?i64,
    bookie: ?i64,
    enlistedcars: ?i64,
    loan: ?i64,
    unpaidfees: ?i64,
    total: ?i64,
    parsetime: ?f64,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "pending", .key = "pending", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "wallet", .key = "wallet", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bank", .key = "bank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "points", .key = "points", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cayman", .key = "cayman", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "vault", .key = "vault", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "piggybank", .key = "piggybank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "displaycase", .key = "displaycase", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bazaar", .key = "bazaar", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "trade", .key = "trade", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "itemmarket", .key = "itemmarket", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "properties", .key = "properties", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stockmarket", .key = "stockmarket", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "auctionhouse", .key = "auctionhouse", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "company", .key = "company", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bookie", .key = "bookie", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "enlistedcars", .key = "enlistedcars", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "loan", .key = "loan", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "unpaidfees", .key = "unpaidfees", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "parsetime", .key = "parsetime", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"pending\",\"Key\":\"pending\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"wallet\",\"Key\":\"wallet\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bank\",\"Key\":\"bank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"points\",\"Key\":\"points\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cayman\",\"Key\":\"cayman\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"vault\",\"Key\":\"vault\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"piggybank\",\"Key\":\"piggybank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"displaycase\",\"Key\":\"displaycase\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bazaar\",\"Key\":\"bazaar\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"trade\",\"Key\":\"trade\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"itemmarket\",\"Key\":\"itemmarket\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"properties\",\"Key\":\"properties\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stockmarket\",\"Key\":\"stockmarket\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"auctionhouse\",\"Key\":\"auctionhouse\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"company\",\"Key\":\"company\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bookie\",\"Key\":\"bookie\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"enlistedcars\",\"Key\":\"enlistedcars\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"loan\",\"Key\":\"loan\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"unpaidfees\",\"Key\":\"unpaidfees\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"parsetime\",\"Key\":\"parsetime\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserNetworthBundle = struct {
    networth: UserNetworth,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "networth", .key = "networth", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"networth\",\"Key\":\"networth\",\"Type\":{\"name\":\"UserNetworth\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserNewEventsBundle = struct {
    events: []const UserEvent,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "events", .key = "events", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"events\",\"Key\":\"events\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserEvent\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserNewMessagesBundle = struct {
    messages: []const UserMessage,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "messages", .key = "messages", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"messages\",\"Key\":\"messages\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserMessage\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserNotifications = struct {
    messages: ?u64,
    events: ?u64,
    awards: ?u64,
    competition: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "messages", .key = "messages", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "events", .key = "events", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "awards", .key = "awards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "competition", .key = "competition", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"messages\",\"Key\":\"messages\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"events\",\"Key\":\"events\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"awards\",\"Key\":\"awards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"competition\",\"Key\":\"competition\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserNotificationsBundle = struct {
    notifications: UserNotifications,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "notifications", .key = "notifications", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"notifications\",\"Key\":\"notifications\",\"Type\":{\"name\":\"UserNotifications\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrime = struct {
    id: ?u64,
    previous_crime_id: ?u64,
    name: ?[]const u8,
    difficulty: ?u64,
    status: ?[]const u8,
    created_at: ?u64,
    planning_at: ?u64,
    ready_at: ?u64,
    expired_at: ?u64,
    executed_at: ?u64,
    slots: []const UserOrganizedCrimeSlot,
    rewards: ?UserOrganizedCrimeRewards,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "previous_crime_id", .key = "previous_crime_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "difficulty", .key = "difficulty", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "created_at", .key = "created_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "planning_at", .key = "planning_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "ready_at", .key = "ready_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "expired_at", .key = "expired_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "executed_at", .key = "executed_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "slots", .key = "slots", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rewards", .key = "rewards", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"previous_crime_id\",\"Key\":\"previous_crime_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"difficulty\",\"Key\":\"difficulty\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"created_at\",\"Key\":\"created_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"planning_at\",\"Key\":\"planning_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"ready_at\",\"Key\":\"ready_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"expired_at\",\"Key\":\"expired_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"executed_at\",\"Key\":\"executed_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"slots\",\"Key\":\"slots\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserOrganizedCrimeSlot\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rewards\",\"Key\":\"rewards\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserOrganizedCrimeRewards\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeBundle = struct {
    organized_crime: ?UserOrganizedCrimeSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "organized_crime", .key = "organizedCrime", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"organized_crime\",\"Key\":\"organizedCrime\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserOrganizedCrimeSelection\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeError = struct {
    code: ?u64,
    @"error": ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "code", .key = "code", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "error", .key = "error", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"code\",\"Key\":\"code\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"error\",\"Key\":\"error\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeItemRequirement = struct {
    id: ?u64,
    is_reusable: ?bool,
    is_available: ?bool,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_reusable", .key = "is_reusable", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_available", .key = "is_available", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_reusable\",\"Key\":\"is_reusable\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_available\",\"Key\":\"is_available\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimePositionInfo = struct {
    id: ?[]const u8,
    label: ?[]const u8,
    number: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "label", .key = "label", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "number", .key = "number", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"label\",\"Key\":\"label\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"number\",\"Key\":\"number\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeRewardItem = struct {
    id: ?u64,
    amount: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{
            "amount",
            "quantity",
        }, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[\"amount\",\"quantity\"],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeRewards = struct {
    money: ?i64,
    respect: ?i64,
    items: []const UserOrganizedCrimeRewardItem,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "money", .key = "money", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "respect", .key = "respect", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"money\",\"Key\":\"money\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"respect\",\"Key\":\"respect\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserOrganizedCrimeRewardItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeSelection = union(enum) {
    v0: *UserOrganizedCrime,
    v1: UserOrganizedCrimeError,
    pub const compatibility_name = "UserOrganizedCrimeSelection";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"box\",\"arguments\":[{\"name\":\"UserOrganizedCrime\"}]},{\"name\":\"UserOrganizedCrimeError\"}],\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeSlot = struct {
    position: ?[]const u8,
    position_info: ?UserOrganizedCrimePositionInfo,
    item_requirement: ?UserOrganizedCrimeItemRequirement,
    user: ?UserOrganizedCrimeUser,
    checkpoint_pass_rate: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position_info", .key = "position_info", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_requirement", .key = "item_requirement", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "checkpoint_pass_rate", .key = "checkpoint_pass_rate", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position_info\",\"Key\":\"position_info\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserOrganizedCrimePositionInfo\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_requirement\",\"Key\":\"item_requirement\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserOrganizedCrimeItemRequirement\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserOrganizedCrimeUser\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"checkpoint_pass_rate\",\"Key\":\"checkpoint_pass_rate\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserOrganizedCrimeUser = struct {
    outcome: ?[]const u8,
    id: ?u64,
    joined_at: ?u64,
    progress: ?u64,
    item_outcome: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "outcome", .key = "outcome", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "joined_at", .key = "joined_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "progress", .key = "progress", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "item_outcome", .key = "item_outcome", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"outcome\",\"Key\":\"outcome\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"joined_at\",\"Key\":\"joined_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"progress\",\"Key\":\"progress\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"item_outcome\",\"Key\":\"item_outcome\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPerksBundle = struct {
    faction_perks: []const []const u8,
    job_perks: []const []const u8,
    property_perks: []const []const u8,
    education_perks: []const []const u8,
    enhancer_perks: []const []const u8,
    book_perks: []const []const u8,
    stock_perks: []const []const u8,
    merit_perks: []const []const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "faction_perks", .key = "faction_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "job_perks", .key = "job_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "property_perks", .key = "property_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "education_perks", .key = "education_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "enhancer_perks", .key = "enhancer_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "book_perks", .key = "book_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "stock_perks", .key = "stock_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "merit_perks", .key = "merit_perks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"faction_perks\",\"Key\":\"faction_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"job_perks\",\"Key\":\"job_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"property_perks\",\"Key\":\"property_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"education_perks\",\"Key\":\"education_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"enhancer_perks\",\"Key\":\"enhancer_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"book_perks\",\"Key\":\"book_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"stock_perks\",\"Key\":\"stock_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"merit_perks\",\"Key\":\"merit_perks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPersonalStatPoint = struct {
    name: ?[]const u8,
    value: ?i64,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "value", .key = "value", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"value\",\"Key\":\"value\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPersonalStatsBucket = struct {
    stats: model.Map(DynamicValue),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "stats", .key = "stats", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"stats\",\"Key\":\"stats\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"DynamicValue\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPersonalStatsBundle = struct {
    personalstats: ?UserPersonalStatsSelection,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "personalstats", .key = "personalstats", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"personalstats\",\"Key\":\"personalstats\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsSelection\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPersonalStatsCategory = struct {
    attacking: ?UserPersonalStatsBucket,
    jobs: ?UserPersonalStatsBucket,
    hospital: ?UserPersonalStatsBucket,
    crimes: ?UserPersonalStatsBucket,
    items: ?UserPersonalStatsBucket,
    travel: ?UserPersonalStatsBucket,
    drugs: ?UserPersonalStatsBucket,
    networth: ?UserPersonalStatsBucket,
    other: ?UserPersonalStatsBucket,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "attacking", .key = "attacking", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "jobs", .key = "jobs", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "hospital", .key = "hospital", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "crimes", .key = "crimes", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "travel", .key = "travel", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "drugs", .key = "drugs", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "networth", .key = "networth", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "other", .key = "other", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"attacking\",\"Key\":\"attacking\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"jobs\",\"Key\":\"jobs\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"hospital\",\"Key\":\"hospital\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"crimes\",\"Key\":\"crimes\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"travel\",\"Key\":\"travel\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"drugs\",\"Key\":\"drugs\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"networth\",\"Key\":\"networth\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"other\",\"Key\":\"other\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPersonalStatsBucket\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPersonalStatsSelection = union(enum) {
    v0: *UserPersonalStatsCategory,
    v1: []const UserPersonalStatPoint,
    v2: model.Raw,
    pub const compatibility_name = "UserPersonalStatsSelection";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"box\",\"arguments\":[{\"name\":\"UserPersonalStatsCategory\"}]},{\"name\":\"array\",\"arguments\":[{\"name\":\"UserPersonalStatPoint\"}]},{\"name\":\"raw\"}],\"Type\":{\"name\":\"\"}}";
};
pub const UserProfile = struct {
    donator_status: ?current.UserDonatorStatusEnum,
    revive_setting: ?current.ReviveSetting,
    id: ?u64,
    name: ?[]const u8,
    level: ?u32,
    rank: ?[]const u8,
    faction_id: ?u64,
    age: ?u32,
    karma: ?i64,
    revivable: ?bool,
    life: ?UserLifeBar,
    last_action: ?UserLastAction,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "donator_status", .key = "donator_status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "revive_setting", .key = "revive_setting", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rank", .key = "rank", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "age", .key = "age", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "karma", .key = "karma", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "revivable", .key = "revivable", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "life", .key = "life", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_action", .key = "last_action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"donator_status\",\"Key\":\"donator_status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserDonatorStatusEnum\",\"external\":true}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"revive_setting\",\"Key\":\"revive_setting\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"ReviveSetting\",\"external\":true}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rank\",\"Key\":\"rank\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"age\",\"Key\":\"age\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint32\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"karma\",\"Key\":\"karma\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"revivable\",\"Key\":\"revivable\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"life\",\"Key\":\"life\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLifeBar\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_action\",\"Key\":\"last_action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserLastAction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserProfileBundle = struct {
    profile: UserProfile,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "profile", .key = "profile", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"profile\",\"Key\":\"profile\",\"Type\":{\"name\":\"UserProfile\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPropertiesBundle = struct {
    properties: []const UserPropertySummary,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "properties", .key = "properties", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"properties\",\"Key\":\"properties\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserPropertySummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPropertyBundle = struct {
    property: UserPropertySummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "property", .key = "property", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"property\",\"Key\":\"property\",\"Type\":{\"name\":\"UserPropertySummary\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPropertyKind = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPropertyLeaseExtension = struct {
    cost: ?i64,
    period: ?u64,
    created_at: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "period", .key = "period", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "created_at", .key = "created_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"period\",\"Key\":\"period\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"created_at\",\"Key\":\"created_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPropertyStaffEntry = struct {
    staff_type: ?[]const u8,
    amount: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "staff_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "amount", .key = "amount", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"staff_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"amount\",\"Key\":\"amount\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPropertySummary = struct {
    id: ?u64,
    owner: ?UserIdentitySummary,
    property_info: ?UserPropertyKind,
    happy: ?i64,
    upkeep: ?UserPropertyUpkeep,
    market_price: ?i64,
    modifications: []const []const u8,
    staff: []const UserPropertyStaffEntry,
    status: ?[]const u8,
    used_by: []const UserIdentitySummary,
    cost: ?i64,
    cost_per_day: ?i64,
    rental_period: ?u64,
    rental_period_remaining: ?u64,
    rented_by: ?UserIdentitySummary,
    renter_asked: ?UserIdentitySummary,
    lease_extension: ?UserPropertyLeaseExtension,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "owner", .key = "owner", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "property_info", .key = "property", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "happy", .key = "happy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "upkeep", .key = "upkeep", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "market_price", .key = "market_price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modifications", .key = "modifications", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "staff", .key = "staff", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "used_by", .key = "used_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost", .key = "cost", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "cost_per_day", .key = "cost_per_day", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rental_period", .key = "rental_period", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rental_period_remaining", .key = "rental_period_remaining", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "rented_by", .key = "rented_by", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "renter_asked", .key = "renter_asked", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "lease_extension", .key = "lease_extension", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"owner\",\"Key\":\"owner\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserIdentitySummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"property_info\",\"Key\":\"property\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPropertyKind\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"happy\",\"Key\":\"happy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"upkeep\",\"Key\":\"upkeep\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPropertyUpkeep\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"market_price\",\"Key\":\"market_price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modifications\",\"Key\":\"modifications\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"staff\",\"Key\":\"staff\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserPropertyStaffEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"used_by\",\"Key\":\"used_by\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserIdentitySummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost\",\"Key\":\"cost\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"cost_per_day\",\"Key\":\"cost_per_day\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rental_period\",\"Key\":\"rental_period\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rental_period_remaining\",\"Key\":\"rental_period_remaining\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"rented_by\",\"Key\":\"rented_by\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserIdentitySummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"renter_asked\",\"Key\":\"renter_asked\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserIdentitySummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"lease_extension\",\"Key\":\"lease_extension\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserPropertyLeaseExtension\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserPropertyUpkeep = struct {
    property_cost: ?i64,
    staff: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "property_cost", .key = "property", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "staff", .key = "staff", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"property_cost\",\"Key\":\"property\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"staff\",\"Key\":\"staff\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRace = struct {
    id: ?u64,
    title: ?[]const u8,
    track_id: ?u64,
    creator_id: ?u64,
    status: ?[]const u8,
    laps: ?u64,
    participants: ?UserRaceParticipants,
    schedule: ?UserRaceSchedule,
    requirements: ?UserRaceRequirements,
    is_official: ?bool,
    skill_gain: ?f64,
    results: []const UserRaceResult,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "title", .key = "title", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "track_id", .key = "track_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "creator_id", .key = "creator_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "laps", .key = "laps", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "participants", .key = "participants", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "schedule", .key = "schedule", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "requirements", .key = "requirements", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "is_official", .key = "is_official", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "skill_gain", .key = "skill_gain", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "results", .key = "results", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"title\",\"Key\":\"title\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"track_id\",\"Key\":\"track_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"creator_id\",\"Key\":\"creator_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"laps\",\"Key\":\"laps\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"participants\",\"Key\":\"participants\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserRaceParticipants\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"schedule\",\"Key\":\"schedule\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserRaceSchedule\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"requirements\",\"Key\":\"requirements\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserRaceRequirements\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"is_official\",\"Key\":\"is_official\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"skill_gain\",\"Key\":\"skill_gain\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"results\",\"Key\":\"results\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserRaceResult\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRaceParticipants = struct {
    minimum: ?u64,
    maximum: ?u64,
    current: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "minimum", .key = "minimum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "maximum", .key = "maximum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"minimum\",\"Key\":\"minimum\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"maximum\",\"Key\":\"maximum\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRaceRequirements = struct {
    driver_class: ?[]const u8,
    car_class: ?[]const u8,
    car_item_id: ?u64,
    requires_stock_car: ?bool,
    requires_password: ?bool,
    join_fee: ?i64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "driver_class", .key = "driver_class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_class", .key = "car_class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_id", .key = "car_item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "requires_stock_car", .key = "requires_stock_car", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "requires_password", .key = "requires_password", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "join_fee", .key = "join_fee", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"driver_class\",\"Key\":\"driver_class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_class\",\"Key\":\"car_class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_id\",\"Key\":\"car_item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"requires_stock_car\",\"Key\":\"requires_stock_car\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"requires_password\",\"Key\":\"requires_password\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"join_fee\",\"Key\":\"join_fee\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRaceResult = struct {
    driver_id: ?u64,
    position: ?u64,
    car_id: ?u64,
    car_item_id: ?u64,
    car_item_name: ?[]const u8,
    car_class: ?[]const u8,
    has_crashed: ?bool,
    best_lap_time: ?f64,
    race_time: ?f64,
    time_ended: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "driver_id", .key = "driver_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "position", .key = "position", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_id", .key = "car_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_id", .key = "car_item_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_item_name", .key = "car_item_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_class", .key = "car_class", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "has_crashed", .key = "has_crashed", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "best_lap_time", .key = "best_lap_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "race_time", .key = "race_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "time_ended", .key = "time_ended", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"driver_id\",\"Key\":\"driver_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"position\",\"Key\":\"position\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_id\",\"Key\":\"car_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_id\",\"Key\":\"car_item_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_item_name\",\"Key\":\"car_item_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_class\",\"Key\":\"car_class\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"has_crashed\",\"Key\":\"has_crashed\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"best_lap_time\",\"Key\":\"best_lap_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"race_time\",\"Key\":\"race_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"time_ended\",\"Key\":\"time_ended\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRaceSchedule = struct {
    join_from: ?u64,
    join_until: ?u64,
    start: ?u64,
    end: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "join_from", .key = "join_from", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "join_until", .key = "join_until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "start", .key = "start", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "end", .key = "end", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"join_from\",\"Key\":\"join_from\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"join_until\",\"Key\":\"join_until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"start\",\"Key\":\"start\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"end\",\"Key\":\"end\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRaceTrackSummary = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRacesBundle = struct {
    races: []const UserRace,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "races", .key = "races", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"races\",\"Key\":\"races\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserRace\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRacingLapRecord = struct {
    car_id: ?u64,
    car_name: ?[]const u8,
    lap_time: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "car_id", .key = "car_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "car_name", .key = "car_name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "lap_time", .key = "lap_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"car_id\",\"Key\":\"car_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"car_name\",\"Key\":\"car_name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"lap_time\",\"Key\":\"lap_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRacingRecordSummary = struct {
    track: ?UserRaceTrackSummary,
    records: []const UserRacingLapRecord,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "track", .key = "track", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "records", .key = "records", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"track\",\"Key\":\"track\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserRaceTrackSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"records\",\"Key\":\"records\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserRacingLapRecord\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRacingRecordsBundle = struct {
    racingrecords: []const UserRacingRecordSummary,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "racingrecords", .key = "racingrecords", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"racingrecords\",\"Key\":\"racingrecords\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserRacingRecordSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRefills = struct {
    energy: ?bool,
    nerve: ?bool,
    token: ?bool,
    special_count: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "energy", .key = "energy", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "nerve", .key = "nerve", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "token", .key = "token", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "special_count", .key = "special_count", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"energy\",\"Key\":\"energy\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"nerve\",\"Key\":\"nerve\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"token\",\"Key\":\"token\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"special_count\",\"Key\":\"special_count\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRefillsBundle = struct {
    refills: UserRefills,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "refills", .key = "refills", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"refills\",\"Key\":\"refills\",\"Type\":{\"name\":\"UserRefills\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserReportDetails = struct {
    fields: model.Map(DynamicValue),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "fields", .key = "fields", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"fields\",\"Key\":\"fields\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"DynamicValue\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserReportSummary = struct {
    report_type: ?[]const u8,
    target_id: ?u64,
    reporter_id: ?u64,
    faction_id: ?u64,
    timestamp: ?u64,
    report: UserReportDetails,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "report_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target_id", .key = "target_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reporter_id", .key = "reporter_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "report", .key = "report", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"report_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target_id\",\"Key\":\"target_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reporter_id\",\"Key\":\"reporter_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"report\",\"Key\":\"report\",\"Type\":{\"name\":\"UserReportDetails\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserReportsBundle = struct {
    reports: []const UserReportSummary,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "reports", .key = "reports", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"reports\",\"Key\":\"reports\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserReportSummary\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserResourceBar = struct {
    increment: ?u64,
    interval: ?u64,
    tick_time: ?u64,
    full_time: ?u64,
    current: ?u64,
    maximum: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "increment", .key = "increment", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "interval", .key = "interval", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "tick_time", .key = "tick_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "full_time", .key = "full_time", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "current", .key = "current", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "maximum", .key = "maximum", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"increment\",\"Key\":\"increment\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"interval\",\"Key\":\"interval\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"tick_time\",\"Key\":\"tick_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"full_time\",\"Key\":\"full_time\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"current\",\"Key\":\"current\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"maximum\",\"Key\":\"maximum\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRevive = struct {
    id: ?u64,
    reviver: ?UserReviveReviver,
    target: ?UserReviveTarget,
    success_chance: ?f64,
    result: ?[]const u8,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reviver", .key = "reviver", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target", .key = "target", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "success_chance", .key = "success_chance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "result", .key = "result", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reviver\",\"Key\":\"reviver\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserReviveReviver\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target\",\"Key\":\"target\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserReviveTarget\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"success_chance\",\"Key\":\"success_chance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"result\",\"Key\":\"result\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserReviveFull = struct {
    id: ?u64,
    reviver: ?UserReviveReviver,
    target: ?UserReviveTarget,
    success_chance: ?f64,
    result: ?[]const u8,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "reviver", .key = "reviver", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "target", .key = "target", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "success_chance", .key = "success_chance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "result", .key = "result", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"reviver\",\"Key\":\"reviver\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserReviveReviver\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"target\",\"Key\":\"target\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserReviveTarget\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"success_chance\",\"Key\":\"success_chance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"result\",\"Key\":\"result\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserReviveLastAction = union(enum) {
    v0: UserLastAction,
    v1: u64,
    v2: model.Raw,
    pub const compatibility_name = "UserReviveLastAction";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"UserLastAction\"},{\"name\":\"uint64\"},{\"name\":\"raw\"}],\"Type\":{\"name\":\"\"}}";
};
pub const UserReviveReviver = struct {
    id: ?u64,
    name: ?[]const u8,
    faction: ?UserAttackFaction,
    faction_id: ?u64,
    skill: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "skill", .key = "skill", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackFaction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"skill\",\"Key\":\"skill\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserReviveTarget = struct {
    id: ?u64,
    name: ?[]const u8,
    faction: ?UserAttackFaction,
    faction_id: ?u64,
    hospital_reason: ?[]const u8,
    early_discharge: ?bool,
    last_action: ?UserReviveLastAction,
    online_status: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction", .key = "faction", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "faction_id", .key = "faction_id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "hospital_reason", .key = "hospital_reason", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "early_discharge", .key = "early_discharge", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "last_action", .key = "last_action", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "online_status", .key = "online_status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction\",\"Key\":\"faction\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserAttackFaction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"faction_id\",\"Key\":\"faction_id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"hospital_reason\",\"Key\":\"hospital_reason\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"early_discharge\",\"Key\":\"early_discharge\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"last_action\",\"Key\":\"last_action\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserReviveLastAction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"online_status\",\"Key\":\"online_status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRevivesBundle = struct {
    revives: []const UserRevive,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "revives", .key = "revives", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"revives\",\"Key\":\"revives\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserRevive\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRevivesFullBundle = struct {
    revives: []const UserReviveFull,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "revives", .key = "revives", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"revives\",\"Key\":\"revives\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserReviveFull\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserRpsCompetition = struct {
    name: ?[]const u8,
    status: ?[]const u8,
    hp: ?UserCompetitionHp,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "status", .key = "status", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "hp", .key = "hp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"status\",\"Key\":\"status\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"hp\",\"Key\":\"hp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserCompetitionHp\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserSkill = struct {
    slug: ?[]const u8,
    name: ?[]const u8,
    level: ?f64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "slug", .key = "slug", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "level", .key = "level", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"slug\",\"Key\":\"slug\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"level\",\"Key\":\"level\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserSkillsBundle = struct {
    skills: []const UserSkill,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "skills", .key = "skills", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"skills\",\"Key\":\"skills\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserSkill\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserStatus = struct {
    state: ?[]const u8,
    color: ?[]const u8,
    description: ?[]const u8,
    details: ?[]const u8,
    plane_image_type: ?[]const u8,
    until: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "state", .key = "state", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "color", .key = "color", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "details", .key = "details", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "plane_image_type", .key = "plane_image_type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "until", .key = "until", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"state\",\"Key\":\"state\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"color\",\"Key\":\"color\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"details\",\"Key\":\"details\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"plane_image_type\",\"Key\":\"plane_image_type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"until\",\"Key\":\"until\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserStockBonus = struct {
    available: ?bool,
    increment: ?u64,
    progress: ?u64,
    frequency: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "available", .key = "available", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "increment", .key = "increment", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "progress", .key = "progress", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "frequency", .key = "frequency", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"available\",\"Key\":\"available\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"bool\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"increment\",\"Key\":\"increment\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"progress\",\"Key\":\"progress\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"frequency\",\"Key\":\"frequency\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserStockHolding = struct {
    id: ?u64,
    shares: ?i64,
    transactions: []const UserStockTransaction,
    bonus: ?UserStockBonus,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "shares", .key = "shares", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "transactions", .key = "transactions", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "bonus", .key = "bonus", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"shares\",\"Key\":\"shares\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"transactions\",\"Key\":\"transactions\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserStockTransaction\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"bonus\",\"Key\":\"bonus\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserStockBonus\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserStockTransaction = struct {
    id: ?u64,
    shares: ?i64,
    price: ?f64,
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "shares", .key = "shares", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "price", .key = "price", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"shares\",\"Key\":\"shares\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"int64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"price\",\"Key\":\"price\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"float64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserStocksBundle = struct {
    stocks: []const UserStockHolding,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "stocks", .key = "stocks", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"stocks\",\"Key\":\"stocks\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserStockHolding\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTimestampBundle = struct {
    timestamp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTrade = struct {
    completed_at: ?u64,
    expires_at: ?u64,
    modified_at: ?u64,
    id: ?u64,
    timestamp: UserTradeTimestamp,
    description: ?[]const u8,
    user: ?UserTradeParticipant,
    trader: ?UserTradeParticipant,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "completed_at", .key = "completed_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "expires_at", .key = "expires_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modified_at", .key = "modified_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "trader", .key = "trader", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"completed_at\",\"Key\":\"completed_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"expires_at\",\"Key\":\"expires_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modified_at\",\"Key\":\"modified_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"UserTradeTimestamp\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserTradeParticipant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"trader\",\"Key\":\"trader\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserTradeParticipant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTradeBundle = struct {
    trade: UserTradeDetailed,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "trade", .key = "trade", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"trade\",\"Key\":\"trade\",\"Type\":{\"name\":\"UserTradeDetailed\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTradeDetailed = struct {
    completed_at: ?u64,
    expires_at: ?u64,
    modified_at: ?u64,
    id: ?u64,
    timestamp: UserTradeTimestamp,
    description: ?[]const u8,
    trade_type: ?[]const u8,
    user: ?UserTradeParticipant,
    trader: ?UserTradeParticipant,
    items: []const TradeItem,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "completed_at", .key = "completed_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "expires_at", .key = "expires_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "modified_at", .key = "modified_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "timestamp", .key = "timestamp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "description", .key = "description", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "trade_type", .key = "type", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "user", .key = "user", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "trader", .key = "trader", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "items", .key = "items", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"completed_at\",\"Key\":\"completed_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"expires_at\",\"Key\":\"expires_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"modified_at\",\"Key\":\"modified_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"timestamp\",\"Key\":\"timestamp\",\"Type\":{\"name\":\"UserTradeTimestamp\"},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"description\",\"Key\":\"description\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"trade_type\",\"Key\":\"type\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"user\",\"Key\":\"user\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserTradeParticipant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"trader\",\"Key\":\"trader\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"UserTradeParticipant\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"items\",\"Key\":\"items\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"TradeItem\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTradeParticipant = struct {
    id: ?u64,
    name: ?[]const u8,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTradeTimestamp = union(enum) {
    v0: void,
    v1: u64,
    v2: bool,
    v3: model.Raw,
    pub const compatibility_name = "UserTradeTimestamp";
    pub const compatibility_json = "{\"Kind\":\"union\",\"Fields\":null,\"Variants\":[{\"name\":\"null\"},{\"name\":\"uint64\"},{\"name\":\"bool\"},{\"name\":\"raw\"}],\"Type\":{\"name\":\"\"}}";
};
pub const UserTradesBundle = struct {
    trades: []const UserTrade,
    _metadata: ?PaginatedMetadata,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "trades", .key = "trades", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "_metadata", .key = "_metadata", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"trades\",\"Key\":\"trades\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserTrade\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"_metadata\",\"Key\":\"_metadata\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"PaginatedMetadata\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTravel = struct {
    destination: ?[]const u8,
    method: ?[]const u8,
    time_left: ?u64,
    arrival_at: ?u64,
    departed_at: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "destination", .key = "destination", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "method", .key = "method", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "time_left", .key = "time_left", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "arrival_at", .key = "arrival_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "departed_at", .key = "departed_at", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"destination\",\"Key\":\"destination\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"method\",\"Key\":\"method\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"time_left\",\"Key\":\"time_left\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"arrival_at\",\"Key\":\"arrival_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"departed_at\",\"Key\":\"departed_at\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserTravelBundle = struct {
    travel: UserTravel,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "travel", .key = "travel", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"travel\",\"Key\":\"travel\",\"Type\":{\"name\":\"UserTravel\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserWeaponExpBundle = struct {
    weaponexp: []const UserWeaponExpEntry,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "weaponexp", .key = "weaponexp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"weaponexp\",\"Key\":\"weaponexp\",\"Type\":{\"name\":\"array\",\"arguments\":[{\"name\":\"UserWeaponExpEntry\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserWeaponExpEntry = struct {
    id: ?u64,
    name: ?[]const u8,
    exp: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "id", .key = "id", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "name", .key = "name", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "exp", .key = "exp", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"id\",\"Key\":\"id\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"name\",\"Key\":\"name\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"string\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"exp\",\"Key\":\"exp\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserWorkStats = struct {
    endurance: ?u64,
    intelligence: ?u64,
    manual_labor: ?u64,
    total: ?u64,
    extra: model.Map(model.Raw),
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "endurance", .key = "endurance", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "intelligence", .key = "intelligence", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "manual_labor", .key = "manual_labor", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "total", .key = "total", .aliases = &.{}, .has_default = true, .flatten = false, .custom = "" },
        .{ .name = "extra", .key = "extra", .aliases = &.{}, .has_default = true, .flatten = true, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"endurance\",\"Key\":\"endurance\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"intelligence\",\"Key\":\"intelligence\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"manual_labor\",\"Key\":\"manual_labor\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"total\",\"Key\":\"total\",\"Type\":{\"name\":\"optional\",\"arguments\":[{\"name\":\"uint64\"}]},\"Default\":true,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"},{\"Name\":\"extra\",\"Key\":\"extra\",\"Type\":{\"name\":\"map\",\"arguments\":[{\"name\":\"string\"},{\"name\":\"raw\"}]},\"Default\":true,\"Flatten\":true,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const UserWorkStatsBundle = struct {
    workstats: UserWorkStats,
    pub const compatibility_fields = [_]model.CompatField{
        .{ .name = "workstats", .key = "workstats", .aliases = &.{}, .has_default = false, .flatten = false, .custom = "" },
    };
    pub const compatibility_json = "{\"Kind\":\"struct\",\"Fields\":[{\"Name\":\"workstats\",\"Key\":\"workstats\",\"Type\":{\"name\":\"UserWorkStats\"},\"Default\":false,\"Flatten\":false,\"Aliases\":[],\"Custom\":\"\"}],\"Variants\":null,\"Type\":{\"name\":\"\"}}";
};
pub const schema_count = 549;
pub const all_types = .{
    CompanyApplicationStats,
    CompanyApplicationSummary,
    CompanyApplicationUser,
    CompanyApplicationsBundle,
    CompanyCompaniesBundle,
    CompanyCustomers,
    CompanyDetailedBundle,
    CompanyDirector,
    CompanyEmployee,
    CompanyEmployeeEffectiveness,
    CompanyEmployeeStats,
    CompanyEmployeesBundle,
    CompanyIncome,
    CompanyLookupBundle,
    CompanyNewsBundle,
    CompanyNewsEntry,
    CompanyProfile,
    CompanyProfileBundle,
    CompanyProfileEmployee,
    CompanyProfileEmployeeDetails,
    CompanySearchBundle,
    CompanySearchEntry,
    CompanyStockBundle,
    CompanyStockEntry,
    CompanyTimestampBundle,
    CompanyType,
    CompanyUpgrades,
    DynamicValue,
    FactionApplicantStats,
    FactionApplicantSummary,
    FactionApplicationSummary,
    FactionApplicationsBundle,
    FactionArmorBundle,
    FactionAttacksBundle,
    FactionAttacksFullBundle,
    FactionBalanceBundle,
    FactionBalanceFaction,
    FactionBalanceMember,
    FactionBalanceSummary,
    FactionBasic,
    FactionBasicBundle,
    FactionBoostersBundle,
    FactionCachesBundle,
    FactionCesiumBundle,
    FactionChainBundle,
    FactionChainReportAttackerRespectSummary,
    FactionChainReportAttackerSummary,
    FactionChainReportAttacksSummary,
    FactionChainReportBonusSummary,
    FactionChainReportBundle,
    FactionChainReportDetailsSummary,
    FactionChainReportSummary,
    FactionChainSummary,
    FactionChainWarfareSummary,
    FactionChainsBundle,
    FactionContributorSummary,
    FactionContributorsBundle,
    FactionCrime,
    FactionCrimeBundle,
    FactionCrimeExpBundle,
    FactionCrimeExpEntry,
    FactionCrimeExpSelection,
    FactionCrimeItemRequirement,
    FactionCrimePositionInfo,
    FactionCrimeReward,
    FactionCrimeRewardItem,
    FactionCrimeRewardPayout,
    FactionCrimeSlot,
    FactionCrimeUser,
    FactionCrimeUserItemOutcome,
    FactionCrimesBundle,
    FactionDrugsBundle,
    FactionHofBundle,
    FactionHofSummary,
    FactionHofValue,
    FactionHofValueString,
    FactionLastAction,
    FactionLegacyItemEntry,
    FactionLegacyItemLoanTarget,
    FactionLegacyItemLoanUser,
    FactionLegacyItemSelection,
    FactionLookupBundle,
    FactionMedicalBundle,
    FactionMemberStatus,
    FactionMemberSummary,
    FactionMembersBundle,
    FactionNewsBundle,
    FactionNewsEntry,
    FactionOngoingChainSummary,
    FactionPactSummary,
    FactionPositionSummary,
    FactionPositionsBundle,
    FactionRacketRewardSummary,
    FactionRacketSummary,
    FactionRacketsBundle,
    FactionRaidReportAttackerSummary,
    FactionRaidReportBundle,
    FactionRaidReportSideSummary,
    FactionRaidReportSummary,
    FactionRaidReportUserSummary,
    FactionRaidSummary,
    FactionRaidWarSummary,
    FactionRaidsBundle,
    FactionRank,
    FactionRankedWarDetails,
    FactionRankedWarReportBundle,
    FactionRankedWarReportFactionSummary,
    FactionRankedWarReportMemberSummary,
    FactionRankedWarReportRankSummary,
    FactionRankedWarReportRewardItemSummary,
    FactionRankedWarReportRewardsSummary,
    FactionRankedWarReportSummary,
    FactionRankedWarSummary,
    FactionRankedWarsBundle,
    FactionReportsBundle,
    FactionRevivesBundle,
    FactionRevivesFullBundle,
    FactionSearchBundle,
    FactionSearchLeader,
    FactionSearchSummary,
    FactionStatSummary,
    FactionStatsBundle,
    FactionTemporaryBundle,
    FactionTerritoryBundle,
    FactionTerritoryCoordinatesSummary,
    FactionTerritoryOwnershipBundle,
    FactionTerritoryOwnershipSummary,
    FactionTerritorySummary,
    FactionTerritoryWarHistoryEntry,
    FactionTerritoryWarParticipantSummary,
    FactionTerritoryWarReportBundle,
    FactionTerritoryWarReportFactionSummary,
    FactionTerritoryWarReportMemberSummary,
    FactionTerritoryWarReportSummary,
    FactionTerritoryWarfareSummary,
    FactionTerritoryWarsBundle,
    FactionTimestampBundle,
    FactionUnknownWarfareEntry,
    FactionUpgradeBranch,
    FactionUpgradeCore,
    FactionUpgradeDetails,
    FactionUpgradesBundle,
    FactionUpgradesSummary,
    FactionUtilitiesBundle,
    FactionWarFactionSummary,
    FactionWarfareBundle,
    FactionWarfareEntry,
    FactionWarfareFactionSummary,
    FactionWarfareUserSummary,
    FactionWarfareWallPlayerSummary,
    FactionWarsBundle,
    FactionWarsSummary,
    FactionWeaponsBundle,
    ForumCategoriesBundle,
    ForumCategory,
    ForumLookupBundle,
    ForumPoll,
    ForumPollAnswer,
    ForumPost,
    ForumPostsBundle,
    ForumThread,
    ForumThreadBundle,
    ForumThreadsBundle,
    ForumTimestampBundle,
    ForumUserSummary,
    KeyAccess,
    KeyInfo,
    KeyInfoBundle,
    KeyLogAccess,
    KeyLogBundle,
    KeyLogCategoryAccess,
    KeyLogEntry,
    KeyLogTargetId,
    KeySelections,
    MarketAuctionHouseBundle,
    MarketAuctionHouseListing,
    MarketAuctionHouseListingBundle,
    MarketAuctionItem,
    MarketBazaar,
    MarketBazaarBundle,
    MarketBazaarSellerSummary,
    MarketItemBonus,
    MarketItemDetails,
    MarketItemMarket,
    MarketItemMarketBundle,
    MarketItemStats,
    MarketItemSummary,
    MarketListingSummary,
    MarketLookupBundle,
    MarketMetadata,
    MarketPaginationLinks,
    MarketPointsMarketBundle,
    MarketPointsMarketListing,
    MarketPropertiesBundle,
    MarketPropertyCatalog,
    MarketPropertyListing,
    MarketPropertyTypeSummary,
    MarketRentalCatalog,
    MarketRentalListing,
    MarketRentalsBundle,
    MarketTimestampBundle,
    MarketUserSummary,
    PaginatedLinks,
    PaginatedMetadata,
    PaginatedMetadataWithTotal,
    PropertyActor,
    PropertyBundle,
    PropertyDetails,
    PropertyLookupBundle,
    PropertyStaffSummary,
    PropertyTimestampBundle,
    PropertyTypeSummary,
    PropertyUpkeep,
    RacingCar,
    RacingCarUpgrade,
    RacingCarUpgradeCost,
    RacingCarUpgradeEffects,
    RacingCarUpgradesBundle,
    RacingCarsBundle,
    RacingLookupBundle,
    RacingParticipants,
    RacingRace,
    RacingRaceBundle,
    RacingRacesBundle,
    RacingRecord,
    RacingRecordsBundle,
    RacingRequirements,
    RacingResult,
    RacingSchedule,
    RacingTimestampBundle,
    RacingTrack,
    RacingTracksBundle,
    TornAmmoItem,
    TornAttackItem,
    TornAttackLog,
    TornAttackLogBundle,
    TornAttackLogEntry,
    TornAttackLogSummary,
    TornAttackParticipant,
    TornAwardType,
    TornBankBundle,
    TornBankRates,
    TornBountiesBundle,
    TornBounty,
    TornCalendar,
    TornCalendarBundle,
    TornCalendarEntry,
    TornCard,
    TornCardShort,
    TornCardsBundle,
    TornCityShop,
    TornCityShopItem,
    TornCityShopsBundle,
    TornCompaniesBundle,
    TornCompany,
    TornCompanyPosition,
    TornCompetitionBundle,
    TornCompetitionEntry,
    TornCountEntry,
    TornCrime,
    TornCrimesBundle,
    TornDynamicObject,
    TornEducationBundle,
    TornEducationCourse,
    TornEliminationBundle,
    TornEliminationTeamBundle,
    TornEliminationTeamEntry,
    TornFactionHofBundle,
    TornFactionTreeBundle,
    TornGym,
    TornGymsBundle,
    TornHofBundle,
    TornHonorSummary,
    TornHonorsBundle,
    TornItemAmmoBundle,
    TornItemBaseStats,
    TornItemDetails,
    TornItemDetailsBundle,
    TornItemDetailsSelection,
    TornItemMod,
    TornItemModsBundle,
    TornItemStats,
    TornItemStatsBundle,
    TornItemSummary,
    TornItemsBundle,
    TornLogCategoriesBundle,
    TornLogCategory,
    TornLogType,
    TornLogTypesBundle,
    TornLookupBundle,
    TornMedalSummary,
    TornMedalsBundle,
    TornMerit,
    TornMeritsBundle,
    TornOrganisedCrime,
    TornOrganisedCrimesBundle,
    TornOrganizedCrime,
    TornOrganizedCrimePositionInfo,
    TornOrganizedCrimeSlot,
    TornOrganizedCrimesBundle,
    TornPawnshop,
    TornPawnshopBundle,
    TornPercentageEntry,
    TornPokerTable,
    TornPokerTablesBundle,
    TornPropertiesBundle,
    TornPropertyCatalogEntry,
    TornRockPaperScissorsBundle,
    TornSearchForCashBundle,
    TornShopliftingBundle,
    TornShopliftingEntry,
    TornStatsBundle,
    TornStockBonus,
    TornStockBundle,
    TornStockChart,
    TornStockDetailed,
    TornStockHistoryEntry,
    TornStockImages,
    TornStockMarket,
    TornStockPerformance,
    TornStockPerformanceWindow,
    TornStockSummary,
    TornStocksBundle,
    TornSubcrimesBundle,
    TornTerritoryBundle,
    TornTimestampBundle,
    TradeCompanyDetails,
    TradeCompanyItem,
    TradeFactionDetails,
    TradeFactionItem,
    TradeInventoryItem,
    TradeInventoryItemDetails,
    TradeItem,
    TradeMoneyDetails,
    TradeMoneyItem,
    TradeNapDetails,
    TradeNapFaction,
    TradeNapItem,
    TradePropertyDetails,
    TradePropertyItem,
    UnknownTradeItem,
    UnknownUserCompetition,
    UnknownUserEmployment,
    UserAmmoBundle,
    UserAmmoItem,
    UserAmmoVariant,
    UserAttack,
    UserAttackCombatant,
    UserAttackFaction,
    UserAttackFinishingHitEffect,
    UserAttackFull,
    UserAttackModifiers,
    UserAttacksBundle,
    UserAttacksFullBundle,
    UserAwardUnlock,
    UserBars,
    UserBarsBundle,
    UserBasicBundle,
    UserBasicProfile,
    UserBattleStat,
    UserBattleStatModifier,
    UserBattleStats,
    UserBattleStatsBundle,
    UserBazaarBundle,
    UserBountiesBundle,
    UserBounty,
    UserCalendar,
    UserCalendarBundle,
    UserCasino,
    UserCasinoBundle,
    UserChainBar,
    UserCityBank,
    UserCityJob,
    UserClothingItem,
    UserCompanyJob,
    UserCompanyPointCompany,
    UserCompanyPoints,
    UserCompetition,
    UserCompetitionBasket,
    UserCompetitionBundle,
    UserCompetitionHp,
    UserCooldowns,
    UserCooldownsBundle,
    UserCrimeAttemptSubcrime,
    UserCrimeAttempts,
    UserCrimeMiscellaneous,
    UserCrimeRewardAmmo,
    UserCrimeRewardItem,
    UserCrimeRewards,
    UserCrimeSummary,
    UserCrimeUnique,
    UserCrimeUniqueRewards,
    UserCrimesBundle,
    UserCriminalRecord,
    UserCriminalRecordBundle,
    UserCurrentEducation,
    UserDiscord,
    UserDiscordBundle,
    UserDisplayBundle,
    UserEasterCompetition,
    UserEducation,
    UserEducationBundle,
    UserEliminationCompetition,
    UserEmployment,
    UserEnlistedCar,
    UserEnlistedCarsBundle,
    UserEquipmentAmmo,
    UserEquipmentBundle,
    UserEquipmentItem,
    UserEquipmentMod,
    UserEvent,
    UserEventsBundle,
    UserFaction,
    UserFactionBalance,
    UserFactionBalanceBundle,
    UserFactionBundle,
    UserFactionMoney,
    UserForumFeedBundle,
    UserForumFeedEntry,
    UserForumFriendsBundle,
    UserForumPostsBundle,
    UserForumSubscribedThread,
    UserForumSubscribedThreadPosts,
    UserForumSubscribedThreadsBundle,
    UserForumThreadsBundle,
    UserGymBundle,
    UserHalloweenCompetition,
    UserHofBundle,
    UserHofStats,
    UserHofValue,
    UserHofValueFloat,
    UserHonorsBundle,
    UserIcon,
    UserIconsBundle,
    UserIdentitySummary,
    UserInventory,
    UserInventoryBundle,
    UserInventoryItem,
    UserItemMarketBundle,
    UserItemMarketItemBonus,
    UserItemMarketItemDetails,
    UserItemMarketItemStats,
    UserItemMarketListing,
    UserItemModsBundle,
    UserJobBundle,
    UserJobPointTotals,
    UserJobPoints,
    UserJobPointsBundle,
    UserJobRanks,
    UserJobRanksBundle,
    UserLastAction,
    UserLegacyItemSummary,
    UserLifeBar,
    UserListBundle,
    UserListEntry,
    UserLogBundle,
    UserLogDetails,
    UserLogEntry,
    UserLookupBundle,
    UserMedalsBundle,
    UserMeritUpgrade,
    UserMerits,
    UserMeritsBundle,
    UserMessage,
    UserMessagesBundle,
    UserMissionContract,
    UserMissionContractRewards,
    UserMissionGiver,
    UserMissionReward,
    UserMissionRewardDetails,
    UserMissions,
    UserMissionsBundle,
    UserMoney,
    UserMoneyBundle,
    UserNetworth,
    UserNetworthBundle,
    UserNewEventsBundle,
    UserNewMessagesBundle,
    UserNotifications,
    UserNotificationsBundle,
    UserOrganizedCrime,
    UserOrganizedCrimeBundle,
    UserOrganizedCrimeError,
    UserOrganizedCrimeItemRequirement,
    UserOrganizedCrimePositionInfo,
    UserOrganizedCrimeRewardItem,
    UserOrganizedCrimeRewards,
    UserOrganizedCrimeSelection,
    UserOrganizedCrimeSlot,
    UserOrganizedCrimeUser,
    UserPerksBundle,
    UserPersonalStatPoint,
    UserPersonalStatsBucket,
    UserPersonalStatsBundle,
    UserPersonalStatsCategory,
    UserPersonalStatsSelection,
    UserProfile,
    UserProfileBundle,
    UserPropertiesBundle,
    UserPropertyBundle,
    UserPropertyKind,
    UserPropertyLeaseExtension,
    UserPropertyStaffEntry,
    UserPropertySummary,
    UserPropertyUpkeep,
    UserRace,
    UserRaceParticipants,
    UserRaceRequirements,
    UserRaceResult,
    UserRaceSchedule,
    UserRaceTrackSummary,
    UserRacesBundle,
    UserRacingLapRecord,
    UserRacingRecordSummary,
    UserRacingRecordsBundle,
    UserRefills,
    UserRefillsBundle,
    UserReportDetails,
    UserReportSummary,
    UserReportsBundle,
    UserResourceBar,
    UserRevive,
    UserReviveFull,
    UserReviveLastAction,
    UserReviveReviver,
    UserReviveTarget,
    UserRevivesBundle,
    UserRevivesFullBundle,
    UserRpsCompetition,
    UserSkill,
    UserSkillsBundle,
    UserStatus,
    UserStockBonus,
    UserStockHolding,
    UserStockTransaction,
    UserStocksBundle,
    UserTimestampBundle,
    UserTrade,
    UserTradeBundle,
    UserTradeDetailed,
    UserTradeParticipant,
    UserTradeTimestamp,
    UserTradesBundle,
    UserTravel,
    UserTravelBundle,
    UserWeaponExpBundle,
    UserWeaponExpEntry,
    UserWorkStats,
    UserWorkStatsBundle,
};

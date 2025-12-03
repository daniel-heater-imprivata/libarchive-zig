const std = @import("std");
const c = @cImport({
    @cInclude("archive.h");
});

pub fn main() !void {
    const version = c.archive_version_number();
    const version_string = c.archive_version_string();
    
    if (version_string) |v| {
        std.debug.print("libarchive version: {s}\n", .{v});
    } else {
        std.debug.print("Failed to get libarchive version\n", .{});
        return error.VersionCheckFailed;
    }
    
    std.debug.print("libarchive version number: {d}\n", .{version});
    std.debug.print("libarchive test successful!\n", .{});
}


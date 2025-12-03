const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "test-libarchive",
        .root_module = b.createModule(.{
            .root_source_file = b.path("main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    const libarchive_dep = b.dependency("libarchive", .{
        .target = target,
        .optimize = optimize,
    });
    exe.linkLibrary(libarchive_dep.artifact("archive"));

    b.installArtifact(exe);
}


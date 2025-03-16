const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const wasmparser = b.addModule("wasmparser", .{
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("src/lib.zig"),
    });

    const test_module = b.addModule("wasmparser_tests", .{
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("tests/test.zig"),
    });
    test_module.addImport("wasmparser", wasmparser);

    const main_tests = b.addTest(.{
        .root_module = test_module,
    });
    const main_test_runner = b.addRunArtifact(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_test_runner.step);
}

export fn _start() void {
    var x: @Vector(4, f32) = @splat(0.0);
    x[0] = 1.0;
    x[1] = 2.0;
    x[2] = 3.0;
    x[3] = 4.0;
    const y: @Vector(4, f32) = @splat(2.0);
    const z = x + y;
    std.mem.doNotOptimizeAway(&z);
    std.debug.print("Hello, world!\n", .{});
}

const std = @import("std");

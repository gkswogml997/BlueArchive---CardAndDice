///bezier_curve_x(t, x1, x2, x3, x4)
var t = argument0
var x1 = argument1
var x2 = argument2
var x3 = argument3
var x4 = argument4

var u = 1 - t;
var tt = t * t;
var uu = u * u;
var uuu = uu * u;
var ttt = tt * t;

var result = uuu * x1; // P0
result += 3 * uu * t * x2; // P1
result += 3 * u * tt * x3; // P2
result += ttt * x4; // P3

return result;

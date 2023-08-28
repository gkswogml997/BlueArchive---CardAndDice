///bezier_curve_y(t, y1, y2, y3, y4)
var t = argument0
var y1 = argument1
var y2 = argument2
var y3 = argument3
var y4 = argument4

var u = 1 - t;
var tt = t * t;
var uu = u * u;
var uuu = uu * u;
var ttt = tt * t;

var result = uuu * y1; // P0
result += 3 * uu * t * y2; // P1
result += 3 * u * tt * y3; // P2
result += ttt * y4; // P3

return result;

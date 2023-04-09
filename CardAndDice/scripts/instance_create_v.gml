/// instance_create_v(x, y, object, ...args)
var n = argument_count - 3; 
ct_argument = undefined;
ct_count = n;
for (var i = 0; i < n; i++) ct_argument[i] = argument[3 + i];
var r = instance_create(argument[0], argument[1], argument[2]);
ct_argument = undefined;
ct_count = undefined;
return r;

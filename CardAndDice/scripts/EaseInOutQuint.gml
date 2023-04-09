/// EaseInOutQuint(time, start, change, duration)

var _arg0 = 2*argument0/argument3;

if (_arg0 < 1){
    return argument2 * 0.5 * power(_arg0, 5) + argument1;
}

return argument2 * 0.5 * (power(_arg0 - 2, 5) + 2) + argument1;

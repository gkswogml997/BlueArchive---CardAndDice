//#define Default_Ease_Algorithms
/*
* TERMS OF USE - EASING EQUATIONS
* Open source under the BSD License.
* Copyright (c)2001 Robert Penner
* All rights reserved.
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
    It is advised to add custom easing algorithms independent of Default_Ease_Algorithms
*/

//#define EaseLinear
/// EaseLinear(time,start,change,duration)

return argument2 * argument0 / argument3 + argument1;

//#define EaseInQuad
/// EaseInQuad(time,start,change,duration)

var _arg0 = argument0/argument3;
return argument2 * _arg0 * _arg0 + argument1;

//#define EaseOutQuad
/// EaseOutQuad(time,start,change,duration)

var _arg0 = argument0/argument3;
return -argument2 * _arg0 * (_arg0 - 2) + argument1;

//#define EaseInOutQuad
/// EaseInOutQuad(time,start,change,duration)

var _arg0 = 2*argument0/argument3;

if (_arg0 < 1){
    return argument2 * 0.5 * _arg0 * _arg0 + argument1;
}

return argument2 * -0.5 * (--_arg0 * (_arg0 - 2) - 1) + argument1;


//#define EaseInCubic
/// EaseInCubic(time,start,change,duration)

return argument2 * power(argument0/argument3, 3) + argument1;

//#define EaseOutCubic
/// EaseOutCubic(time,start,change,duration)

return argument2 * (power(argument0/argument3 - 1, 3) + 1) + argument1;

//#define EaseInOutCubic
/// EaseInOutCubic(time,start,change,duration)

_arg0 = 2*argument0/argument3;

if (_arg0 < 1){
   return argument2 * 0.5 * power(_arg0, 3) + argument1;
}

return argument2 * 0.5 * (power(_arg0 - 2, 3) + 2) + argument1;

//#define EaseInQuart
/// EaseInQuart(time,start,change,duration)

return argument2 * power(argument0 / argument3, 4) + argument1;

//define EaseOutQuart
/// EaseOutQuart(time,start,change,duration)

return -argument2 * (power(argument0 / argument3 - 1, 4) - 1) + argument1;

//#define EaseInOutQuart
/// EaseInOutQuart(time,start,change,duration)

var _arg0 = 2*argument0/argument3;

if (_arg0 < 1) {
    return argument2 * 0.5 * power(_arg0, 4) + argument1;
}

return argument2 * -0.5 * (power(_arg0 - 2, 4) - 2) + argument1;

//#define EaseInQuint
/// EaseInQuint(time,start,change,duration)

return argument2 * power(argument0 / argument3, 5) + argument1;

//#define EaseOutQuint
/// EaseOutQuint(time, start, change, duration)

return argument2 * (power(argument0/argument3 - 1, 5) + 1) + argument1;

//#define EaseInOutQuint
/// EaseInOutQuint(time, start, change, duration)

var _arg0 = 2*argument0/argument3;

if (_arg0 < 1){
    return argument2 * 0.5 * power(_arg0, 5) + argument1;
}

return argument2 * 0.5 * (power(_arg0 - 2, 5) + 2) + argument1;


//#define EaseInSine
/// EaseInSine(time,start,change,duration)

return argument2 * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;

//#define EaseOutSine
/// EaseOutSine(time,start,change,duration)

return argument2 * sin(argument0/argument3 * (pi/2)) + argument1;

//#define EaseInOutSine
 /// EaseInOutSine(time, start, change, duration)

return argument2 * 0.5 * (1 - cos(pi*argument0/argument3)) + argument1;

//#define EaseInCirc
/// EaseInCirc(time,start,change,duration)

var _arg0 = argument0/argument3;
return argument2 * (1 - sqrt(1 - _arg0 * _arg0)) + argument1;

//#define EaseOutCirc
/// EaseOutCirc(time,start,change,duration)

var _arg0 = argument0/argument3 - 1;
return argument2 * sqrt(1 - _arg0 * _arg0) + argument1;


//#define EaseInOutCirc
/// EaseInOutCirc(time,start,change,duration)

var _arg0 = 2*argument0/argument3;

if (_arg0 < 1){
    return argument2 * 0.5 * (1 - sqrt(1 - _arg0 * _arg0)) + argument1;
}

_arg0 -= 2;
return argument2 * 0.5 * (sqrt(1 - _arg0 * _arg0) + 1) + argument1;


//#define EaseInExpo
/// EaseInExpo(time,start,change,duration)

return argument2 * power(2, 10 * (argument0/argument3 - 1)) + argument1;

//#define EaseOutExpo
/// EaseOutExpo(time,start,change,duration)

return argument2 * (-power(2, -10 * argument0 / argument3) + 1) + argument1;

//#define EaseInOutExpo
/// EaseInOutExpo(time,start,change,duration)

var _arg0 = 2*argument0/argument3;

if (_arg0 < 1) {
    return argument2 * 0.5 * power(2, 10 * --_arg0) + argument1;
}

return argument2 * 0.5 * (-power(2, -10 * --_arg0) + 2) + argument1;


//#define EaseInElastic
/// EaseInElastic(time,start,change,duration)

var _s = 1.70158;
var _p = 0;
var _a = argument2;

var _arg0 = argument0;

if (_arg0 == 0 || _a == 0) {
    return argument1; 
}

_arg0 /= argument3;

if (_arg0 == 1) {
    return argument1+argument2; 
}

if (_p == 0) {
    _p = argument3*0.3;
}

if (_a < abs(argument2)) 
{ 
    _a = argument2; 
    _s = _p*0.25; 
}
else{
    _s = _p / (2 * pi) * arcsin (argument2 / _a);
}

return -(_a * power(2,10 * (--_arg0)) * sin((_arg0 * argument3 - _s) * (2 * pi) / _p)) + argument1;


//#define EaseOutElastic
/// EaseOutElastic(time,start,change,duration)

var _s = 1.70158;
var _p = 0;
var _a = argument2;

var _arg0 = argument0;

if (_arg0 == 0 || _a == 0){
    return argument1;
}

_arg0 /= argument3;

if (_arg0 == 1){
    return argument1 + argument2;
}

if (_p == 0){
    _p = argument3 * 0.3;
}

if (_a < abs(argument2)) 
{ 
    _a = argument2;
    _s = _p * 0.25; 
}
else {
    _s = _p / (2 * pi) * arcsin (argument2 / _a);
}

return _a * power(2, -10 * _arg0) * sin((_arg0 * argument3 - _s) * (2 * pi) / _p ) + argument2 + argument1;

//#define EaseInOutElastic
/// EaseInOutElastic(time,start,change,duration)

var _s = 1.70158;
var _p = 0;
var _a = argument2;

var _arg0 = argument0;

if (_arg0 == 0 || _a == 0){
    return argument1;
}

_arg0 /= argument3*0.5;

if (_arg0 == 2){
    return argument1+argument2; 
}

if (_p == 0){
    _p = argument3 * (0.3 * 1.5);
}

if (_a < abs(argument2)) 
{ 
    _a = argument2; 
    _s = _p * 0.25; 
}
else{
    _s = _p / (2 * pi) * arcsin (argument2 / _a);
}

if (_arg0 < 1){
    return -0.5 * (_a * power(2, 10 * (--_arg0)) * sin((_arg0 * argument3 - _s) * (2 * pi) / _p)) + argument1;
}

return _a * power(2, -10 * (--_arg0)) * sin((_arg0 * argument3 - _s) * (2 * pi) / _p) * 0.5 + argument2 + argument1;


//#define EaseInBack
/// EaseInBack(time,start,change,duration)

var _s = 1.70158;
_arg0 = argument0/argument3;
return argument2 * _arg0 * _arg0 * ((_s + 1) * _arg0 - _s) + argument1;


//#define EaseOutBack
/// EaseOutBack(time,start,change,duration)

var _s = 1.70158;
var _arg0 = argument0/argument3 - 1;
return argument2 * (_arg0 * _arg0 * ((_s + 1) * _arg0 + _s) + 1) + argument1;


//#define EaseInOutBack
/// EaseInOutBack(time,start,change,duration)

var _s = 1.70158;
var _arg0 = argument0/argument3*2

if (_arg0 < 1)
{
    _s *= 1.525;
    return argument2 * 0.5 * (_arg0 * _arg0 * ((_s + 1) * _arg0 - _s)) + argument1;
}

_arg0 -= 2;
_s *= 1.525

return argument2 * 0.5 * (_arg0 * _arg0 * ((_s + 1) * _arg0 + _s) + 2) + argument1;

//#define EaseInBounce
/// EaseInBounce(time,start,change,duration)

//return argument2 - EaseOutBounce(argument3 - argument0, 0, argument2, argument3) + argument1

//#define EaseOutBounce
/// EaseOutBounce(time,start,change,duration)

var _arg0 = argument0/argument3;

if (_arg0 < 1/2.75)
{
    return argument2 * 7.5625 * _arg0 * _arg0 + argument1;
}
else
if (_arg0 < 2/2.75)
{
    _arg0 -= 1.5/2.75;
    return argument2 * (7.5625 * _arg0 * _arg0 + 0.75) + argument1;
}
else
if (_arg0 < 2.5/2.75)
{
    _arg0 -= 2.25/2.75;
    return argument2 * (7.5625 * _arg0 * _arg0 + 0.9375) + argument1;
}
else
{
    _arg0 -= 2.625/2.75;
    return argument2 * (7.5625 * _arg0 * _arg0 + 0.984375) + argument1;
}



//#define EaseInOutBounce
/// EaseInOutBounce(time,start,change,duration)

if (2*argument0 < argument3) {
//    return (EaseInBounce(argument0*2, 0, argument2, argument3)*0.5 + argument1);
}

//return (EaseOutBounce(argument0*2 - argument3, 0, argument2, argument3)*0.5 + argument2*0.5 + argument1);

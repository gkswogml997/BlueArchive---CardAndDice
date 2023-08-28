///effect_instance_create(x,y,sprite,buff_type)
var xx = argument0;
var yy = argument1;
var spr = argument2;
var type = argument3;

xx += sprite_get_width(spr)/2
yy -= sprite_get_height(spr)/2

instance_create_v(xx,yy,obj_buff_effect,spr,type)

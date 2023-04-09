var target_map = argument0
var key = argument1

var spr = sprite_add(working_directory+"\story\Character\"+key+".png",0,false,false,0,0)
sprite_set_offset(spr,sprite_get_width(spr)/2,sprite_get_height(spr)/2)
ds_map_add(target_map,key,spr)

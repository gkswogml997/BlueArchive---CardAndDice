var target_map = argument0
var key = argument1

var sound = audio_create_stream(working_directory+"story\bgm\"+key+".ogg")
ds_map_add(target_map,key,sound)

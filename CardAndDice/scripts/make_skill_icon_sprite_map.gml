var skill_list = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"playable")

skill_icon_sprite_map = ds_map_create()

for(var i = 0; i < ds_list_size(skill_list); i++)
{
    var file_directory = working_directory+"\skill_icon\skill_"+string(skill_list[|i])+".png"
    ds_map_add(skill_icon_sprite_map,"skill_"+string(skill_list[|i]),sprite_add(file_directory,0,false,false,0,0))
}

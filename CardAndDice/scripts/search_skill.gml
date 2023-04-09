var skill_number = argument0
var target = obj_GAME_SYSTEM_MANAGER.skill_info_map
var skill_list;

if ds_map_exists(target,string(skill_number)) {skill_list = ds_map_find_value(target,string(skill_number))}
else {skill_list = undefined}

return skill_list

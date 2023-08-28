var extra_description = argument0
var target = obj_GAME_SYSTEM_MANAGER.skill_extra_description_sheet_map
var extra_description_list;

if ds_map_exists(target,extra_description) {extra_description_list = ds_map_find_value(target,extra_description)}
else {extra_description_list = undefined}

return extra_description_list

var equipment_number = argument0
var target = obj_GAME_SYSTEM_MANAGER.equipment_info_map
var equipment_list;

if ds_map_exists(target,string(equipment_number)) {equipment_list = ds_map_find_value(target,string(equipment_number))}
else {equipment_list = undefined}

return equipment_list

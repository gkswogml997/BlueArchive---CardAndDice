///search_skill_location_target(target_location,is_enemy)

var target_location = argument0
var is_enemy = argument1

var target_list = obj_GAME_SYSTEM_MANAGER.enemy_list
if !is_enemy {target_list = obj_GAME_SYSTEM_MANAGER.player_list}

var target = ds_list_find_value(target_list,target_location)
if !is_undefined(target) {return target}
else {return undefined}

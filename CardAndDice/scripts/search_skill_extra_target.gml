///search_skill_extra_target(original_target,relative_position)

var original_target = argument0
var relative_position = argument1
var is_enemy = original_target.is_enemy
var target_list = obj_GAME_SYSTEM_MANAGER.enemy_list

if !is_enemy {target_list = obj_GAME_SYSTEM_MANAGER.player_list}

var original_target_location = ds_list_find_index(target_list,original_target)
var extra_target_location = original_target_location + relative_position
var extra_target = ds_list_find_value(target_list,extra_target_location)
if !is_undefined(extra_target) {return extra_target}
else {return undefined}

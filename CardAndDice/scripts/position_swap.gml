///position_swap(owner_id,target_id,is_enemy)

var owner_id = argument0
var target_id = argument1
var is_enemy = argument2

if is_undefined(target_id) {return undefined}
else if target_id.is_dead {send_log("대상이 쓰러져 있어 자리를 바꿀수 없습니다.",true); return undefined}

if owner_id.is_enemy != target_id.is_enemy
{
    send_log("변절은 불가능 합니다.",true)
    return undefined
}
var target_list = obj_GAME_SYSTEM_MANAGER.player_list
if is_enemy {target_list = obj_GAME_SYSTEM_MANAGER.enemy_list}


var temp = 0;
var temp_ins = undefined;

temp_ins = target_list[|owner_id.card_position]
target_list[|owner_id.card_position] = target_list[|target_id.card_position]
target_list[|target_id.card_position] = temp_ins

temp = owner_id.card_position
owner_id.card_position = target_id.card_position
target_id.card_position = temp

instance_create(owner_id.x,owner_id.y,obj_izuna_doll)
instance_create(target_id.x,target_id.y,obj_izuna_doll)

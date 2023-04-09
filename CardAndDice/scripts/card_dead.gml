///card_destroy(id)
var ins = argument[0]

//처치시 보너스 턴을 받을 카드가 있는가?
if !is_undefined(ins.kill_reward_recipient)
{
    give_extra_turn(ins.kill_reward_recipient,1)
}

//게임시스템매니져에 있는 자기 정보 삭제
var target_list = "enemy"
var target_pos = 0;
if ds_list_find_index(obj_GAME_SYSTEM_MANAGER.enemy_list,ins) = -1
{
    target_pos = ds_list_find_index(obj_GAME_SYSTEM_MANAGER.player_list,ins)
    target_list = "player"
}else
{
    target_pos = ds_list_find_index(obj_GAME_SYSTEM_MANAGER.enemy_list,ins)
    target_list = "enemy"
}

var dead_card = instance_create(x,y,obj_dead_card)
if target_list = "enemy" 
{
    ds_list_replace(obj_GAME_SYSTEM_MANAGER.enemy_list,target_pos,dead_card)
    global.amount_of_kill_card += 1
}
else 
{
    ds_list_replace(obj_GAME_SYSTEM_MANAGER.player_list,target_pos,dead_card)
    global.amount_of_dead_card += 1
}

//턴매니져에 있는 자기 정보 삭제
if instance_exists(obj_battle_turn_manager)
{
    if ds_list_find_index(obj_battle_turn_manager.spr_list,ins) != -1
    {
        ds_list_delete(obj_battle_turn_manager.spr_list,ds_list_find_index(obj_battle_turn_manager.spr_list,ins))
    }
}


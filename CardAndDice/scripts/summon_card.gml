///summon_card(character_number,is_enemy)

var target_number = argument0
var is_enemy = argument1

if is_enemy
{
    var pos = search_empty_slot(obj_GAME_SYSTEM_MANAGER.enemy_list,5)
    if !is_undefined(pos)
    {
        var ins =  instance_create_v(0,0,obj_character_card,target_number,is_enemy,1000)
        ds_list_replace(obj_GAME_SYSTEM_MANAGER.enemy_list,pos,ins)
        ins.card_position = pos
        send_log(ins.hangul_name+"를 소환했습니다.")
        give_extra_turn(ins,1)
    }
    else
    {
        send_log("덱에 빈 자리가 없어 소환에 실패했습니다.")
    }
}else
{
    var pos = search_empty_slot(obj_GAME_SYSTEM_MANAGER.player_list,5)
    if !is_undefined(pos)
    {
        var ins =  instance_create_v(0,0,obj_character_card,target_number,is_enemy,1000)
        ds_list_replace(obj_GAME_SYSTEM_MANAGER.player_list,pos,ins)
        ins.card_position = pos
        send_log(ins.hangul_name+"를 소환했습니다.")
        give_extra_turn(ins,1)
    }
    else
    {
        send_log("덱에 빈 자리가 없어 소환에 실패했습니다.")
    }
}


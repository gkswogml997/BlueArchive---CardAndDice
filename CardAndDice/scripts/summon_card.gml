///summon_card(character_number,is_enemy)

var target_number = argument0
var is_enemy = argument1

var target_list = obj_GAME_SYSTEM_MANAGER.player_list
if is_enemy {target_list = obj_GAME_SYSTEM_MANAGER.enemy_list}

var pos = search_empty_slot(target_list,5)
if !is_undefined(pos)
{
    var ins =  instance_create_v(-300,-300,obj_character_card,target_number,is_enemy,1000)
    ds_list_replace(target_list,pos,ins)
    ins.card_position = pos
    send_log(ins.hangul_name+"를 소환했습니다.",true)
    give_extra_turn(ins,1)
    audio_play_sound(sd_summon,1001,false)
    instance_create_v(x,y,obj_summoning_animation,ins)
}
else
{
    send_log("덱에 빈 자리가 없어 소환에 실패했습니다.",true)
}


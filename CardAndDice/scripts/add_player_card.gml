var pos = search_empty_slot(obj_GAME_SYSTEM_MANAGER.player_list,5)
if !is_undefined(pos)
{
    //가챠테이블에서 불러오기
    var gacha_list = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"playable")
    var rand_num = gacha_list[| irandom(ds_list_size(gacha_list)-1)]
    
    if argument_count >= 1 {rand_num = argument[0]}
    
    //리스트 삽입
    var ins = instance_create_v(0,0,obj_character_card,rand_num,false,pos)
    ds_list_replace(obj_GAME_SYSTEM_MANAGER.player_list,pos,ins)
}else
{
    show_message("exception: 플레이어 덱에 자리가 없습니다.")
}

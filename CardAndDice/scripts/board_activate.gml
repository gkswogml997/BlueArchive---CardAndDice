room_width = global.board_width
room_height = global.board_height

//아군 덱이 비어있으면 선생님 토큰 넣어주기
if slot_empty(obj_GAME_SYSTEM_MANAGER.player_list, ds_list_size(obj_GAME_SYSTEM_MANAGER.enemy_list)) 
{
    add_player_card(1)
}

//전투 관련물 치우기
if instance_exists(obj_log_button) {instance_destroy(obj_log_button)}
instance_deactivate_object(obj_character_card)
instance_activate_object(obj_BOARD_MANAGER)

//브금
audio_stop_all()
audio_play_sound(global.bgm_board,1000,true)

//페이즈변경
global.game_phase = phase.board

//보드활성화 
var t_list = obj_BOARD_MANAGER.board_parts_list
for(var i = 0; i < ds_list_size(t_list); i++)
{
    instance_activate_object(t_list[|i])
}

//다음 노드 만들기
obj_player_piece.vertex_make = true


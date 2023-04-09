room_width = global.board_width
room_height = global.board_height

if instance_exists(obj_log_button) {instance_destroy(obj_log_button)}
instance_deactivate_object(obj_character_card)
instance_activate_object(obj_BOARD_MANAGER)

audio_stop_all()
audio_play_sound(global.bgm_board,1000,true)

global.game_phase = phase.board

var t_list = obj_BOARD_MANAGER.board_parts_list

for(var i = 0; i < ds_list_size(t_list); i++)
{
    instance_activate_object(t_list[|i])
}

obj_player_piece.vertex_make = true


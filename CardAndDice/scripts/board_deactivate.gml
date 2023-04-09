room_width = global.minimun_resolution_width
room_height = global.minimun_resolution_height

audio_stop_sound(global.bgm_board)

var t_list = obj_BOARD_MANAGER.board_parts_list
        
for(var i = 0; i < ds_list_size(t_list); i++)
{
    instance_deactivate_object(t_list[|i])
}
instance_deactivate_object(obj_BOARD_MANAGER)

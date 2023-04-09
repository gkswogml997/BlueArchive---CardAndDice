///make_notice_box(str,owner_id,is_single)
var str = argument[0]
var owner_id = argument[1]
var is_single = false
var ID = undefined

if argument_count > 2 {is_single = argument[2]}

if global.game_phase = phase.board
{
    camera_initialize()
    camera_locking(true)
}

if is_single {ID = instance_create_v(obj_camera.x,obj_camera.y,obj_single_notice_box,str,owner_id)}
else {ID = instance_create_v(obj_camera.x,obj_camera.y,obj_notice_box,str,owner_id)}

return ID

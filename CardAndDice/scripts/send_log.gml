var log = argument[0]
var quick_log = false 
if argument_count >= 2 {quick_log = argument[1]}

ds_list_add(global.game_log_list,log)

if quick_log {instance_create_v(view_xview+view_wview-16,view_yview+view_hview/2,obj_quick_log,log)}

var log = argument[0]
var quick_log = false 
if argument_count >= 2 {quick_log = argument[1]}



if quick_log 
{
    ds_queue_enqueue(global.quick_log_buffer,log)
    ds_list_add(global.game_log_list,"Q:"+log)
}    
else{ds_list_add(global.game_log_list,log)}

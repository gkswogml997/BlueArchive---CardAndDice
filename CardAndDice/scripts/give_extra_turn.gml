///give_extra_turn(target_id,times)
var target = argument0
var times = argument1

if is_undefined(target) {return undefined}
else if target.is_dead {return undefined}

if instance_exists(obj_battle_turn_manager)
{
    repeat(times)
    {
        ds_queue_enqueue(obj_battle_turn_manager.turn_queue,target)
        ds_list_add(obj_battle_turn_manager.spr_list,target)
    }
    instance_create(target.x,target.y,obj_extra_turn_effect)
    send_log(target.hangul_name+"은(는) 엑스트라 턴을 "+string(times)+" 얻었다.",true)
}

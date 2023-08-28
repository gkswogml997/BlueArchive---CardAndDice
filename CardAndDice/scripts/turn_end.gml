if instance_exists(obj_battle_turn_manager)
{
    if global.turn_instance = obj_battle_turn_manager.spr_list[|0]
    {
        ds_list_delete(obj_battle_turn_manager.spr_list,0)
    }
}
global.turn_instance = undefined

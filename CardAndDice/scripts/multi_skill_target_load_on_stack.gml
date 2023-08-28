///multi_skill_target_load_on_stack()
if !is_undefined(nontarget_skill_target)
{
    for (var i = 0; i < ds_list_size(nontarget_skill_target); i++)
    {   
        if nontarget_skill_target[|i] = 1
        {
            var target_id = undefined
            var target_list = undefined
            var is_enemy_target = original_skill_card.is_enemy_target
            
            if !owner_id.is_enemy
            {
                if is_enemy_target {target_list = obj_GAME_SYSTEM_MANAGER.enemy_list}
                else {target_list = obj_GAME_SYSTEM_MANAGER.player_list}
            }else
            {
                if is_enemy_target {target_list = obj_GAME_SYSTEM_MANAGER.player_list}
                else {target_list = obj_GAME_SYSTEM_MANAGER.enemy_list}
            }
            
            if original_skill_card.is_base_on_me_skill {
                var middle = ds_list_find_index(target_list,owner_id)
                target_id = ds_list_find_value(target_list,middle-(2-i))
            }else {target_id = ds_list_find_value(target_list,i)}
            
            if !is_undefined(target_id)
            {
                if !target_id.is_dead
                {
                    ds_stack_push(multi_target_stack,target_id)
                }
            }
        }
    }   
}
if !is_undefined(extra_skill_target)
{
    var list = obj_GAME_SYSTEM_MANAGER.player_list;
    if global.skill_target.is_enemy {list = obj_GAME_SYSTEM_MANAGER.enemy_list}
    var middle = ds_list_find_index(list,global.skill_target)
    for (var i = 0; i < ds_list_size(extra_skill_target); i++)
    {
        if extra_skill_target[|i] = 1
        {ds_stack_push(multi_target_stack,search_skill_location_target(middle-(2-i),global.skill_target.is_enemy))}
    }
}

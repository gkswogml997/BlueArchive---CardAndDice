//리스트 병합
all_list = ds_list_create()
var p_list = obj_GAME_SYSTEM_MANAGER.player_list
var e_list = obj_GAME_SYSTEM_MANAGER.enemy_list

for(var i = 0; i < global.p_list_max; i++)
{
    if !is_undefined(p_list[|i]) and !p_list[|i].is_dead {ds_list_add(all_list,p_list[|i])}
}
for(var i = 0; i < global.e_list_max; i++)
{
    if !is_undefined(e_list[|i]) and !e_list[|i].is_dead {ds_list_add(all_list,e_list[|i])}
}

return all_list

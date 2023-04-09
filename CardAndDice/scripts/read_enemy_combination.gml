var combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P0")
if global.progress = 0 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P1")}
if global.progress = 1 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P2")}
if global.progress = 2 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P3")}
if global.progress > 2 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"boss_combination")}

var list_index = irandom(ds_list_size(combination_table)-1)
var table_list = combination_table[| list_index]
for(var i = 0; i <ds_list_size(table_list); i++)
{
    if table_list[|i] != -4 {add_enemy_card(table_list[| i],i)}
}

if global.progress > 2
{
    instance_create_v(x,y,obj_battle_background,list_index)
}
else {instance_create_v(x,y,obj_battle_background,undefined)}

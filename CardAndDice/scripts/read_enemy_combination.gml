var combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P0")
if global.progress = 0 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P1")}
if global.progress = 1 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P2")}
if global.progress = 2 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P3")}
if global.progress > 2 {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"boss_combination")}

if global.chaos_mode
{
    var rand = choose(1,2,3,4)
    switch rand
    {
        case 1: {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P1"); break;}
        case 2: {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P2"); break;}
        case 3: {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"enemy_combination_P3"); break;}
        case 4: {combination_table = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"boss_combination"); break;}
    }
}

var background = "Street1"
var list_index = irandom(ds_list_size(combination_table)-1)
var table_list = combination_table[| list_index]
for(var i = 0; i <ds_list_size(table_list); i++)
{
    if is_string(table_list[|i])
    {
        background = table_list[|i]
    }else
    {
        if table_list[|i] != -4 {add_enemy_card(table_list[| i],i)}
    }
}

instance_create_v(x,y,obj_battle_background,background)


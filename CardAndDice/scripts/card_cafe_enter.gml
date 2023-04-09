///card_cafe_enter(id)
var ins = argument0

var position = 0;

ins.cafe_wating_time = 0;
global.amount_of_cafe_card += 1;

if ds_list_size(obj_GAME_SYSTEM_MANAGER.cafe_card_list) < 5
{
    for(var i = 0; i < ds_list_size(obj_GAME_SYSTEM_MANAGER.cafe_card_list); i++)
    {
        obj_GAME_SYSTEM_MANAGER.cafe_card_list[|i].card_position = i
    }
    ins.card_position =ds_list_size(obj_GAME_SYSTEM_MANAGER.cafe_card_list)
    ds_list_add(obj_GAME_SYSTEM_MANAGER.cafe_card_list,ins)
}else
{
    var target = obj_GAME_SYSTEM_MANAGER.cafe_card_list[|0]
    for(var i = 0; i < ds_list_size(obj_GAME_SYSTEM_MANAGER.cafe_card_list); i++)
    {
        if obj_GAME_SYSTEM_MANAGER.cafe_card_list[|i].cafe_wating_time > target.cafe_wating_time
        {
            target = obj_GAME_SYSTEM_MANAGER.cafe_card_list[|i]
        }
    }
    ins.card_position = target.card_position;
    ds_list_replace(obj_GAME_SYSTEM_MANAGER.cafe_card_list,ds_list_find_index(obj_GAME_SYSTEM_MANAGER.cafe_card_list,target),ins)
}
for(var i = 0; i < ds_list_size(obj_GAME_SYSTEM_MANAGER.cafe_card_list); i++)
{
    obj_GAME_SYSTEM_MANAGER.cafe_card_list[|i].cafe_wating_time++
}

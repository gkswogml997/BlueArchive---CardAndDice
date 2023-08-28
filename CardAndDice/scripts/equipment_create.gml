///equipment_create(equipment_number,owner_id) if e-number is undefined, that is random 
var ID = undefined
if !is_undefined(argument0)
{
    ID = instance_create_v(x,y,obj_equipment_card,argument0,argument1)
}else
{
    var gacha_list = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"equipment_2T")
    if global.progress = 1 {gacha_list = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"equipment_3T")}
    if global.progress = 2 {gacha_list = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"equipment_4T")}
    if global.chaos_mode {gacha_list = ds_map_find_value(obj_GAME_SYSTEM_MANAGER.gacha_table,"equipment_4T")}
    var rand_num = gacha_list[| irandom(ds_list_size(gacha_list)-1)]
    ID = instance_create_v(x,y,obj_equipment_card,rand_num,argument1)
}

return ID

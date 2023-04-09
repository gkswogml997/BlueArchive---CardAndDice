var equipment_info_list = ds_list_create()

var equipment_number = argument0
var equipment_name = argument1
var equipment_icon = argument2
var equipment_description = argument3
var equipment_attack_power = argument4
var equipment_defence_power = argument5
var equipment_rapid_power = argument6
var equipment_taunt_power = argument7
var equipment_skill_level = argument8

ds_list_add(equipment_info_list,
            equipment_number,
            equipment_name,
            equipment_icon,
            equipment_description,
            equipment_attack_power,
            equipment_defence_power,
            equipment_rapid_power,
            equipment_taunt_power,
            equipment_skill_level)
            
return equipment_info_list

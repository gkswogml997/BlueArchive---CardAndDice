var skill_info_list = ds_list_create()

var skill_number = argument0
var skill_name = argument1
var skill_icon = argument2
var skill_description = argument3
var passive_skill = argument4
var is_targeting_skill = argument5

ds_list_add(skill_info_list,
            skill_number,
            skill_name,
            skill_icon,
            skill_description,
            passive_skill,
            is_targeting_skill)
            
return skill_info_list

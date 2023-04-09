var character_info_list = ds_list_create()

//캐릭터 정보
var character_number = argument0
var data_name = argument1
var hangul_name = argument2
var card_portrait = argument3
//캐릭터 능력
var attack_power = argument4
var defence_power = argument5
var rapid_power = argument6
var taunt_power = argument7
var skill_level = argument8
//캐릭터 스킬
var skill_slot_1 = argument9
var skill_slot_2 = argument10
var skill_slot_3 = argument11

//학교
var school_data = argument12

ds_list_add(character_info_list,character_number,
            data_name,
            hangul_name,
            card_portrait,
            
            attack_power,
            defence_power,
            rapid_power,
            taunt_power,
            skill_level,
            
            skill_slot_1,
            skill_slot_2,
            skill_slot_3,
            
            school_data)
            
return character_info_list

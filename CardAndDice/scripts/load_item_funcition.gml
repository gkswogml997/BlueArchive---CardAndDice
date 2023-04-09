///load_item_funcition(id)

var target = argument0;

//스텟 초기화
target.additional_attack_power = 0
target.additional_defence_power = 0
target.additional_rapid_power = 0
target.additional_taunt_power = 0
target.additional_skill_level = 0

//스텟 불러오기
for(var i = 0; i < 3; i++) 
{
    if !is_undefined(target.equipment_slot[i])
    {
        target.additional_attack_power += target.equipment_slot[i].equipment_attack_power
    }
}
for(var i = 0; i < 3; i++) 
{
    if !is_undefined(target.equipment_slot[i])
    {
        target.additional_defence_power += target.equipment_slot[i].equipment_defence_power
    }
}
for(var i = 0; i < 3; i++) 
{
    if !is_undefined(target.equipment_slot[i])
    {
        target.additional_rapid_power += target.equipment_slot[i].equipment_rapid_power
    }
}
for(var i = 0; i < 3; i++) 
{
    if !is_undefined(target.equipment_slot[i])
    {
        target.additional_taunt_power += target.equipment_slot[i].equipment_taunt_power
    }
}
for(var i = 0; i < 3; i++) 
{
    if !is_undefined(target.equipment_slot[i])
    {
        target.additional_skill_level = max(target.additional_skill_level,target.equipment_slot[i].equipment_skill_level)
    }
}

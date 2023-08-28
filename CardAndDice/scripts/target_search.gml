///target_search(target_stat,target_list)
var target_stat = argument0;
var target_list = argument1;
var size = ds_list_size(target_list)
var target = undefined;


if target_stat = "attack_power"
{
    var max_attack_instance = undefined
    var max_attack = 0
    for (var i = 0; i < size; i++)
    {
        if is_undefined(target_list[| i]) {continue;}
        if target_list[| i].is_dead {continue;}
        var target_attack = target_list[| i].attack_power + target_list[| i].additional_attack_power + target_list[| i].volatility_attack_power
        if max_attack < target_attack
        {
            max_attack = target_attack
            max_attack_instance = target_list[|i]
        }
    }
    target = max_attack_instance
}

if target_stat = "taunt_power"
{
    var max_taunt_instance = undefined
    var max_taunt = 0
    for (var i = 0; i < size; i++)
    {
        if is_undefined(target_list[| i]) {continue;}
        if target_list[| i].is_dead {continue;}
        var target_taunt = target_list[| i].taunt_power + target_list[| i].additional_taunt_power + target_list[| i].volatility_taunt_power
        if max_taunt < target_taunt
        {
            max_taunt = target_taunt
            max_taunt_instance = target_list[|i]
        }
    }
    target = max_taunt_instance
}

return target

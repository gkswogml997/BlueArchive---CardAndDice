///shield_break(attack_executor,attack_target,dice_eyes,attack_constant,is_truedamage)

var attack_executor = argument[0];
var attack_target = argument[1];
var dice_eyes = argument[2]
var attack_constant = argument[3]
var is_truedamage = argument[4]


var damage = roll_the_dice(dice_eyes,attack_executor);
damage *= attack_constant

if !is_truedamage
{   
    damage *= (attack_executor.attack_power + attack_executor.additional_attack_power + attack_executor.volatility_attack_power)
}

if !is_undefined(attack_target)
{
    damage *= attack_target.stack_of_weakness
    attack_target.be_attacked_damage += damage
}

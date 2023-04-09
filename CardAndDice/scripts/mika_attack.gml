///mika_attack(attack_executor,attack_target,dice_eyes)

var attack_executor = argument[0];
var attack_target = argument[1];
var dice_eyes = argument[2]

var damage = roll_the_dice(dice_eyes,attack_executor);
damage *= (attack_executor.attack_power + attack_executor.additional_attack_power + attack_executor.volatility_attack_power)


if !is_undefined(attack_target)
{
    damage *= attack_target.stack_of_weakness
    attack_target.be_attacked_damage += damage

    //send_log(attack_target.hangul_name+"가(이) "+attack_executor.hangul_name+"의(에) 공격에 의해 "+string(damage)+" 피해를 입음")
    instance_create_v(attack_target.x,attack_target.y,obj_damage_write,damage)
}

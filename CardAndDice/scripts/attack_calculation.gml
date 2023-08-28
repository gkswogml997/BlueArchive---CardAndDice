///attack_calculation(attack_executor,attack_target,constant,dice_eyes,is_truedamage,[is_critical])

var attack_executor = argument[0];
var attack_target = argument[1];
var constant = argument[2]
var dice_eyes = argument[3]
var is_truedamage = argument[4]
var is_critical = false
if argument_count = 6 {is_critical = argument[5]}

var damage = constant*roll_the_dice(dice_eyes,attack_executor);
if !is_truedamage {damage *= (attack_executor.attack_power + attack_executor.additional_attack_power + attack_executor.volatility_attack_power)}
if attack_executor.energy_charge > 0 {damage += attack_executor.energy_charge*6}

if !is_undefined(attack_target)
{
    attack_target.be_attacked_damage += damage
    if is_critical {attack_target.be_attacked_damage += damage}
    
    //var dir = point_direction(attack_executor.x,attack_executor.y,attack_target.x,attack_target.y)
    //instance_create_v(attack_executor.x,attack_executor.y,obj_gun_fire_effect,dir)
    
    send_log(attack_target.hangul_name+"가(이) "+attack_executor.hangul_name+"의(에) 공격에 의해 "+string(damage)+" 피해를 입음")
    
    //if !audio_is_playing(sd_basic_attack)
    //{audio_play_sound(sd_basic_attack,1001,false)}
    
}

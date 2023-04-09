///card_stat_change(target_id,stat_name,value)
var target = argument0
var stat = argument1
var value = argument2

if is_undefined(target) {return undefined;}
if target.is_dead {return undefined;}

audio_play_sound(sd_buff,1001,false)

//휘발성 스텟
if stat = "공격력" {target.volatility_attack_power += value}
if stat = "방어력" {target.volatility_defence_power += value}
if stat = "신속" {target.volatility_rapid_power += value}
if stat = "도발" {target.volatility_taunt_power += value}
if stat = "숙련도" {target.volatility_skill_level = value}
if stat = "취약" {target.stack_of_weakness += value}

send_log(target.hangul_name+"은(는) "+stat+"을 "+string(value)+" 얻었다.")

if value > 0 
{
    if stat = "공격력" {instance_create(target.x,target.y,obj_attack_power_effect)}
    if stat = "방어력" {instance_create(target.x,target.y,obj_defence_power_effect)}
    if stat = "신속" {instance_create(target.x,target.y,obj_defence_power_effect)}
    if stat = "도발" {instance_create(target.x,target.y,obj_defence_power_effect)}
    if stat = "숙련도" {instance_create(target.x,target.y,obj_defence_power_effect)}
    if stat = "취약" {instance_create(target.x,target.y,obj_shield_break_effect)}
}else if value < 0
{
    if stat = "취약" {instance_create(target.x,target.y,obj_recovery_effect)}
    else {instance_create(target.x,target.y,obj_statdown_effect)}
}

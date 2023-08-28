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
if stat = "에너지충전" {target.energy_charge += value}
if stat = "회피" {target.dodge_chance += value}

send_log(target.hangul_name+"은(는) "+stat+"을 "+string(value)+" 얻었다.",true)

if value > 0 
{
    if stat = "공격력" {effect_instance_create(target.x,target.y,spr_buff_icon_att,"buff")}
    if stat = "방어력" {effect_instance_create(target.x,target.y,spr_buff_icon_def,"buff")}
    if stat = "신속" {effect_instance_create(target.x,target.y,spr_buff_icon_rap,"buff")}
    if stat = "도발" {effect_instance_create(target.x,target.y,spr_buff_icon_tau,"buff")}
    if stat = "숙련도" {effect_instance_create(target.x,target.y,spr_buff_icon_lev,"buff")}
    if stat = "취약" {effect_instance_create(target.x,target.y,spr_debuff_icon_weakness,"normal")}
}else if value < 0
{
    if stat = "공격력" {effect_instance_create(target.x,target.y,spr_debuff_icon_att,"debuff")}
    if stat = "방어력" {effect_instance_create(target.x,target.y,spr_debuff_icon_def,"debuff")}
    if stat = "신속" {effect_instance_create(target.x,target.y,spr_debuff_icon_rap,"debuff")}
    if stat = "도발" {effect_instance_create(target.x,target.y,spr_debuff_icon_tau,"debuff")}
    if stat = "숙련도" {effect_instance_create(target.x,target.y,spr_debuff_icon_lev,"debuff")}
    if stat = "취약" {effect_instance_create(target.x,target.y,spr_buff_icon_weakness_recovery,"normal")}
}

///give_debuff_cure(target_id,stat_name,value)
var target = argument0
var stat = argument1
var value = argument2

if is_undefined(target) {return undefined;}
if target.is_dead {return undefined;}

audio_play_sound(sd_buff,1001,false)

value = abs(value)

//휘발성 스텟
if stat = "공격력" 
{
    if target.volatility_attack_power < 0
    {
        if target.volatility_attack_power < -value
        {
            target.volatility_attack_power += value
        }else
        {
            target.volatility_attack_power = 0
        }
    }
}
if stat = "방어력" 
{    
    if target.volatility_defence_power < 0
    {
        if target.volatility_defence_power < -value
        {
            target.volatility_defence_power += value
        }else
        {
            target.volatility_defence_power = 0
        }
    }
}
if stat = "신속" 
{    
    if target.volatility_rapid_power < 0
    {
        if target.volatility_rapid_power < -value
        {
            target.volatility_rapid_power += value
        }else
        {
            target.volatility_rapid_power = 0
        }
    }
}
if stat = "도발" 
{    
    if target.volatility_taunt_power < 0
    {
        if target.volatility_taunt_power < -value
        {
            target.volatility_taunt_power += value
        }else
        {
            target.volatility_taunt_power = 0
        }
    }
}

send_log(target.hangul_name+"은(는) "+stat+" 디버프를 치유받았다.",true)
effect_instance_create(target.x,target.y,spr_buff_icon_weakness_recovery,"normal")

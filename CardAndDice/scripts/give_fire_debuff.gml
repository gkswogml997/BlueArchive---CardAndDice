///give_fire_debuff(id)
var target = argument0;

if !is_undefined(target) and !target.is_dead 
{
    send_log(target.hangul_name+"화상을 얻었다.")
    target.fire_debuff = true
}



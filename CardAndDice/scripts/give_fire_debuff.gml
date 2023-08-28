///give_fire_debuff(owner_id,target_id)
var owner_id = argument0;
var target = argument1;

if !is_undefined(target) and !target.is_dead 
{
    send_log(target.hangul_name+"는 화상을 얻었다.",true)
    audio_play_sound(sd_fire,1001,false)
    target.fire_debuff = true
    //instance_create_v(owner_id.x,owner_id.y,obj_flamethower,owner_id,target)
    
}



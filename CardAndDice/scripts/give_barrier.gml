///give_barrier(id)
var target = argument0;

if !is_undefined(target) and !target.is_dead 
{
    target.barrier = true
    target.number_of_hits = 0
    
    send_log(target.hangul_name+"은 방어막을 얻었다.",true)
}

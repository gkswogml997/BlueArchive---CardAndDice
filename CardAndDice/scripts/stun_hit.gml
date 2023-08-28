///stun_hit(owner,ins)

var owner = argument0
var ins = argument1

if !instance_exists(obj_battle_turn_manager) {return undefined}
if is_undefined(ins) {return undefined}
else if ins.is_dead {return undefined}

ins.is_stun = true
send_log(ins.hangul_name+"가 기절 했습니다.",true)

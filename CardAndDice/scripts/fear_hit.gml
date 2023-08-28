var ins = argument0

if !instance_exists(obj_battle_turn_manager) {return undefined}
if is_undefined(ins) {return undefined}
else if ins.is_dead {return undefined}

ins.is_fear = true
send_log(ins.hangul_name+"가 공포에 질렸습니다.",true)

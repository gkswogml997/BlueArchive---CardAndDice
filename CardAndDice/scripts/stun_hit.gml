var ins = argument0

//턴매니져에 있는 자기 정보 삭제

if !instance_exists(obj_battle_turn_manager) {return undefined}
if is_undefined(ins) {return undefined}
else if ins.is_dead {return undefined}

ins.is_stun = true
send_log(ins.hangul_name+"가 기절 했습니다.")
instance_create(ins.x,ins.y,obj_stun_effect)


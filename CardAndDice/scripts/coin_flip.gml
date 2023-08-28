var actor = argument0
var coin = choose(true,false)

instance_create(actor.x,actor.y,obj_flip_coin)

if coin {
    send_log(actor.hangul_name + "가 힘껏 동전을 던져 앞면이 나왔습니다.",true)
    instance_create_v(actor.x,actor.y,obj_coin_flip_result,spr_flip_coin_front)
}
else {
    send_log(actor.hangul_name + "가 힘껏 동전을 던져 뒷면이 나왔습니다.",true)
    instance_create_v(actor.x,actor.y,obj_coin_flip_result,spr_flip_coin_back)
}

return coin

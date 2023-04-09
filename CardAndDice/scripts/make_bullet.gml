///make_bullet(x,y,owner_id,fire_angle,bullet_speed,bullet_sprite,is_shadow)
var xx = argument[0]
var yy = argument[1]
var owner_id = argument[2]
var angle = argument[3]
var bullet_speed = argument[4]
var bullet_sprite = argument[5]
var is_shadow = argument[6]

instance_create_v(xx,yy,obj_bullet,owner_id,angle,bullet_speed,bullet_sprite,is_shadow)

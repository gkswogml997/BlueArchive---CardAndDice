///roll_the_dice(dice_eyes,roll_executor)
var dice_eyes = argument0
var roll_executor = argument1
var dice = irandom(dice_eyes-1)+1
send_log(roll_executor.hangul_name+"에(의) 주사위 굴림! 값:"+string(dice))
return dice

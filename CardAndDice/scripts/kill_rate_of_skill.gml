///kill_rate_of_skill(x,y,owner_id,target_skill,target_card)
var xxx = argument0
var yyy = argument1
var owner_id = argument2
var target_skill = argument3
var target_card = argument4

//처치 확률 보여주기
if target_skill.is_attack_skill
{
    if !target_card.is_dead
    {
        var owner_attack_power = owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power
        var target_defence_power = target_card.defence_power + target_card.additional_defence_power + target_card.volatility_defence_power + target_card.weakness_def
        var min_damage = owner_attack_power * target_skill.attack_constant
        var max_damage = owner_attack_power * target_skill.dice * target_skill.attack_constant
        if !target_skill.use_attack_power_skill
        {
            min_damage = target_skill.attack_constant
            max_damage = target_skill.dice * target_skill.attack_constant
        }
        if target_skill.extra_description = "critical"
        {
            min_damage *= 2
            max_damage *= 2
        }
        var kill_rate = 0
        if (max_damage > target_defence_power)
        {
            kill_rate = (max_damage - target_defence_power)/(max_damage - min_damage) * 100
            if kill_rate > 100 {kill_rate = 100}
        }

        draw_set_font(ft_gyeonggi_sz20_Bold)
        draw_set_halign(fa_center)
        draw_set_valign(fa_bottom)
        if kill_rate >= 100
        {
            draw_set_color(c_green)
            draw_text_outline(xxx,yyy,"확정 처치",2,c_black,16)
        }else if kill_rate <= 0
        {
            draw_set_color(c_red)
            draw_text_outline(xxx,yyy,"처치 불가",2,c_black,16)
        }else
        {
            draw_set_color(c_yellow)
            draw_text_outline(xxx,yyy,"처치 확률:#"+string(kill_rate)+"%",2,c_black,16)
        }
    }
    }

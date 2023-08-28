//만약 스킬이 멀티 타켓을 가진 스킬이면 그 대상자들을 멀티타켓 스택에 적재 합니다.
multi_skill_target_load_on_stack()

if skill_number = 0
{
    //휴식
}

//숙련도에 따른 실패확률
var dice = roll_the_dice(6,owner_id)

if extra_description = "must_hit" {send_log("효과: 필중 발동",true)}
else
{
    if dice > owner_id.skill_level + 2
    {
        send_log(owner_id.hangul_name+"의 숙련도가 낮아 스킬 사용에 실패했습니다.",true)
        send_log("스킬 주사위 : "+string(dice)+" 이 캐릭터의 숙련도 "+string(owner_id.skill_level + 2) +" 보다 높아 스킬 사용에 실패했습니다.",false)
        instance_create(owner_id.x,owner_id.y,obj_failed_skill_effect)
        return undefined
    }else
    {
        send_log("스킬 주사위 : "+string(dice)+" 이 캐릭터의 숙련도 "+string(owner_id.skill_level + 2) +" 보다 낮아 스킬 사용에 성공했습니다.",false)
    }
}

//기본 스킬
if skill_number = 1
{
    //기본공격
    instance_create_v(x,y,obj_basic_attack_effect,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,6,false)
    card_stat_change(owner_id,"도발",3)
}

//크래프팅 스킬 섹터
if skill_number = 2
{
    //준비만전
    give_extra_turn(owner_id,1)
}
if skill_number = 3
{
    //향상된 휴식
    var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(6,owner_id);
    card_stat_change(global.skill_target,"방어력",value)
}
if skill_number = 4
{
    //교란
    stun_hit(owner_id,global.skill_target)
}
if skill_number = 5
{
    //캡슐화
    give_barrier(owner_id)
}
if skill_number = 6
{
    //잠이 보약
    card_stat_change(owner_id,"취약",-1)
}
if skill_number = 7
{
    //날 지켜봐줘!!!
    card_stat_change(global.skill_target,"취약",5)
    attack_calculation(owner_id,owner_id,9999,1,true)
}
if skill_number = 8
{
    //프랜드 쉴드
    var value = roll_the_dice(12,owner_id)
    card_stat_change(global.skill_target,"도발",-value)
    card_stat_change(owner_id,"도발",value)
}
if skill_number = 9
{
    //전술이동
    position_swap(owner_id,global.skill_target,owner_id.is_enemy)
}
if skill_number = 10
{
    //응급처치
    card_stat_change(global.skill_target,"취약",-1)
}
if skill_number = 11
{
    //점술가
    global.skill_target.flower_divination = true
}
if skill_number = 12
{
    //호감고닉
    var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*3;
    card_stat_change(global.skill_target,"도발",value)
}
if skill_number = 13
{
    //결속, 정확, 완벽.
    card_stat_change(owner_id,"숙련도",4)
}
if skill_number = 14
{
    //우아하게, 제거합니다.
    card_stat_change(global.skill_target,"취약",1)
    attack_calculation(owner_id,global.skill_target,1,1,true)
}
if skill_number = 15
{
    //어드바이스
    card_stat_change(global.skill_target,"공격력",1)
}
if skill_number = 16
{
    //불지르기
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        attack_calculation(owner_id,target,1,1,true)
        give_fire_debuff(owner_id,target)
    }
}
if skill_number = 17
{
    //항상 노력해
    var value = roll_the_dice(6,owner_id)
    card_stat_change(global.skill_target,"신속",value)
}

if skill_number = 18
{
    //머리 후려치기
    attack_calculation(owner_id,global.skill_target,1,12,false,true)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"critical",global.skill_target)
}

if skill_number = 19
{
    //코토리의 퍼니박스
    summon_card(108,owner_id.is_enemy)
}

if skill_number = 20
{
    //몰아치기
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"공격력",1)
    }
}

if skill_number = 21
{
    //택티컬 서포팅
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"방어력",roll_the_dice(6,owner_id))
    }
}
if skill_number = 22
{
    //선생님의 지휘
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"숙련도",4)
    }
}
if skill_number = 23
{
    //신속 지원
    card_stat_change(global.skill_target,"신속",1)
}
if skill_number = 24
{
    //은엄폐
    card_stat_change(global.skill_target,"도발",-3)
}
if skill_number = 25
{
    //전열 가다듬기
    card_stat_change(global.skill_target,"방어력",5)
    card_stat_change(global.skill_target,"도발",3)
}
if skill_number = 26
{
    //닌자의 몸놀림
    card_stat_change(owner_id,"회피",1)
}
if skill_number = 27
{
    //핫산
    var value = roll_the_dice(20,owner_id)
    give_debuff_cure(owner_id,"공격력",value)
    give_debuff_cure(owner_id,"방어력",value)
    give_debuff_cure(owner_id,"신속",value)
    give_debuff_cure(owner_id,"도발",value)
}
if skill_number = 28
{
    //축전지
    card_stat_change(owner_id,"에너지충전",2)
}
if skill_number = 29
{
    //전력 방출
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        var value = roll_the_dice(20,owner_id);
        attack_calculation(owner_id,global.skill_target,owner_id.enegy_charge * value,1,true)
    }
}
if skill_number = 30
{
    //겁주기
    fear_hit(global.skill_target)
}

//소환물 스킬 섹터
if skill_number = 100
{
    //소환물 패널티
    card_stat_change(owner_id,"방어력",-10)
}
if skill_number = 101
{
    //드론연사 *시로코 소환물
    continuous_shooting(2,owner_id,global.skill_target,1,6,false)
}
if skill_number = 102
{
    //긴급 구호 *세나 소환물
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"취약",-2)
    }
}
if skill_number = 103
{
    //군침도는 식단 *후우카 소환물
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"취약",-1)
    }
}
if skill_number = 104
{
    //주포 조준, 발사. *이로하 소환물
    attack_calculation(owner_id,global.skill_target,1,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,global.skill_target)
}
if skill_number = 105
{
    //생각하는 의자 *우타하 소환물
    card_stat_change(owner_id,"도발",15)
}
if skill_number = 106
{
    //테이크아웃! *시즈코 소환물
    for(var i = 0; i < global.p_list_max; i++)
    {
        var target = search_skill_location_target(i,false)
        card_stat_change(target,"숙련도",3)
    }
}
if skill_number = 107
{
    //혁명적 난사!!! *체리노 소환물
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(3,owner_id,target,1,6,false)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"circle",undefined)
}
if skill_number = 108
{
    //맛있는 피자 *피자머신 소환물
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        instance_create_v(owner_id.x,owner_id.y,obj_pizza,owner_id,target)
        card_stat_change(target,"방어력",6)
    }
}
if skill_number = 109
{
    //배달 공짜 *피자머신 소환물
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        instance_create_v(owner_id.x,owner_id.y,obj_pizza,owner_id,target)
        card_stat_change(target,"방어력",-3)
    }
}
if skill_number = 110
{
    //음?식 *주리 소환물
    card_stat_change(owner_id,"도발",roll_the_dice(20,owner_id))

}
if skill_number = 111
{
    //백열안광
    var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(20,owner_id)
    card_stat_change(global.skill_target,"방어력",-value)
}
if skill_number = 112
{
    //미니언 흡수
    var value = global.skill_target.stack_of_weakness;
    card_stat_change(global.skill_target,"취약",-value)
    card_stat_change(owner_id,"취약",value)
}



//플레이어 스킬 섹터
if skill_number = 1001
{
    //전술 진압
    give_barrier(owner_id)
    stun_hit(owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_hoshino_skill_animation,owner_id,global.skill_target)
}
if skill_number = 1002
{
    //드론 소환: 화력 지원
    summon_card(101,owner_id.is_enemy)
}
if skill_number = 1003
{
    //걸리적거리잖아!
    card_stat_change(owner_id,"신속",2)
}
if skill_number = 1004
{
    //특급송달: 전투지원품
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"방어력",roll_the_dice(6,owner_id))
    }
}
if skill_number = 1005
{
    //혼날 시간이에요~♣
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(2,owner_id,target,1,6,true)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"fan_shape",undefined)
}
if skill_number = 2001
{
    //하드보일드 샷
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        attack_calculation(owner_id,target,1,6,false)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_hardboiled_shot,owner_id,global.skill_target)
}
if skill_number = 2002
{
    //정찰의 결과입니다.
    card_stat_change(global.skill_target,"공격력",3)
}
if skill_number = 2003
{
    //응급차량 출동
    summon_card(102,owner_id.is_enemy)
}
if skill_number = 2004
{
    //종막: 이스보셋
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(3,owner_id,target,1,6,false)
        instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"point",target)
    }
}
if skill_number = 2005
{
    //꿰뚫는 엘레강스
    attack_calculation(owner_id,global.skill_target,1,20,false,true)
    instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,global.skill_target)
}
if skill_number = 2006
{
    //급식 시간!
    summon_card(103,owner_id.is_enemy)
}
if skill_number = 2007
{
    //갑니다. 토라마루
    summon_card(104,owner_id.is_enemy)
}
if skill_number = 2008
{
    //작열의 세레나데
    var control_group_A = search_skill_location_target(1,!owner_id.is_enemy);
    var control_group_B = search_skill_location_target(3,!owner_id.is_enemy);
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        if target = control_group_A or target = control_group_B
        {attack_calculation(owner_id,target,1,12,false)}
        else
        {attack_calculation(owner_id,target,1,6,false);
        instance_create_v(owner_id.x,owner_id.y,obj_bag_bomb,owner_id,target)}
    }
}
if skill_number = 2009
{
    //패닉 브링거
    fear_hit(global.skill_target)
}
if skill_number = 2010
{
    //펌프 패닝
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(3,owner_id,target,3,1,true)
        instance_create_v(owner_id.x,owner_id.y,obj_haruka_skill_animation,owner_id,target)
    }
}
if skill_number = 2011
{
    //일망타진
    continuous_shooting(3,owner_id,global.skill_target,3,20,true)
    instance_create_v(owner_id.x,owner_id.y,obj_iori_skill_animation,owner_id,global.skill_target)
}
if skill_number = 2012
{
    //전술 치료 시행
    give_debuff_cure(global.skill_target,"방어력",10)
}
if skill_number = 2013
{
    //주리의 요리 시간!
    summon_card(110,owner_id.is_enemy)
}



if skill_number = 3001
{
    //Q.E.D
    give_barrier(global.skill_target)
    card_stat_change(global.skill_target,"도발",10)
}
if skill_number = 3002
{
    //아플 확률이 높아
    instance_create(owner_id.x,owner_id.y,obj_missile_bombing_manager)
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        attack_calculation(owner_id,target,3,6,true)
    }
}
if skill_number = 3003
{
    //아앙~? 죽인다?
    continuous_shooting(9,owner_id,global.skill_target,1,1,true)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"point",global.skill_target)
}
if skill_number = 3004
{
    //오버라이드
    stun_hit(owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,12,false)
    instance_create_v(x,y,obj_basic_attack_effect,owner_id,global.skill_target)
}
if skill_number = 3005
{
    //후후, 실력을 보여드리죠.
    card_stat_change(global.skill_target,"공격력",roll_the_dice(6,owner_id))
}
if skill_number = 3006
{
    //게임, 스타트!
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        attack_calculation(owner_id,target,1,12,false)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_nyancat,owner_id,global.skill_target)
}
if skill_number = 3007
{
    //천둥이 등장
    summon_card(105,owner_id.is_enemy)
}
if skill_number = 3008
{
    //갈게!
    position_swap(owner_id,global.skill_target,owner_id.is_enemy)
    card_stat_change(owner_id,"신속",1)
}
if skill_number = 3009
{
    //대상, 삭제
    attack_calculation(owner_id,global.skill_target,3,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,global.skill_target)
}
if skill_number = 3010
{
    //우아하게, 제거합니다.
    card_stat_change(global.skill_target,"취약",2)
    attack_calculation(owner_id,global.skill_target,1,1,true)
    instance_create_v(owner_id.x,owner_id.y,obj_debuff_bullet,owner_id,global.skill_target)
}
if skill_number = 3011
{
    //밸런스 붕괴
    instance_create_v(owner_id.x,owner_id.y,obj_super_nova_laser,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,2,6,false)
    card_stat_change(owner_id,"에너지충전",1)
}
if skill_number = 3012
{
    //창작의 고통
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(4,owner_id,target,1,1,false)
        instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"point",target)
    }
}
if skill_number = 3013
{
    //드로잉 아트
    var list = obj_GAME_SYSTEM_MANAGER.enemy_list
    if owner_id.is_enemy {list = obj_GAME_SYSTEM_MANAGER.player_list}
    var target = undefined
    target = target_search("attack_power",list)
    
    if !is_undefined(target)
    {
        continuous_shooting(5,owner_id,target,1,6,false)
        instance_create_v(owner_id.x,owner_id.y,obj_midori_skill_animation,owner_id,target)
    }
}


if skill_number = 4001
{
    //Kyrie Eleison
    shield_break(owner_id,global.skill_target,12,1,false)
    instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,global.skill_target)
}
if skill_number = 4002
{
    //집중 치료 세트 A
    var value = global.skill_target.stack_of_weakness;
    card_stat_change(global.skill_target,"취약",-value)
}
if skill_number = 4003
{
    //신성한 가호
    give_barrier(global.skill_target)
    card_stat_change(global.skill_target,"취약",-1)
}
if skill_number = 4004
{
    //기괴멸렬
    attack_calculation(owner_id,global.skill_target,1,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_shotgun_effect,owner_id,global.skill_target)
    global.skill_target.kill_reward_recipient = owner_id
}
if skill_number = 4005
{
    //고서 전문가
    give_extra_turn(global.skill_target,1)
}
if skill_number = 4006
{
    //intulit mortem
    continuous_shooting(5,owner_id,global.skill_target,1,1,true)
    card_stat_change(global.skill_target,"취약",1)
}
if skill_number = 4007
{
    //달리는 섬광탄
    card_stat_change(owner_id,"신속",20)
    stun_hit(owner_id,owner_id)
    instance_create_v(owner_id.x,owner_id.y,obj_flash_bang,owner_id,owner_id)
}
if skill_number = 4008
{
    //도와줘요, 페로로 님!
    summon_card(111,owner_id.is_enemy)
}
if skill_number = 4009
{
    //누, 누가 당황할 줄 알고?
    if coin_flip(owner_id)
    {
        while(!ds_stack_empty(multi_target_stack))
        {
            var target = ds_stack_pop(multi_target_stack)
            stun_hit(owner_id,target)
            instance_create_v(owner_id.x,owner_id.y,obj_flash_bang,owner_id,target)
        }
        instance_create(owner_id.x,owner_id.y,obj_yoshimi_smile_effect)
    }
}
if skill_number = 4010
{
    //아머 피어싱샷
    shield_break(owner_id,global.skill_target,20,2,true)
    instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,global.skill_target)
}
if skill_number = 4011
{
    //정의의 일격
    if coin_flip(owner_id)
    {
        attack_calculation(owner_id,global.skill_target,1,20,false)
        instance_create_v(owner_id.x,owner_id.y,obj_justice_cross_bullet,owner_id,global.skill_target,true)
    }else
    {
        attack_calculation(owner_id,global.skill_target,1,12,false)
        instance_create_v(owner_id.x,owner_id.y,obj_justice_cross_bullet,owner_id,global.skill_target,false)
    }
}
if skill_number = 4012
{
    //성스러운 수류탄
    if owner_id.is_enemy = global.skill_target.is_enemy
    {
        card_stat_change(global.skill_target,"취약",-1)
    }else
    {
        card_stat_change(global.skill_target,"취약",1)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_holy_grenade,owner_id,global.skill_target)
}
if skill_number = 4013
{
    //비장의 수단
    give_debuff_cure(owner_id,"공격력",owner_id.volatility_attack_power)
    give_debuff_cure(owner_id,"방어력",owner_id.volatility_defence_power)
    give_debuff_cure(owner_id,"신속",owner_id.volatility_rapid_power)
    give_debuff_cure(owner_id,"도발",owner_id.volatility_taunt_power)
    give_barrier(owner_id)
}
if skill_number = 5001
{
    //전술방패 전개
    var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(6,owner_id);
    card_stat_change(global.skill_target,"도발",value)
}
if skill_number = 5002
{
    //백야당 출장!
    summon_card(106,owner_id.is_enemy)
}
if skill_number = 5003
{
    //진홍빛 꽃점
    global.skill_target.flower_divination = true
    continuous_shooting(4,owner_id,global.skill_target,1,6,false)
    instance_create_v(owner_id.x,owner_id.y,obj_wakamo_skill_animation,owner_id,global.skill_target)
}
if skill_number = 5004
{
    //이즈나 인법첩!
    card_stat_change(owner_id,"공격력",2)
    position_swap(owner_id,global.skill_target,owner_id.is_enemy)
}
if skill_number = 5005
{
    //아플지도 몰라~
    attack_calculation(owner_id,global.skill_target,1,6,false)
    give_fire_debuff(owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_fire_grenade,owner_id,global.skill_target)
}
if skill_number = 5006
{
    //연사 모드!
    card_stat_change(owner_id,"공격력",1)
    card_stat_change(owner_id,"신속",1)
}
if skill_number = 5007
{
    //따끈따끈 꽃구경이에요.
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"신속",1)
    }
}
if skill_number = 5008
{
    //신호탄, 발사!
    if coin_flip(owner_id)
    {
        while(!ds_stack_empty(multi_target_stack))
        {
            var target = ds_stack_pop(multi_target_stack)
            give_barrier(target)
        }
    }
}
if skill_number = 5009
{
    //미치루 인법첩이라구!
    attack_calculation(owner_id,global.skill_target,1,6,true)
    give_fire_debuff(owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_fire_grenade,owner_id,global.skill_target)
}
if skill_number = 5010
{
    //츠, 츠쿠요 인법첩…이에요!
    owner_id.card_portrait = spr_portrait_Tsukuyo_tree
    give_barrier(owner_id)
}
if skill_number = 5011
{
    //팬으로서의 몸가짐
    if owner_id.is_enemy != global.skill_target.is_enemy
    {
        card_stat_change(global.skill_target,"공격력",-1*roll_the_dice(6,owner_id))
    }
    if global.skill_target.hangul_name = "치세"
    {
        card_stat_change(global.skill_target,"공격력",6)
        send_log("치세님 팬이에요!",true)
    }
}
if skill_number = 6001
{
    //참 잘했어요
    if global.skill_target.good_stamp 
    {
        send_log("참 잘했어요!",true)
        card_stat_change(global.skill_target,"공격력",4)
        global.skill_target.good_stamp = false
    }
    else
    {
        send_log("칭찬도장 꾸욱!",true)
        card_stat_change(global.skill_target,"공격력",2)
        global.skill_target.good_stamp = true
    }
}
if skill_number = 6002
{
    //나쁜 아이는 어디있나요?
    var list = obj_GAME_SYSTEM_MANAGER.enemy_list
    if owner_id.is_enemy {list = obj_GAME_SYSTEM_MANAGER.player_list}
    var target = undefined
    target = target_search("attack_power",list)
    
    if !is_undefined(target)
    {
        attack_calculation(owner_id,target,1,12,false)
        card_stat_change(target,"공격력",-1)
        instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,target)
    }
}
if skill_number = 6003
{
    //나님의 걸작이라고!
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        give_fire_debuff(owner_id,target)
        instance_create_v(owner_id.x,owner_id.y,obj_fire_grenade,owner_id,target)
    }
}
if skill_number = 7001
{
    //시구레 특제 보틀 그레네이드
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        attack_calculation(owner_id,target,1,6,false)
        give_fire_debuff(owner_id,target)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_molotov_cocktail,owner_id,target)
}
if skill_number = 7002
{
    //여러분, 제 말에 귀 기울여 주세요!
    card_stat_change(global.skill_target,"숙련도",4)
}
if skill_number = 7003
{
    //친위대 소환!
    summon_card(107,owner_id.is_enemy)
}
if skill_number = 7004
{
    //혁명적 돌격!
    summon_card(107,owner_id.is_enemy)
}
if skill_number = 7005
{
    //관측 지원
    card_stat_change(global.skill_target,"숙련도",1)
}
if skill_number = 8001
{
    //공안국장의 수완
    global.skill_target.flower_divination = true
    continuous_shooting(2,owner_id,global.skill_target,1,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_bust_animation,owner_id,global.skill_target,2)
}
if skill_number = 8002
{
    //협상은 없습니다!
    stun_hit(owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,12,true)
    instance_create_v(owner_id.x,owner_id.y,obj_flash_bang,owner_id,global.skill_target)
}
if skill_number = 8003
{
    //일단은 달콤한 휴식부터
    card_stat_change(owner_id,"공격력",1)
}
if skill_number = 9001
{
    //강철의 비
    instance_create(owner_id.x,owner_id.y,obj_moe_skill_animation)
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(2,owner_id,target,1,12,true)
        give_fire_debuff(owner_id,target)
    }
}
if skill_number = 9002
{
    //소심한 관측
    card_stat_change(global.skill_target,"취약",1)
    card_stat_change(owner_id,"도발",-1*roll_the_dice(6,owner_id))
}
if skill_number = 9003
{
    //섬광 드론 전개
    var target = search_skill_location_target(owner_id.card_position,!owner_id.is_enemy)
    attack_calculation(owner_id,target,1,20,false)
    stun_hit(owner_id,target)
    instance_create_v(owner_id.x,owner_id.y,obj_flash_drone,owner_id,target)
    
}
if skill_number = 9004
{
    //지원사격 개시!
    var target = search_skill_location_target(owner_id.card_position,!owner_id.is_enemy)
    continuous_shooting(3,owner_id,target,1,6,false)
    stun_hit(owner_id,target)
    instance_create_v(owner_id.x,owner_id.y,obj_flash_bang,owner_id,target)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"point",target)
    
}
if skill_number = 10001
{
    //Et Omnia Vanitas!
    attack_calculation(owner_id,global.skill_target,1,20,false,true)
    instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,global.skill_target)
}
if skill_number = 10002
{
    //헛된 세계
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)        
        attack_calculation(owner_id,target,1,20,true)
        give_fire_debuff(owner_id,target)
        instance_create_v(owner_id.x,owner_id.y,obj_fire_grenade,owner_id,target)
    }

}
if skill_number = 10003
{
    //이것도 나의 힘……?
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);        
        card_stat_change(target,"회피",1)
    }
}
if skill_number = 10004
{
    //지, 지금 지원할게요!
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        card_stat_change(target,"방어력",-1*roll_the_dice(12,owner_id))      
    }
}





//적 스킬 섹터
if skill_number = 1501
{
    //알바의 눈물
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,6,false)
}
if skill_number = 1502
{
    //선도부 진압
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        card_stat_change(target,"방어력",-2)      
    }
}
if skill_number = 1503
{
    //게헨나 회장의 지휘
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,12,false)
}
if skill_number = 1504
{
    //만마전 진압
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        card_stat_change(target,"방어력",-2)      
    }
}
if skill_number = 1505
{
    //선도부장의 지휘
    card_stat_change(owner_id,"방어력",5)
}
if skill_number = 1506
{
    //진리는 나의 빛
    var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power);
    card_stat_change(owner_id,"신속",2*value)
}
if skill_number = 1507
{
    //코토리의 퍼니박스
    summon_card(108,owner_id.is_enemy)
}
if skill_number = 1508
{
    //떠돌이의 설움
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_bust_animation,owner_id,global.skill_target,2)
    continuous_shooting(2,owner_id,global.skill_target,1,6,false)
}
if skill_number = 1509
{
    //난사다!!!
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        continuous_shooting(2,owner_id,target,1,6,true)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"fan_shape",undefined)
}

if skill_number = 1510
{
    //헬멧을 썼어야지
    stun_hit(owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,6,false)
}

if skill_number = 1511
{
    //머리깨기
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,20,false)
}

if skill_number = 1512
{
    //첨벙첨벙 헬멧단
    summon_card(109,owner_id.is_enemy)
}

if skill_number = 1513
{
    //일단 진정하시고
    var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(6,owner_id);
    card_stat_change(global.skill_target,"도발",-value)
}

if skill_number = 1514
{
    //무력진압
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,10,1,true)
}
if skill_number = 1515
{
    //끝없는 군세
    var value = 2*roll_the_dice(6,owner_id);
    card_stat_change(owner_id,"방어력",value)
}
if skill_number = 1516
{
    //신비...
    card_stat_change(global.skill_target,"취약",1)
}
if skill_number = 1517
{
    //자비송
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        continuous_shooting(3,owner_id,target,1,6,true)
        instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"mystic",target)
    }
}
if skill_number = 1518
{
    //비명
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(6,owner_id);
        card_stat_change(target,"방어력",-value)
    }
    
}
if skill_number = 1519
{
    //정의실현
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        attack_calculation(owner_id,target,1,12,true)
        instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,target)
    }
}
if skill_number = 1520
{
    //자비
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        card_stat_change(target,"취약",-1)
    }
}
if skill_number = 1521
{
    //불장난
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        attack_calculation(owner_id,target,1,6,false)
        give_fire_debuff(owner_id,target)
        instance_create_v(owner_id.x,owner_id.y,obj_flamethower,owner_id,target)
    }
}
if skill_number = 1522
{
    //로켓장난
    instance_create(owner_id.x,owner_id.y,obj_missile_bombing_manager)
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);
        attack_calculation(owner_id,target,1,12,false)
    }
}
if skill_number = 1523
{
    //무지성난사
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);
        continuous_shooting(2,owner_id,target,1,12,false)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"fan_shape",target)
}
if skill_number = 1524
{
    //기계적 조준
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_bust_animation,owner_id,global.skill_target,2)
    continuous_shooting(2,owner_id,global.skill_target,1,12,false)
}
if skill_number = 1525
{
    //기계적 점사
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_bust_animation,owner_id,global.skill_target,3)
    continuous_shooting(3,owner_id,global.skill_target,1,12,false)
}
if skill_number = 1526
{
    //스패셜리스트
    card_stat_change(owner_id,"취약",-1)
}
if skill_number = 1527
{
    //전술 지휘
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);
        card_stat_change(target,"공격력",1)
    }
}
if skill_number = 1528
{
    //전술 판단
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);
        card_stat_change(target,"방어력",roll_the_dice(6,owner_id))
    }
}
if skill_number = 1529
{
    //장군의 위엄
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);
        card_stat_change(target,"숙련도",4)
    }
}
if skill_number = 1530
{
    //역장
    give_barrier(owner_id)
}
if skill_number = 1531
{
    //소확행의 확장주의적 행보
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(3,owner_id,target,3,6,false)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"circle",undefined)
}
if skill_number = 1532
{
    //소소한 행복
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);        
        target.dodge_chance++
    }
}
if skill_number = 1533
{
    //행복회로
    card_stat_change(owner_id,"에너지충전",1)
}
if skill_number = 1534
{
    //전도
    attack_calculation(owner_id,global.skill_target,1,1,true)
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
}
if skill_number = 1535
{
    //주사위의 신
    var value = roll_the_dice(6,owner_id)
    var rand = choose(false,true)
    if rand {value *= -1}
    card_stat_change(owner_id,"공격력",value)
    var value = roll_the_dice(6,owner_id)
    var rand = choose(false,true)
    if rand {value *= -1}
    card_stat_change(owner_id,"방어력",value)
    var value = roll_the_dice(6,owner_id)
    var rand = choose(false,true)
    if rand {value *= -1}
    card_stat_change(owner_id,"신속",value)
    var value = roll_the_dice(6,owner_id)
    var rand = choose(false,true)
    if rand {value *= -1}
    card_stat_change(owner_id,"도발",value)
}
if skill_number = 1536
{
    //어둠의 듀얼
    if coin_flip(owner_id)
    {
        attack_calculation(owner_id,global.skill_target,1,20,false)
        instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    }
}
if skill_number = 1537
{
    //튀기면 신발도 맛있습니다.
    var target = search_skill_location_target(owner_id.card_position,!owner_id.is_enemy)
    give_fire_debuff(owner_id,target)
}
if skill_number = 1538
{
    //뜨거운 맛
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        continuous_shooting(3,owner_id,target,1,6,true)
        give_fire_debuff(owner_id,target)
        instance_create_v(owner_id.x,owner_id.y,obj_flamethower,owner_id,target)
    }
}
if skill_number = 1539
{
    //느와르
    card_stat_change(owner_id,"회피",2)
}
if skill_number = 1540
{
    //검은색 탄환
    attack_calculation(owner_id,global.skill_target,1,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
}
if skill_number = 1541
{
    //지맥탐사
    if coin_flip(owner_id)
    {card_stat_change(owner_id,"공격력",1)}
}
if skill_number = 1542
{
    //시끄러운 공사소리
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        card_stat_change(target,"방어력",-3)
    }
}
if skill_number = 1543
{
    //지반폭파
    instance_create(owner_id.x,owner_id.y,obj_missile_bombing_manager)
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack)
        attack_calculation(owner_id,target,6,1,false)
    }
}
if skill_number = 1544
{
    //이것저것 보상하라!
    var target = undefined
    {
        var target_list = obj_GAME_SYSTEM_MANAGER.enemy_list
        if owner_id.is_enemy {target_list = obj_GAME_SYSTEM_MANAGER.player_list}
        var size = ds_list_size(target_list)
        var min_taunt_instance = undefined
        var min_taunt = 9999
        for (var i = 0; i < size; i++)
        {
            if is_undefined(target_list[| i]) {continue;}
            if target_list[| i].is_dead {continue;}
            var target_taunt = target_list[| i].taunt_power + target_list[| i].additional_taunt_power + target_list[| i].volatility_taunt_power
            if min_taunt > target_taunt
            {
                min_taunt = target_taunt
                min_taunt_instance = target_list[|i]
            }
        }
        target = min_taunt_instance
    }
    if !is_undefined(target) {card_stat_change(target,"도발",roll_the_dice(6,owner_id))}
}
if skill_number = 1545
{
    //용역부 기습시위
    attack_calculation(owner_id,global.skill_target,6,1,true)
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
}
if skill_number = 1546
{
    //혐성
    card_stat_change(owner_id,"신속",1)
}
if skill_number = 1547
{
    //트리니티 고유 문화
    attack_calculation(owner_id,global.skill_target,2,6,true)
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    card_stat_change(global.skill_target,"도발",-6)
}
if skill_number = 1548
{
    //트리니티식 환영인사
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);
        continuous_shooting(2,owner_id,target,1,6,false)
        instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_bust_animation,owner_id,target,2)
    }
}
if skill_number = 1549
{
    //지나가던 사람
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,6,false)
}


//총력전 보스 스킬 섹터 
if skill_number = 2501
{
    //외접
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        attack_calculation(owner_id,target,1,12,false)
        instance_create_v(owner_id.x,owner_id.y,obj_siro_ball,owner_id,target)
    }
}
if skill_number = 2502
{
    //내접
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        attack_calculation(owner_id,target,1,12,false)
        instance_create_v(owner_id.x,owner_id.y,obj_siro_ball,owner_id,target)
    }
}
if skill_number = 2503
{
    //한점에서 만남
    continuous_shooting(2,owner_id,global.skill_target,1,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_siro_ball,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_siro_ball,owner_id,global.skill_target)
}
if skill_number = 2504
{
    //굴러오는 공
    card_stat_change(owner_id,"공격력",1)
}
if skill_number = 2505
{
    //공굴러가유~
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)
        card_stat_change(target,"취약",value)
    }
}
if skill_number = 2506
{
    //슬럼피아의 공포
    var target = undefined
    {
        var target_list = obj_GAME_SYSTEM_MANAGER.enemy_list
        if owner_id.is_enemy {target_list = obj_GAME_SYSTEM_MANAGER.player_list}
        var size = ds_list_size(target_list)
        var min_taunt_instance = undefined
        var min_taunt = 9999
        for (var i = 0; i < size; i++)
        {
            if is_undefined(target_list[| i]) {continue;}
            if target_list[| i].is_dead {continue;}
            var target_taunt = target_list[| i].taunt_power + target_list[| i].additional_taunt_power + target_list[| i].volatility_taunt_power
            if min_taunt > target_taunt
            {
                min_taunt = target_taunt
                min_taunt_instance = target_list[|i]
            }
        }
        target = min_taunt_instance
    }
    if !is_undefined(target) {card_stat_change(target,"도발",roll_the_dice(12,owner_id))}

}
if skill_number = 2507
{
    //조랑말 돌진이다-!!!
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        attack_calculation(owner_id,target,1,12,false)
        instance_create_v(owner_id.x,owner_id.y,obj_carousel,owner_id,target)
    }
}
if skill_number = 2508
{
    //범퍼카 돌진이다-!!!
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        attack_calculation(owner_id,target,1,12,false)
        instance_create_v(owner_id.x,owner_id.y,obj_dodgems,owner_id,target)
    }
}
if skill_number = 2509
{
    //아칠루트의 빛
    continuous_shooting(2,owner_id,global.skill_target,1,20,false)
    instance_create_v(owner_id.x,owner_id.y,obj_super_nova_laser,owner_id,global.skill_target)
}
if skill_number = 2510
{
    //공의의 불꽃
    instance_create(owner_id.x,owner_id.y,obj_missile_bombing_manager)
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        attack_calculation(owner_id,target,1,12,false)
    }
}
if skill_number = 2511
{
    //정화의 폭풍
    instance_create(owner_id.x,owner_id.y,obj_sandstorm_animation)
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        var value = roll_the_dice(6,owner_id)
        card_stat_change(target,"취약",value)
    }
}
if skill_number = 2512
{
    //왕좌로 부르는 소리 있도다
    summon_card(55006,owner_id.is_enemy)
}
if skill_number = 2513
{
    //지고의 권능을 목도하라
    while(!ds_stack_empty(multi_target_stack))
    {
        var target = ds_stack_pop(multi_target_stack);  
        card_stat_change(target,"취약",3)
    }
}
if skill_number = 2514
{
    //껍질닫기
    card_stat_change(owner_id,"취약",-2)
    card_stat_change(owner_id,"방어력",50)
}
if skill_number = 2515
{
    //자폭
    card_stat_change(global.skill_target,"취약",2)
    attack_calculation(owner_id,global.skill_target,1,20,true)
    attack_calculation(owner_id,owner_id,9999,1,true)
}




//테스트 스킬 섹터
if skill_number = 500
{
    //테스트 버프 스킬
    card_stat_change(global.skill_target,"공격력",1)
    card_stat_change(global.skill_target,"방어력",1)
    card_stat_change(global.skill_target,"신속",1)
    card_stat_change(global.skill_target,"도발",1)
    card_stat_change(global.skill_target,"숙련도",4)
    global.skill_target.is_stun = true
    global.skill_target.is_fear = true
    global.skill_target.good_stamp = true
    global.skill_target.fire_debuff = true
    global.skill_target.barrier = true
    global.skill_target.flower_divination = true
}
if skill_number = 501
{
    //고자되기
    attack_calculation(owner_id,global.skill_target,9999,1,true)
    send_log(global.skill_target.hangul_name+"은(는) 고자가 되었다..",true)
}
if skill_number = 502
{
    //테스트 패시브 스킬
    send_log("아무일도 일어나지 않았다...")
}
if skill_number = 503
{
    //소환 테스트
    summon_card(90006,owner_id.is_enemy)
}
if skill_number = 504
{
    //창조주의 권능
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,true)
        attack_calculation(owner_id,target,9999,1,false)
    }
}
if skill_number = 505
{
    //카드가 다 떨어졌어
    
}
if skill_number = 506
{
    //얼음 여왕의 매혹적인 향기
    attack_calculation(owner_id,global.skill_target,9999,1,false)   
}
if skill_number = 507
{
    //네루야 사랑해
    card_stat_change(owner_id,"공격력",1)
}
if skill_number = 510
{
    //스킬 이팩트 테스트
    attack_calculation(owner_id,global.skill_target,9999,1,false)   
    instance_create(owner_id.x,owner_id.y,obj_sandstorm_animation)
    instance_create(owner_id.x,owner_id.y,obj_missile_bombing_manager)
    instance_create_v(owner_id.x,owner_id.y,obj_super_nova_laser,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_flamethower,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_molotov_cocktail,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_flash_bang,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_flash_drone,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_pizza,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_nyancat,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_holy_grenade,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_justice_cross_bullet,owner_id,global.skill_target,true)
    instance_create_v(owner_id.x,owner_id.y,obj_dodgems,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_carousel,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_siro_ball,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_bag_bomb,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_fire_grenade,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_hardboiled_shot,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_critical_bullet,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_basic_attack_effect,owner_id,global.skill_target)
    
    instance_create_v(owner_id.x,owner_id.y,obj_haruka_skill_animation,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_hoshino_skill_animation,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_iori_skill_animation,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_wakamo_skill_animation,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_midori_skill_animation,owner_id,global.skill_target)
    instance_create_v(owner_id.x,owner_id.y,obj_moe_skill_animation,owner_id,global.skill_target)
}














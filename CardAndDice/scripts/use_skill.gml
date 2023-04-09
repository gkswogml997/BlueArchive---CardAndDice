
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
        send_log("스킬 주사위 : "+string(dice)+" 이 캐릭터의 숙련도 "+string(owner_id.skill_level + 2) +" 보다 높아 스킬 사용에 실패했습니다.",true)
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
    attack_calculation(owner_id,global.skill_target,1,6,false)
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
    stun_hit(global.skill_target)
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



//소환물 스킬 섹터
if skill_number = 100
{
    //소환물 패널티
    card_stat_change(owner_id,"취약",1)
}
if skill_number = 101
{
    //드론연사 *시로코 소환물
    continuous_shooting(2,owner_id,global.skill_target,1,6,false)
}
if skill_number = 102
{
    //긴급 구호 *세나 소환물
    var left_target = search_skill_extra_target(global.skill_target,-1)
    card_stat_change(left_target,"취약",-2)
}
if skill_number = 103
{
    //군침도는 식단 *후우카 소환물
    var left_target = search_skill_extra_target(global.skill_target,-1)
    var right_target = search_skill_extra_target(global.skill_target,1)
    card_stat_change(left_target,"취약",-1)
    card_stat_change(right_target,"취약",-1)
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
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,true)
        continuous_shooting(3,owner_id,target,1,6,false)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"circle",undefined)
}
if skill_number = 108
{
    //맛있는 피자 *피자머신 소환물
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,owner_id.is_enemy)
        card_stat_change(target,"방어력",6)
    }
}
if skill_number = 109
{
    //배달 공짜 *피자머신 소환물
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        card_stat_change(target,"방어력",-3)
    }
}




//플레이어 스킬 섹터
if skill_number = 1001
{
    //전술 진압
    give_barrier(owner_id)
    stun_hit(global.skill_target)
}
if skill_number = 1002
{
    //드론 소환: 화력 지원
    summon_card(101,owner_id.is_enemy)
}
if skill_number = 1003
{
    //걸리적거리잖아!
    card_stat_change(owner_id,"신속",10)
}
if skill_number = 1004
{
    //특급송달: 전투지원품
    var target_A = search_skill_location_target(0,false);
    var target_B = search_skill_location_target(2,false);
    var target_C = search_skill_location_target(4,false);

    if !is_undefined(target_A) {card_stat_change(target_A,"방어력",roll_the_dice(6,owner_id))}
    if !is_undefined(target_B) {card_stat_change(target_B,"방어력",roll_the_dice(6,owner_id))}
    if !is_undefined(target_C) {card_stat_change(target_C,"방어력",roll_the_dice(6,owner_id))}
}
if skill_number = 1005
{
    //혼날 시간이에요~♣
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,true)
        continuous_shooting(2,owner_id,target,1,6,true)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"fan_shape",undefined)
}
if skill_number = 2001
{
    //하드보일드 샷
    var left_target = search_skill_extra_target(global.skill_target,-1)
    var right_target = search_skill_extra_target(global.skill_target,1)
    attack_calculation(owner_id,global.skill_target,1,6,false)
    attack_calculation(owner_id,left_target,1,6,false)
    attack_calculation(owner_id,right_target,1,6,false)
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
    var left_target = search_skill_extra_target(global.skill_target,-1)
    var right_target = search_skill_extra_target(global.skill_target,1)
    continuous_shooting(3,owner_id,global.skill_target,1,6,true)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"point",global.skill_target)
    continuous_shooting(3,owner_id,left_target,1,6,true)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"point",left_target)
    continuous_shooting(3,owner_id,right_target,1,6,true)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"point",right_target)
}
if skill_number = 2005
{
    //꿰뚫는 엘레강스
    attack_calculation(owner_id,global.skill_target,1,20,false,true)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"critical",global.skill_target)
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
if skill_number = 3001
{
    //Q.E.D
    give_barrier(global.skill_target)
    card_stat_change(global.skill_target,"도발",10)
}
if skill_number = 3002
{
    //아플 확률이 높아
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,true)
        attack_calculation(owner_id,target,3,6,true)
        instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,target)
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
    stun_hit(global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,12,false)
}
if skill_number = 3005
{
    //후후, 실력을 보여드리죠.
    card_stat_change(global.skill_target,"공격력",roll_the_dice(6,owner_id))
}
if skill_number = 3006
{
    //게임, 스타트!
    var right_target = search_skill_extra_target(global.skill_target,1)
    attack_calculation(owner_id,global.skill_target,1,12,false)
    attack_calculation(owner_id,right_target,1,12,false)
}
if skill_number = 3007
{
    //천둥이 등장
    summon_card(105,owner_id.is_enemy)
}
if skill_number = 4001
{
    //Kyrie Eleison
    mika_attack(owner_id,global.skill_target,12)
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
    stun_hit(owner_id)
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
    attack_calculation(owner_id,global.skill_target,1,6,true)
    give_fire_debuff(global.skill_target)
}
if skill_number = 6001
{
    //참 잘했어요
    if global.skill_target.good_stamp 
    {
        send_log("참 잘했어요!")
        card_stat_change(global.skill_target,"공격력",4)
        global.skill_target.good_stamp = false
    }
    else
    {
        send_log("칭찬도장 꾸욱!")
        card_stat_change(global.skill_target,"공격력",2)
        global.skill_target.good_stamp = true
    }
}
if skill_number = 6002
{
    //나쁜 아이는 어디있나요?
    var target = undefined
    {
        var target_list = obj_GAME_SYSTEM_MANAGER.enemy_list
        var size = ds_list_size(target_list)
        var max_attack_instance = undefined
        var max_attack = 0
        for (var i = 0; i < size; i++)
        {
            if is_undefined(target_list[| i]) {continue;}
            if target_list[| i].is_dead {continue;}
            var target_attack = target_list[| i].attack_power + target_list[| i].additional_attack_power + target_list[| i].volatility_attack_power
            if max_attack < target_attack
            {
                max_attack = target_attack
                max_attack_instance = target_list[|i]
            }
        }
        target = max_attack_instance
    }
    if !is_undefined(target)
    {
        attack_calculation(owner_id,target,1,12,false)
        card_stat_change(target,"공격력",-1)
    }
}
if skill_number = 6003
{
    //나님의 걸작이라고!
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,true);
        give_fire_debuff(target)
    }
}
if skill_number = 7001
{
    //시구레 특제 보틀 그레네이드
    var right_target = search_skill_extra_target(global.skill_target,1)
    attack_calculation(owner_id,global.skill_target,1,6,false)
    attack_calculation(owner_id,right_target,1,6,false)
    give_fire_debuff(global.skill_target)
    give_fire_debuff(right_target)
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
}
if skill_number = 8002
{
    //협상은 없습니다!
    stun_hit(global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,12,true)
}
if skill_number = 8003
{
    //일단은 달콤한 휴식부터
    card_stat_change(owner_id,"공격력",1)
}
if skill_number = 9001
{
    //강철의 비
    var target_A = search_skill_location_target(0,true);
    var target_B = search_skill_location_target(2,true);
    var target_C = search_skill_location_target(4,true);

    continuous_shooting(2,owner_id,target_A,1,12,true)
    give_fire_debuff(target_A)
    continuous_shooting(2,owner_id,target_B,1,12,true)
    give_fire_debuff(target_B)
    continuous_shooting(2,owner_id,target_C,1,12,true)
    give_fire_debuff(target_C)
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
    var target = search_skill_location_target(owner_id.card_position,true);
    attack_calculation(owner_id,target,1,20,false)
    stun_hit(target)
}
if skill_number = 9004
{
    //지원사격 개시!
    var target = search_skill_location_target(owner_id.card_position,true);
    continuous_shooting(3,owner_id,target,1,6,false)
    stun_hit(target)
}
if skill_number = 10001
{
    //Et Omnia Vanitas!
    attack_calculation(owner_id,global.skill_target,1,20,false,true)
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"critical",global.skill_target)
}
if skill_number = 10002
{
    //헛된 세계
    var target_A = search_skill_location_target(1,true);
    var target_B = search_skill_location_target(3,true);

    attack_calculation(owner_id,target_A,1,20,true)
    give_fire_debuff(target_A)
    attack_calculation(owner_id,target_B,1,20,true)
    give_fire_debuff(target_B)
}
if skill_number = 10003
{
    //이것도 나의 힘……?
    var left_target = search_skill_extra_target(owner_id,-1)
    var right_target = search_skill_extra_target(owner_id,1)
    card_stat_change(left_target,"취약",-1)
    card_stat_change(right_target,"취약",-1)
    card_stat_change(left_target,"도발",(owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(12,owner_id))
    card_stat_change(right_target,"도발",(owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(12,owner_id))
}
if skill_number = 10004
{
    //지, 지금 지원할게요!
    var left_target = search_skill_extra_target(global.skill_target,-1)
    var right_target = search_skill_extra_target(global.skill_target,1)
    card_stat_change(left_target,"방어력",-1*roll_the_dice(12,owner_id))
    card_stat_change(global.skill_target,"방어력",-1*roll_the_dice(12,owner_id))
    card_stat_change(right_target,"방어력",-1*roll_the_dice(12,owner_id))
}





//적 스킬 섹터
if skill_number = 1501
{
    //알바의 눈물
    attack_calculation(owner_id,global.skill_target,1,6,false)
}
if skill_number = 1502
{
    //선도부 진압
    var left_target = search_skill_extra_target(owner_id,-1)
    var right_target = search_skill_extra_target(owner_id,1)
    attack_calculation(owner_id,left_target,1,6,false)
    attack_calculation(owner_id,right_target,1,6,false)
}
if skill_number = 1503
{
    //게헨나 회장의 지휘
    attack_calculation(owner_id,global.skill_target,1,12,false)
}
if skill_number = 1504
{
    //만마전 진압
    var left_target = search_skill_extra_target(owner_id,-1)
    var right_target = search_skill_extra_target(owner_id,1)
    attack_calculation(owner_id,left_target,1,6,false)
    attack_calculation(owner_id,right_target,1,6,false)
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
    continuous_shooting(2,owner_id,global.skill_target,1,6,false)
}
if skill_number = 1509
{
    //난사다!!!
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        continuous_shooting(2,owner_id,target,1,6,true)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"fan_shape",undefined)
}

if skill_number = 1510
{
    //헬멧을 썼어야지
    stun_hit(global.skill_target)
    attack_calculation(owner_id,global.skill_target,1,6,false)
}

if skill_number = 1511
{
    //머리깨기
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
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        continuous_shooting(3,owner_id,target,1,6,true)
        instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"mystic",target)
    }
}
if skill_number = 1518
{
    //비명
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)*roll_the_dice(6,owner_id);
        card_stat_change(target,"방어력",-value)
    }
    
}
if skill_number = 1519
{
    //정의실현
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        attack_calculation(owner_id,target,1,12,false)
    }
}
if skill_number = 1520
{
    //자비
    var target_A = search_skill_location_target(0,owner_id.is_enemy);
    var target_B = search_skill_location_target(1,owner_id.is_enemy);
    var target_C = search_skill_location_target(2,owner_id.is_enemy);

    if !is_undefined(target_A) {card_stat_change(target_A,"취약",-1)}
    if !is_undefined(target_B) {card_stat_change(target_B,"취약",-1)}
    if !is_undefined(target_C) {card_stat_change(target_C,"취약",-1)}
}
if skill_number = 1521
{
    //불장난
    var target_A = search_skill_location_target(0,!owner_id.is_enemy);
    var target_B = search_skill_location_target(2,!owner_id.is_enemy);
    var target_C = search_skill_location_target(4,!owner_id.is_enemy);

    attack_calculation(owner_id,target_A,1,6,false)
    give_fire_debuff(target_A)
    instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,target_A)
    attack_calculation(owner_id,target_B,1,6,false)
    give_fire_debuff(target_B)
    instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,target_B)
    attack_calculation(owner_id,target_C,1,6,false)
    give_fire_debuff(target_C)
    instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,target_C)
}
if skill_number = 1522
{
    //로켓장난
    var target_A = search_skill_location_target(1,!owner_id.is_enemy);
    var target_B = search_skill_location_target(3,!owner_id.is_enemy);

    attack_calculation(owner_id,target_A,1,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,target_A)
    attack_calculation(owner_id,target_B,1,12,false)
    instance_create_v(owner_id.x,owner_id.y,obj_missile,owner_id,target_B)
}
if skill_number = 1523
{
    //무지성난사
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        continuous_shooting(2,owner_id,target,1,12,false)
    }
    instance_create_v(owner_id.x,owner_id.y,obj_battle_bullet_effect_animation,owner_id,"fan_shape",target)
}
if skill_number = 1524
{
    //기계적 조준
    continuous_shooting(2,owner_id,global.skill_target,1,12,false)
}
if skill_number = 1525
{
    //기계적 점사
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
    for (var i = 0; i < 5; i++)
    {
        var target = search_skill_location_target(i,owner_id.is_enemy)
        card_stat_change(target,"공격력",1)
    }
}
if skill_number = 1528
{
    //전술 판단
    for (var i = 0; i < 5; i++)
    {
        var target = search_skill_location_target(i,owner_id.is_enemy)
        card_stat_change(target,"방어력",roll_the_dice(12,owner_id))
    }
}
if skill_number = 1529
{
    //장군의 위엄
    for (var i = 0; i < 5; i++)
    {
        var target = search_skill_location_target(i,owner_id.is_enemy)
        card_stat_change(target,"숙련도",4)
    }
}
if skill_number = 1530
{
    //역장
    give_barrier(owner_id)
}





//총력전 보스 스킬 섹터 
if skill_number = 2501
{
    //외접
    var target_A = search_skill_location_target(0,!owner_id.is_enemy);
    var target_B = search_skill_location_target(4,!owner_id.is_enemy);

    attack_calculation(owner_id,target_A,1,12,false)
    attack_calculation(owner_id,target_B,1,12,false)
}
if skill_number = 2502
{
    //내접
    var target_A = search_skill_location_target(1,!owner_id.is_enemy);
    var target_B = search_skill_location_target(2,!owner_id.is_enemy);
    var target_C = search_skill_location_target(3,!owner_id.is_enemy);

    attack_calculation(owner_id,target_A,1,12,false)
    attack_calculation(owner_id,target_B,1,12,false)
    attack_calculation(owner_id,target_C,1,12,false)
}
if skill_number = 2503
{
    //한점에서 만남
    continuous_shooting(2,owner_id,global.skill_target,1,12,false)
}
if skill_number = 2504
{
    //굴러오는 공
    card_stat_change(owner_id,"공격력",1)
}
if skill_number = 2505
{
    //공굴러가유~
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        var value = (owner_id.attack_power + owner_id.additional_attack_power + owner_id.volatility_attack_power)
        card_stat_change(target,"취약",value)
    }
}
if skill_number = 2506
{
    //슬럼피아의 공포
    var target = undefined
    {
        var target_list = obj_GAME_SYSTEM_MANAGER.player_list
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
    var target_A = search_skill_location_target(1,!owner_id.is_enemy);
    var target_B = search_skill_location_target(3,!owner_id.is_enemy);

    attack_calculation(owner_id,target_A,1,12,false)
    attack_calculation(owner_id,target_B,1,12,false)
}
if skill_number = 2508
{
    //범퍼카 돌진이다-!!!
    var target_A = search_skill_location_target(0,!owner_id.is_enemy);
    var target_B = search_skill_location_target(2,!owner_id.is_enemy);
    var target_C = search_skill_location_target(4,!owner_id.is_enemy);

    attack_calculation(owner_id,target_A,1,12,false)
    attack_calculation(owner_id,target_B,1,12,false)
    attack_calculation(owner_id,target_C,1,12,false)
}
if skill_number = 2509
{
    //아칠루트의 빛
    continuous_shooting(2,owner_id,global.skill_target,1,20,false)
}
if skill_number = 2510
{
    //공의의 불꽃
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
        attack_calculation(owner_id,target,1,12,false)
    }
}
if skill_number = 2511
{
    //정화의 폭풍
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
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
    for (var i = 0; i < number_of_enemy; i++)
    {
        var target = search_skill_location_target(i,!owner_id.is_enemy)
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
    send_log("아무일도 일어나지 않았다...",true)
}
if skill_number = 503
{
    //소환 테스트
    summon_card(90002,owner_id.is_enemy)
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


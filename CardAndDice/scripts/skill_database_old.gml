/*skill_info_map = ds_map_create()

//0번스킬
var skill_number = 0
var skill_name = "휴식"
var skill_icon = spr_skill_icon_rest
var skill_description = "차례를 한번 건너 뛴다."
var passive_skill = false
var is_targeting_skill = false

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))


//1번스킬
var skill_number = 1
var skill_name = "기본 공격"
var skill_icon = spr_skill_icon_basic_attack
var skill_description = "(공격력)*d6로 1회 공격한다."
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))
    
//2번스킬
var skill_number = 2
var skill_name = "하드보일드 샷"
var skill_icon = spr_skill_icon_hardboiled_shot
var skill_description = "(공격력)*d6로 선택한 대상과 그 양옆을 1회 공격한다."
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//3번스킬
var skill_number = 3
var skill_name = "아플 확률이 높아"
var skill_icon = spr_skill_icon_hardboiled_shot
var skill_description = "2d6로 적 전체에게 각각 1회 공격한다."
var passive_skill = false
var is_targeting_skill = false

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//4번스킬
var skill_number = 4
var skill_name = "우아하게, 제거합니다."
var skill_icon = spr_skill_icon_stat_down
var skill_description = "취약을 2 부여한뒤 1의 데미지를 준다."
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//여기 이후로 아이콘 최신화 필요
//5번스킬
var skill_number = 5
var skill_name = "전술방패 전개"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "자신의 도발 수치를 30 증가시킨다."
var passive_skill = false
var is_targeting_skill = false

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//6번스킬
var skill_number = 6
var skill_name = "잠이 보약"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "자신의 취약을 2 제거한다."
var passive_skill = false
var is_targeting_skill = false

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//7번스킬
var skill_number = 7
var skill_name = "드론소환: 화력지원"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "대상에게 각각 1d6의 데미지로 6번 공격한다."
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//8번스킬
var skill_number = 8
var skill_name = "전술 진압"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "대상에게 각각 1d6의 데미지로 4번 공격한뒤 방어력을 20 얻는다."
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//9번스킬
var skill_number = 9
var skill_name = "걸리적거리잖아!"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "자신의 신속 수치를 10 증가시킨다. (턴소모 없음)"
var passive_skill = false
var is_targeting_skill = false

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//10번스킬
var skill_number = 10
var skill_name = "혼날 시간이에요~♧"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "1d6로 적 전체에 2번 공격한다."
var passive_skill = false
var is_targeting_skill = false

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//11번스킬
var skill_number = 11
var skill_name = "특급송달: 전투지원품"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "대상과 그 양옆의 취약을 1제거한다."
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//12번스킬
var skill_number = 12
var skill_name = "작렬의 세레나데"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "대상에게 (공격력)d12 데미지와 그 양옆에게 3d6의 데미지를 줍니다."
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))













//1000번스킬
var skill_number = 1000
var skill_name = "버프 테스트 스킬"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "대상의 모든 스텟 +1 버프"
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

//1001번스킬
var skill_number = 1001
var skill_name = "디버프 테스트 스킬"
var skill_icon = spr_skill_icon_stat_down
var skill_description = "대상의 모든 스텟 -1 버프"
var passive_skill = false
var is_targeting_skill = true

ds_map_add_list(skill_info_map,skill_number,
skill_datalist(skill_number,skill_name,skill_icon,skill_description,passive_skill,is_targeting_skill))

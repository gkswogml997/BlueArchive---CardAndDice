if instance_number(obj_board_graph_vertex) > 1
{
    //이전노드 찾기
    var present_node = obj_player_piece.on_vertex
    var previous_node = undefined
    for(var i = 0; i < ds_list_size(present_node.g_vertex); i++)
    {
        if present_node.g_vertex[| i].type = platform_type.Nothing
        {
            if present_node.g_vertex[| i].id != present_node.id {previous_node = present_node.g_vertex[| i]}
        }
    }
    
    //갭 계산
    var prv_x = previous_node.x
    var prv_y = previous_node.y
    var x_gap = previous_node.x - present_node.x
    var y_gap = previous_node.y - present_node.y
    
    //버택스 전체에 이동 명령
    obj_board_graph_vertex.x_gap = x_gap
    obj_board_graph_vertex.y_gap = y_gap
    with(obj_board_graph_vertex){
        x += x_gap
        y += y_gap
    }
    obj_board_graph_vertex.x_gap = 0
    obj_board_graph_vertex.y_gap = 0
    
    //자리 중앙으로
    obj_player_piece.x = prv_x
    obj_player_piece.y = prv_y
    present_node.x = prv_x
    present_node.y = prv_y
}else //최초생성시
{
    obj_player_piece.on_vertex.x = room_width/2
    obj_player_piece.on_vertex.y = room_height/2
    obj_player_piece.x = room_width/2
    obj_player_piece.y = room_height/2
}

if !global.chaos_mode
{
    //진행도 구간 설정
    var number_of_node = 7
    
    global.passing_node += 1
    obj_camera.camera_zoom_in = true
    
    switch global.passing_node
    {
        case 11:
            global.progress = 1
            instance_create(x,y,obj_progress_UI)
            break;
        case 18:
            global.progress = 2
            instance_create(x,y,obj_progress_UI)
            break;
        case 23:
            global.progress = 3
            instance_create(x,y,obj_progress_UI)
            break;
    }
    
    //새 버택스 제작
    switch global.progress
    {
        case 0:
            break;
        case 1:
            number_of_node = 5
            break;
        case 2:
            number_of_node = 3
            break;
        default:
            number_of_node = 1
    }
    
    for (var i = 0; i < number_of_node; i++)
    {
        var target = instance_create(obj_player_piece.x-(150*(number_of_node div 2))+(150*i),obj_player_piece.y-300,obj_board_graph_vertex)
        instance_create_v(x,y,obj_board_graph_edge,obj_player_piece.on_vertex,target)
    }
}else{
    //카오스 모드
    global.passing_node += 1
    obj_camera.camera_zoom_in = true
    var target = instance_create(obj_player_piece.x+choose(150,0,-150),obj_player_piece.y-300,obj_board_graph_vertex);
    target.type = platform_type.Battle;
    instance_create_v(x,y,obj_board_graph_edge,obj_player_piece.on_vertex,target)
}

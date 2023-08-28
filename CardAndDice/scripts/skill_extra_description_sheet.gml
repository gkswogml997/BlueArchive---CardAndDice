skill_extra_description_sheet_map = ds_map_create()

//파일
var json_file = file_text_open_read("skill_extra_description_sheet.json")
var data = ""

//json 읽기
while !file_text_eof(json_file){
    data += file_text_read_string(json_file)
    file_text_readln(json_file)
}
file_text_close(json_file)

//json 디코딩
skill_extra_description_sheet_map = json_decode(data);

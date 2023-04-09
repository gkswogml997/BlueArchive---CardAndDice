var character_number = argument0
var target = obj_GAME_SYSTEM_MANAGER.character_sheet_map
var character_sheet_map;

if ds_map_exists(target,string(character_number)) {character_sheet_map = ds_map_find_value(target,string(character_number))}
else {character_sheet_map = undefined}

return character_sheet_map

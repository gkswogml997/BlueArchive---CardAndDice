///ds_list_value_destroy(id,value)

var list = argument0
var value = argument1
ds_list_delete(list,ds_list_find_index(list,value))

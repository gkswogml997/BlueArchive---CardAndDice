/// slot_empty(ds_list,list_max)
var target_list = argument0
var list_max = argument1

for(var i = 0; i < list_max; i++)
{
    if !is_undefined(target_list[|i]) {
        if !target_list[|i].is_dead {return false}
    }
}

return true

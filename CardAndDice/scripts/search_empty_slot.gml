/// search_empty_card_slot(ds_list,list_max)
var target_list = argument0
var list_max = argument1

for(var i = 0; i < list_max; i++)
{
    if target_list[|i] = undefined {return i}
}

return undefined

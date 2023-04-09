var list = argument0

for (var i = 0; i < ds_list_size(list); i++)
{
    instance_destroy(list[|i])
}

ds_list_destroy(list)

function get_collision_ds_list() {
    if (!variable_instance_exists(id, "collisionList") || !ds_exists(collisionList, ds_type_list)) {
        collisionList = ds_list_create();
	}
    if (!ds_list_empty(collisionList)) {
        ds_list_clear(collisionList);
	}   
    return collisionList;
}
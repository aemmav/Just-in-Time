
if(instance_exists(obj_player)){
if(place_meeting(x, y, obj_player) && obj_player.is_grappling) instance_destroy(obj_lasso)
}
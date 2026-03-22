if(my_line == 0){

var _line = instance_create_layer(x, y, "ProjectileLayer", obj_dotted_line)
_line.sprite_index = spr_dotted_line
_line.target = obj_player
_line.origin = self
_line.width_change_x = 1
_line.width_change_y = 1.5
_line.image_speed = 0
my_line = _line

//show_message("i've made my line!")

}



if(instance_exists(my_line)){



my_line.tension_amt = distance_to_object(obj_player)


}

if(distance_to_object(obj_player) > max_range) instance_destroy()

if(place_meeting(x, y, obj_wall) && obj_latch == 0) instance_destroy()

x += hsp
y += vsp

if(!is_latched_onto_hook){
	

grv_fall_points ++
if(grv_fall_points >= grv_fall_max_point){
	vsp += grv
	image_angle -= hsp
}
	
range ++
if(range >= max_range) instance_destroy()
}



if(obj_latch != 0){


// penalize time if the player has more than 5 seconds left
// make quick decisions!


x = obj_latch.x+stuck_offset_x;
y = obj_latch.y+stuck_offset_y;

//if(obj_latch.hp <= 0) instance_destroy()
if(!instance_exists(obj_latch)) instance_destroy()

}



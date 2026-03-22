if(!is_latched_onto_hook && obj_latch == 0){

	//scr_screen_shake(5, 2)
	hsp = 0
	vsp = 0
	obj_latch = other
	if(x > obj_player.x)  is_farther = 1
	else is_farther = 0
	if(y > obj_player.y)  is_under = 1
	else is_under = 0
	
	/*
	var _sparkle = instance_create_layer(x, y, "Particle_Layer", obj_spawn_flash);
	_sparkle.sprite_index = spr_spawn_flash;
	_sparkle.color = c_white;
	_sparkle.image_speed = 1.5;
	_sparkle.image_angle = image_angle + 90;
	_sparkle.image_xscale = 0.2 * 3;
	_sparkle.image_yscale = 0.5 * 3;
	_sparkle.obj_follow = self;
	*/
	
	
	
	
	
	alarm[0] = 1	
	

	
	is_latched_onto_hook = true
	




}

if(other == obj_latch){
stuck_offset_x = (x-other.x);
stuck_offset_y = (y-other.y);
}
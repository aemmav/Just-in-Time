event_inherited()


rotation = fake_rot * anim_direction

animAddAnim("IDLE", anim_direction, image_yscale, 1, 0, 3)


animAddFiniteAnim("ATTACK", anim_direction, image_yscale, 1, 0, 3, 0)

animAddAnim("STUN", anim_direction, image_yscale, 1, 4, 4)


if (place_meeting(x + hsp, y, obj_wall)) {
	
	
	if(!place_meeting(x + hsp, y - abs(hsp) -1 , obj_wall))
	{
		while(place_meeting(x + hsp, y + 1, obj_wall) ) { y -= 0.5;};
	}
	
	else
	{
	
		while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
		}

		hsp = 0;
	}
}
	
//} 

// all of these used to check obj_wall
//else {

        x += hsp
//}

if (place_meeting(x, y + vsp, obj_wall)) {
    var _onepixel = sign(vsp);
    while (!place_meeting(x, y + _onepixel, obj_wall))
	{
		
	y += _onepixel;
	}

    vsp = 0;
} 
y += vsp

if (instance_exists(obj_player)) { // Check if player is in room
	pdir = point_direction(x, y, obj_player.x, obj_player.y)
	pdis = point_distance(x, y, obj_player.x, obj_player.y)
	
	
	

	
	
	
	if place_meeting(x+hsp, y, obj_solid_collision_parent) {
		// if it runs into a wall, it goes the other way





		hsp *= -1
		_temphsp *= -1
			
	if(place_meeting(bbox_right, y, obj_solid_collision_parent)){
		
		
		//show_message("fih")
		
		anim_direction = -1
		
	}
	
	if(place_meeting(bbox_left, y, obj_solid_collision_parent)){
		
		anim_direction = 1
		
	}
	
		
	}
	
	// while the fish is in the air, gravity applies
	if (!is_in_water) {
		vsp += grav
		animSet("ATTACK")
		esc_water_frames--
		if(place_meeting(x, y, obj_water) && !esc_water_frames) {
		
		
		
		my_water = instance_place(x, y, obj_water)
		
		hsp = sign(hsp)*base_hsp
		is_in_water = true
		audio_play_sound(water_splash,14,false)
	
		}
		
		
		if(place_meeting(x, y + vsp, obj_wall)){
		
		
		vsp = -4
		fake_rot += irandom_range(180, 360)
		
		}
		
		
	}
	else{
		// checks if the player is above the fish in a radius between 80 and 100 degrees
	if(pdir > 45 && pdir < 135 && cooldown <= 0 && pdis < 100 && collision_line(x, y, x, y-100, obj_player, false, true) && !collision_line(x, y, x, y-100, obj_wall, false, true) && is_in_water ) { 
		
		
		esc_water_frames = esc_water_frames_max
		my_water = 0
		is_in_water = false

		//show_message("i am out of the water")
		// causes the fish to jump up
		_x1 = obj_player.x + obj_player.hsp
		_y1 = obj_player.y + obj_player.vsp
		_angle = point_direction(x, y, _x1, _y1)
		hsp = jump_speed * cos(radtodeg(_angle))
		
		//show_message(_angle)
		fake_rot = _angle
		

		vsp = -2 + (-1 * jump_speed * abs(sin(radtodeg(_angle))))
		
		
	
		
		//show_message(vsp)
		// resets the cooldown so the fish doesn't jump again right away
		cooldown = cooldown_max
    }	
		if(my_water == 0) {
		is_in_water = false
		}
		else 
		{
			y = my_water.y + 16
			cooldown--
			fake_rot = 0
			vsp = 0;
		}
		
		
		animSet("IDLE")
	
		
	}
}


if(stunned) animSet("STUN")


animStep()

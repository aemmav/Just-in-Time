event_inherited()

animAddAnim("IDLE", -anim_direction, image_yscale, 1, 7, 9)
animAddAnim("ATTACKING", -anim_direction, image_yscale, 1, 0, 6)
animAddAnim("WALKING", -anim_direction, image_yscale, 1, 6, 10)


	x += hsp
	y += vsp


cooldown--

if stunned cooldown = cooldown_max


if(hsp >= 0) anim_direction = 1
else anim_direction = -1


if (instance_exists(obj_player)) {
	pdir = point_direction(x, y, obj_player.x, obj_player.y)
	
	
	
	
	
	// Checks if the enemy is facing the player
	
	
		_sees_player = pdir > 135 && pdir < 270
	
	
	
	if (place_meeting(x+hsp, y, obj_solid_collision_parent) ) {
		 hsp *= -1
		 _temphsp *= -1
		 
		 
		 // temphsp is for remembering the speed you were at before getting stunned
	//	 image_xscale *= -1
	//	 if (image_xscale > 0) {
		//	 x -= 32 // Corrects for the movement caused by flipping the image
		 ///}
		// else {
			// x += 32
		// }
	}
	
	
	
	
	// Short delay before shooting

	if(_sees_player && cooldown <= 0 && collision_line(x,y,obj_player.x,obj_player.y-16, obj_player, false,true) &&  !collision_line(x, y, obj_player.x, obj_player.y-5, obj_wall, false, true) && !stunned){
		if (shoot_cooldown <= 0) {
			var _bullet = instance_create_layer(x, y, "Collision", obj_bullet)
			_bullet.belongs_to_enemy = true;
			_bullet.image_angle = pdir
			_bullet.direction = pdir
			_bullet.max_size = 30
			_bullet.speed = 7+abs(hsp)
			cooldown = cooldown_max
			isShooting = false
			shoot_cooldown = 15
		}
		else {
			isShooting = true
			shoot_cooldown--
		}
		
	}
}

animStep()
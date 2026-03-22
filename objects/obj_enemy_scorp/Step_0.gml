event_inherited()

x += hsp
y += vsp

cooldown--

if stunned cooldown = cooldown_max


if (instance_exists(obj_player)) {
	pdir = point_direction(x, y, obj_player.x, obj_player.y)
	// Checks if the enemy is facing the player
	if (image_xscale > 0) {
		_sees_player = pdir > 315 || pdir < 45
	}
	else {
		_sees_player = pdir > 135 && pdir < 270
	}
	
	
	if (place_meeting(x+hsp, y, obj_solid_collision_parent) || place_meeting(x+hsp-32, y, obj_solid_collision_parent)) {
		 hsp *= -1
		 _temphsp *= -1
		 image_xscale *= -1
		 if (image_xscale > 0) {
			 x -= 32
		 }
		 else {
			 x += 32
		 }
	}

	if(_sees_player && cooldown <= 0 && collision_line(x,y,obj_player.x,obj_player.y-16, obj_player, false,true) &&  !collision_line(x, y, obj_player.x, obj_player.y-5, obj_wall, false, true) && !stunned){
		var _bullet = instance_create_layer(x, y, "Collision", obj_bullet)
		_bullet.belongs_to_enemy = true;
		_bullet.image_angle = pdir
		_bullet.direction = pdir
		_bullet.max_size = 30
		_bullet.speed = 7+abs(hsp)
		cooldown = cooldown_max
	}
}
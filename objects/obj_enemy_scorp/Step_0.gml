event_inherited()

x += hsp
y += vsp

cooldown--


if (instance_exists(obj_player)) {
	if (place_meeting(x+hsp, y, obj_solid_collision_parent) || place_meeting(x+hsp-32, y, obj_solid_collision_parent)) {
		 hsp *= -1
	}


	if(cooldown <= 0 && collision_line(x,y,obj_player.x,obj_player.y-16, obj_player, false,true) &&  !collision_line(x, y, obj_player.x, obj_player.y-5, obj_wall, false, true)){
		var _bullet = instance_create_layer(x, y, "Collision", obj_bullet)
		_bullet.belongs_to_enemy = true;
		pdir = point_direction(x, y, obj_player.x, obj_player.y-10)
		_bullet.image_angle = pdir
		_bullet.direction = pdir
		_bullet.max_size = 30
		_bullet.speed = 7+abs(hsp)
		cooldown = cooldown_max
	}
}
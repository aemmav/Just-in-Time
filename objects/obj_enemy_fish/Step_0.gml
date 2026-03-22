x += hsp
y += vsp

cooldown--

if (instance_exists(obj_player)) { // Check if player is in room
	pdir = point_direction(x, y, obj_player.x, obj_player.y)
	pdis = point_distance(x, y, obj_player.x, obj_player.y)
	
	if((pdir > 80 || pdir < 100) && cooldown <= 0 && pdis < 100 && collision_line(x, y, x, y-100, obj_player, false, true) && !collision_line(x, y, x, y-100, obj_wall, false, true) ) { 
		_x1 = obj_player.x + obj_player.hsp
		_y1 = obj_player.y + obj_player.vsp
		_angle = point_direction(x, y, _x1, _y1)
	
		hsp = jump_speed * cos(radtodeg(_angle))
		vsp = jump_speed * -sin(radtodeg(_angle))
		cooldown = cooldown_max
    }else if place_meeting(x+hsp, y, obj_solid_collision_parent) {
		hsp *= -1
	}

}

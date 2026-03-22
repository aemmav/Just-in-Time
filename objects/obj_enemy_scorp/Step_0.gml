x += hsp
y += vsp


if (place_meeting(x+hsp, y, obj_solid_collision_parent) || place_meeting(x+hsp-32, y, obj_solid_collision_parent)) {
	 hsp *= -1
}

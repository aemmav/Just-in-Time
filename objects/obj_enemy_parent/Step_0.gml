hsp = move_speed * dir
vsp += grav

move_and_collide(hsp, 0, obj_solid_parent)

if place_meeting(x+dir, y, obj_solid_parent) {
	dir *= -1
}

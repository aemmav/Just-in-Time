speed = 15
image_xscale = 10
max_size = 0
size_inc = 10
direction = point_direction(x, y, mouse_x, mouse_y)
place_meet_x = 0
place_meet_y = 0


has_init = true
destroy_imm = false
if(place_meeting(x, y, obj_wall)) {
	
	
	
	destroy_imm = true
}
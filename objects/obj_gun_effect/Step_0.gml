




if(instance_exists(obj_player)){
	
hsp = obj_player.hsp
vsp = obj_player.vsp
	
x += hsp
y += vsp
}

if(is_spinning){


if(rot_speed < 50) rot_speed += rot_accel
image_angle += rot_speed

}
else{
	display_frames --

if(display_frames <= 0) instance_destroy()

}





if(instance_exists(obj_player)){
	
hsp = obj_player.hsp
vsp = obj_player.vsp
	
x += hsp
y += vsp
}

if(is_spinning){


if(rot_speed < 50) rot_speed += rot_accel
image_angle += rot_speed


if(rot_speed >= 20){


if(afterimage_timer % afterimage_timer_max == 0){


var _image = instance_create_layer(x, y, "ParticleLayer", obj_temp_effect)
_image.sprite = spr_gun_arm
_image.image_angle = image_angle
_image.image_xscale = image_xscale
_image.image_yscale = image_yscale
_image.delete_on_finish = false
_image.image_index = 1

}

afterimage_timer ++

}

}
else{
	display_frames --

if(display_frames <= 0) instance_destroy()

}
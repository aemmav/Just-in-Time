image_angle = point_direction(x,y,mouse_x, mouse_y);
//image_angle += sin(degtorad(pointdir - image_angdle)) * 50;
point_dir = image_angle;
dir = direction;

var _x = obj_player.x 
var _y = obj_player.y - 12

  


var _point_dir = point_dir






	



var _shoot_button_pressed = mouse_check_button_pressed(mb_left);

var _gun_spin_button_pressed = keyboard_check_pressed(vk_control)

var _gun_spin_button_released = keyboard_check_released(vk_control)


var _gun_length = 10
var _x2 = x + lengthdir_x(_gun_length, image_angle)
var _y2 = y + lengthdir_y(_gun_length, image_angle)






if(_shoot_button_pressed){


var _bullet = instance_create_layer(_x+ 45 * cos(degtorad(point_dir)), _y - 45 * sin(degtorad(point_dir)), "Collision", obj_bullet)
_bullet.image_angle = point_dir
_bullet.direction = point_dir
_bullet.image_xscale = 40

var _gun_yscale = 1


if(obj_player.x > mouse_x + 20)
	{
		_gun_yscale = -1

	}
	


instance_destroy(obj_gun_effect)

var _gun_effect = instance_create_layer(_x + 20 * cos(degtorad(point_dir)), _y - 20 * sin(degtorad(point_dir)), "PlayerLayer", obj_gun_effect)


_gun_effect.image_yscale = _gun_yscale	


_gun_effect.image_angle = point_dir

_gun_effect.hsp = obj_player.hsp
_gun_effect.vsp = obj_player.vsp
	
	
}


if(_gun_spin_button_pressed){
	

if(!instance_exists(obj_gun_effect)){

	var _gun_yscale = 1


if(obj_player.x > mouse_x + 20)
	{
		_gun_yscale = -1

	}
	

var _gun_effect = instance_create_layer(_x + 20 * cos(degtorad(point_dir)), _y - 20 * sin(degtorad(point_dir)), "PlayerLayer", obj_gun_effect)


_gun_effect.image_yscale = _gun_yscale	


_gun_effect.image_angle = point_dir

_gun_effect.hsp = obj_player.hsp
_gun_effect.vsp = obj_player.vsp
_gun_effect.is_spinning = true
}



	
	
}

if(_gun_spin_button_released && instance_exists(obj_gun_effect)){



var _bullet = instance_create_layer(_x+ 45 * cos(degtorad(point_dir)), _y - 45 * sin(degtorad(point_dir)), "Collision", obj_bullet)
_bullet.image_angle = point_dir
_bullet.direction = point_dir
_bullet.image_xscale = 40

var _gun_yscale = 1


if(obj_player.x > mouse_x + 20)
	{
		_gun_yscale = -1

	}
	


instance_destroy(obj_gun_effect)

var _gun_effect = instance_create_layer(_x + 20 * cos(degtorad(point_dir)), _y - 20 * sin(degtorad(point_dir)), "PlayerLayer", obj_gun_effect)


_gun_effect.image_yscale = _gun_yscale	


_gun_effect.image_angle = point_dir

_gun_effect.hsp = obj_player.hsp
_gun_effect.vsp = obj_player.vsp

}
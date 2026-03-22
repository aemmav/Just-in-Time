image_angle = point_direction(x,y,mouse_x, mouse_y);
if(instance_exists(obj_aim)) 
{ 

//image_angle += sin(degtorad(pointdir - image_angdle)) * 50;
point_dir = image_angle
dir = direction;

var _x = obj_player.x 
var _y = obj_player.y - 12

var _gun_disp_x = _x + 20 * cos(degtorad(point_dir))
var _gun_disp_y = _y - 20 * sin(degtorad(point_dir))







var _point_dir = point_dir






	



var _shoot_button_pressed = mouse_check_button_pressed(mb_left)

var _shoot_button_release = mouse_check_button_released(mb_left)

var _gun_spin_button_pressed = keyboard_check_pressed(vk_control)

var _gun_spin_button_released = keyboard_check_released(vk_control)

var _grapple_key = keyboard_check_pressed(ord("Q"))
var _grapple_held = keyboard_check(ord("Q"))

var _gun_length = 10
var _x2 = x + lengthdir_x(_gun_length, image_angle)
var _y2 = y + lengthdir_y(_gun_length, image_angle)


if(_grapple_key && !obj_player.is_locked){
	
	instance_destroy(obj_lasso)
	var _grapple_hook = instance_create_layer(x + cos(degtorad(image_angle)) * 9, y -sin(degtorad(image_angle)) * 9, "ProjectileLayer", obj_lasso)
	_grapple_hook.hsp = cos(degtorad(image_angle)) * ( 8 + abs(obj_player.hsp)/1.5)
	_grapple_hook.vsp = -sin(degtorad(image_angle)) * 8
	_grapple_hook.image_angle = image_angle
	
		
	}
	
	if(instance_exists(obj_lasso)){
	
	if(!_grapple_held && !_grapple_key && obj_lasso.obj_latch != 0){
	
	if(!obj_player.is_locked) obj_player.is_grappling = true
	
	}
	
	
	}



if(_shoot_button_release){

if(instance_exists(obj_gun_effect) && gun_spin_amt >= gun_spin_max){
	
	if(instance_exists(obj_gun_effect)){



var _bullet = instance_create_layer(_x+ 15 * cos(degtorad(point_dir)), _y - 15 * sin(degtorad(point_dir)), "ProjectileLayer", obj_bullet)
_bullet.image_angle = point_dir
_bullet.direction = point_dir
_bullet.max_size = 30

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
	
	
gun_spin_amt = 0
}

else{
var _bullet = instance_create_layer(_x+ 15 * cos(degtorad(point_dir)), _y - 15 * sin(degtorad(point_dir)), "ProjectileLayer", obj_bullet)
_bullet.image_angle = point_dir
//_bullet.direction = point_dir


_bullet.max_size = 30

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
}


if(_shoot_button_pressed){
	

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

else obj_gun_effect.is_spinning = true

gun_spin_amt ++

	
	
}

}
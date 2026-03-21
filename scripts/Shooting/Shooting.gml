function shoot_gun(){
	
	if(instance_exists(obj_player_arm) && instance_exists(obj_player)){
	var _bullet = instance_create_layer(_x+ 20 * cos(degtorad(point_dir)), _y - 20 * sin(degtorad(point_dir)), "Collision", obj_bullet)
_bullet.image_angle = point_dir
_bullet.direction = point_dir
_bullet.image_xscale = 15

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
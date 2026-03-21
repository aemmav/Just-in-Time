/*
if(instance_exists(obj_controller & instance_exists(obj_player))){
switch(global.cur_display_arm){

case "Lasso":


cur_sprite = spr_lasso_arm

break

case "Gun":

cur_sprite = spr_gun_arm

break


}


anim_dir = obj_player.anim_dir

var _x = obj_player.x 
var _y = obj_player.y - 20

  


var _point_dir = point_dir



if(obj_player.x > mouse_x + 20)
	{
		image_yscale = -1
		//_x -= 20
	}
	else 
	{
	
		image_yscale = 1
		//_x += 20
	}



	

	
draw_sprite_ext(cur_sprite, 0, _x, _y, image_xscale, image_yscale, _point_dir, c_white, 1)
}
*/


var _x = obj_player.x 
var _y = obj_player.y - 12

x = _x
y = _y

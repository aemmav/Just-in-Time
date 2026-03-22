var _origin = origin
var _x_orig = origin.x
var _y_orig = origin.y

if(inc_width) width_inc +=  delta_width// 0.075
switch(origin.object_index)
{

case obj_player:



break





}

var _target = target
/*
if(!has_shown_target){
	show_message(target)
	has_shown_target = true
}
*/
var _x_dest = _target.x
var _y_dest = _target.y


switch(_target.object_index){

case obj_player:

_y_dest -= 15

break




}



x = _x_orig
y = _y_orig
if(_target != noone){
var _angle = point_direction(_x_orig, _y_orig, _x_dest, _y_dest)
var _width = sprite_width


for(var _i = 0; distance_to_point(_x_dest, _y_dest) > (_i * _width); _i++){
	
	
	

	
	
	
	
	draw_sprite_ext(sprite_index, image_index,
	x + lengthdir_x(_i * _width, _angle),
	y + lengthdir_y(_i * _width, _angle),
	
	
	
	
	1 * width_change_x + width_inc, 1 * width_change_y + width_inc/2, _angle, image_blend, image_alpha)
	
		if(tension_amt >= 20){
	
	draw_sprite_ext(sprite_index, image_index,
	x + lengthdir_x(_i * _width, _angle),
	y + lengthdir_y(_i * _width, _angle),
	
	
	
	
	1 * width_change_x + width_inc, 1 * width_change_y + width_inc/2, _angle, c_red, tension_amt/tension_max)	
	
	
	}
	
}
}
else
{
	instance_destroy()
}
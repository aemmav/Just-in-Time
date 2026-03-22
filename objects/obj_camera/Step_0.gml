//if(room == rm_title) instance_destroy()
cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);
halfview_w = camera_get_view_width(view_camera[0])/2;
halfview_h = camera_get_view_height(view_camera[0])/1.5; // used to be 1.3


view_w = camera_get_view_width(view_camera[0]) 
view_h = camera_get_view_height(view_camera[0])

if(instance_exists(obj_main_title)){

following = obj_main_title

}



if(!instance_exists(obj_main_title) && instance_exists(obj_player))
{
	
	following = obj_player
}
		
	if(global.cheat_mode){
	var _wheel = mouse_wheel_down() - mouse_wheel_up()

	if(_wheel != 0){

	_wheel *= 0.1

	var _add_W = view_w * _wheel
	var _add_H = view_h * _wheel

	view_w += _add_W
	view_h += _add_H

	cx -= _add_W/2
	cy -= _add_H/2

	}
	}
	
	



	if(scale_val > 0) scale_val -= abs(scale_val) * 0.1 //0.005
	if(scale_val < 0) scale_val += abs(scale_val) * 0.1 //0.005\
	
	if(abs(scale_val) <= 0.005){
		scale_val = 0
		
	}
	
	

	
	
	var _add_W = view_w * scale_val
	var _add_H = view_h * scale_val

	view_w += _add_W
	view_h += _add_H

	cx -= _add_W/2
	cy -= _add_H/2

	/*
		if(is_resetting && scale_val = 0)
	{
		
			if(is_resetting){
		
	//	view_w = 480
	//	view_h = 270
	////	show_message("goon")	
		is_resetting = false
		
		}
		
	}*/
	
	
	if(is_resetting){
		
	var _val = 0.02
	
	if(view_w > 480 && view_h > 270){
	
	var _val_w = view_w * _val
	var _val_h = view_h * _val
	
	view_w -= _val_w
	view_h -= _val_h

	cx += _val_w/2
	cy += _val_h/2
	
	}
	
	if(view_w < 480 && view_h < 270){
	
	var _val_w = view_w * _val
	var _val_h = view_h * _val
	
	view_w += _val_w
	view_h += _val_h

	cx -= _val_w/2
	cy -= _val_h/2
	
	}
	
	
	if(abs(480 - view_w) <= 5 && abs(270 - view_h) <= 5)
	{
	view_h = 270
	view_w = 480
	is_resetting = false	
	}
	}
	
if(instance_exists(obj_player)){


//if(obj_player.is_stun_locked) halfview_h = camera_set_view_size(view_camera[0], halfview_w/2, halfview_h/2)// camera_get_view_height(view_camera[0])/0.2

}



if(keyboard_check(ord("M"))) clamped = false;




if(following == noone)
{
	show_message("where he go")
	following = obj_player;
	mode = camMode.follow_object;
}

if(mode == "follow_object")
{
	
}
switch(mode)
{
	case camMode.follow_object:
	if(!instance_exists(following)) break;
	lerp_amt = 0;


	
	
	cx = following.x - view_w/2;
	cy = following.y - view_h/1.5;

	cx = clamp(cx,0, room_width - view_w + 10);
	cy = clamp(cy, 0, room_height - view_h - 32);

	
	
//cx= clamp(following.x - view_w/2, 0, room_width - view_w);
//cy = clamp(following.y - halfview_h, 0, room_height - view_h);


var curX = camera_get_view_x(view_camera[0]);

var curY = camera_get_view_y(view_camera[0]);



var newX = lerp(curX, cx, 0.8);
if(instance_exists(obj_player))
{



var newY = 0;


if(obj_player.vsp > 0)
	{
	newY = lerp(curY, cy, 0.05 + abs(obj_player.vsp / 100));
	}
	else
	{
	newY = lerp(curY, cy, 0.05);
	}

if(shaking)
{
newX += random_range(-shake_force, shake_force); // used to be 2
newY += random_range(-shake_force, shake_force);
}

camera_set_view_pos(view_camera[0], newX, newY);
camera_set_view_size(view_camera[0], view_w, view_h)

}



	//*/
	break;
	case camMode.follow_mouse_drag:
	
	break;
	case camMode.follow_mouse_border:
	
	
	if(!point_in_rectangle(mouse_x, mouse_y, cx + (view_w * 0.1), cy + (view_h * 0.1), cx + (view_w * 0.9), cy + (view_h * 0.9)))
	{
		cx = lerp(cx, mouse_x - (view_w/2), 0.05); 
		cy = lerp(cy, mouse_y - (halfview_h), 0.05); 
	}
	
	break;
	
	case camMode.follow_mouse_peek:
	cx = lerp(following.x, mouse_x, 0.2) - (view_w/2);
	cy = lerp(following.y, mouse_y, 0.2) - (halfview_h);
	
	
	break;
	
	case camMode.move_to_follow_target:
	if(!instance_exists(following)) break;

	if(instance_exists(obj_player))
	{

	
	cx = lerp(cx, following.x - (view_w / 2), 0.075); // was initially 0.1
	if(obj_player.vsp > 0)
	{
	cy = lerp(cy, following.y - (halfview_h), 0.05 + abs(obj_player.vsp / 100));
	}
	else
	{
	cy = lerp(cy, following.y - (halfview_h), 0.05);
	}
	}

		
	cx = clamp(cx,0, room_width - view_w + 10);
	cy = clamp(cy, 0, room_height - view_h + 10);
	
	if(point_distance(cx, cy, following.x - (view_w/2) , following.y - (halfview_h)) < 0.5)
	{
		lerp_amt = 0;
		mode = camMode.follow_object;
	}
	camera_set_view_size(view_camera[0], view_w, view_h)
	break;
	
	case camMode.move_to_target:
	cx = lerp(cx, tX - (view_w / 2), 1);
	cy = lerp(cy, tY - (view_h / 2), 1);
	break;
	
	case camMode.fixed:
	cx= clamp(view_w/2, 0, room_width - view_w);
	cy = clamp(halfview_h, 0, room_height - view_h);
	
}

if(!mode = camMode.fixed)
{
if(!boundless)
{
	/*
	if(instance_exists(following))
	{
	cx= clamp(following.x - view_w/2, 0, room_width - view_w);
cy = clamp(following.y - halfview_h, 0, room_height - view_h);


var curX = camera_get_view_x(view_camera[0]);

var curY = camera_get_view_y(view_camera[0]);



var newX = lerp(curX, cx, 1);
var newY = lerp(curY, cy, 1);


camera_set_view_pos(view_camera[0], newX, newY);

	}
	else
	{*/
	if(instance_exists(following))
	{
	
	if(point_distance(cx, cy, following.x - (view_w/2) , following.y - (halfview_h)) < 0.5)
	{
	cx= clamp(following.x - view_w/2, 0, room_width - view_w);
	cy = clamp(following.y - halfview_h, 0, room_height - view_h);
	}
	

	//cx = clamp(cx - view_w/2, 0, room_width - view_w);
	//cy = clamp(cy - halfview_h, 0, room_height - view_h);
	
	}
	//*/
}
}
//*/



if(shaking && mode != camMode.follow_object)
{
	cx += random_range(-shake_force, shake_force); // 2 -> 1 -> 0.5
cy += random_range(-shake_force, shake_force);



camera_set_view_pos(camera, cx, cy);
}
else{

if(mode != camMode.follow_object)
{
camera_set_view_pos(view_camera[0], cx, cy);
}
}
// fixed maps
		
	/*	
switch(rm)
{
	
	case rm_gameroom: mode = camMode.fixed;
	break;
	case rm_title: mode = camMode.fixed;
	break;
	
}	
		








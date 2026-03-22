


_key_left = keyboard_check(ord("A"));
_key_right = keyboard_check(ord("D"));
_key_jump = keyboard_check_pressed(vk_space);
_key_jump_hold = keyboard_check(vk_space);
_key_down = keyboard_check(ord("S"));
key_slide = keyboard_check(vk_control);
key_slide_press = keyboard_check_pressed(vk_control);
key_dash = keyboard_check_pressed(vk_shift);
key_reset = keyboard_check_pressed(ord("R"));
var _key_jump_release = keyboard_check_released(vk_space)

animAddAnim("IDLE", anim_direction, image_yscale, 1, 1, 2)
animAddAnim("FREE_FALLING", anim_direction, image_yscale, 1, 0, 1)
animAddAnim("JUMPING", anim_direction, image_yscale, 1, 1, 8)
animAddAnim("SLIDING", anim_direction, image_yscale, 1, 10, 11)
animAddChainedAnim("SLIDING_INIT", anim_direction, image_yscale, 1, 8, 10, 0, "SLIDING")
animAddAnim("PARRY", anim_direction, image_yscale, 1, 11, 19)
animAddAnim("WALKING", anim_direction, image_yscale, 1, 22, 25)
animAddChainedAnim("WALKING_INIT", anim_direction, image_yscale, 1, 19, 22, 0, "WALKING")


if (!(_key_left && _key_right)) {
    if (_key_left && anim_direction != -1) {
        anim_direction = -1;
    } else if (_key_right && anim_direction != 1) {
        anim_direction = 1;
    }
}




 var hsp_max = hsp_walk;
 
wall_jump_delay = max(wall_jump_delay - 1, 0);
if (wall_jump_delay == 0 && !is_grappling && !is_stun_locked) {
   
    var _dir = (_key_right - _key_left);

    if (abs(hsp) < hsp_max && !is_grappling && !is_stun_locked) {
		if(is_locked){
			
		hsp = 0
		hsp_frac = 0
			
		}
		else if(dash_frames <= 0)
		{
        hsp += _dir * hsp_acc;
		
		
		
		
		
		
		}
		else
		{
			hsp += anim_direction * hsp_acc
			
	
			
			
		}
    }

	
    if (_dir == 0) {
        var _hsp_fric_final = hsp_fric_ground;
        //if(!on_ground) _hsp_fric_final = hsp_fric_air;
        if (!on_ground) _hsp_fric_final = hsp_fric_air;
		if(!dash_frames)
		{
			
			var _fric_approach = _hsp_fric_final
			if(is_stun_locked) _fric_approach = _hsp_fric_final/2
        hsp = Approach(hsp, 0, _fric_approach);
		}
    }




    if (vsp > 0 && !on_ground)

    {
      //  xscale = sign(anim_direction);
   
    }
	


	
	if(!dash_frames)
	{
    if (hsp > 0 && _key_left) {
        hsp = 0;
    } else if (hsp < 0 && _key_right) {
        hsp = 0;
    }
	}
	
	if(!sliding && !dash_frames && on_ground)
	{
		if(abs(hsp) > hsp_walk)
		{
			hsp = hsp_walk * anim_direction + (hsp/3);
			hsp_frac = 0;
		}
	}
	
	
	
	
	
	

    test_hsp = hsp_max;

    //hsp = clamp(hsp, -hsp_max * 1.2, hsp_max * 1.2);
}



if(!instance_exists(obj_lasso)) is_grappling = false

if(is_grappling && instance_exists(obj_lasso)){
	
//	if(instance_exists(obj_lasso)) {
	//	instance_destroy(obj_grapple_magnet)
	//	exit
//	}
	
	if(point_distance(x, y, obj_lasso.x, obj_lasso.y) > 30)
	{
		// decrease time if grappling, but make player invincible

		//invincible = 5
		
		//hsp = (obj_grapple_magnet.x - x) * 0.1
		
		//vsp = (obj_grapple_magnet.y - y) * 0.1
		
		// find angle between player and the hook
		
		
		
		var _costheta = cos(degtorad(point_direction(x,y, obj_lasso.x, obj_lasso.y)))
		var _sintheta = sin(degtorad(point_direction(x,y, obj_lasso.x, obj_lasso.y)))
		
		// weeeee
		if(obj_lasso.x > x) {
			if(hsp < 0) hsp = -0.5
			if(hsp < 12) hsp += _costheta * 0.8
		//	hsp += 0.75
		}
		if(obj_lasso.y > y) {
			if(vsp < 0) vsp = 0
			if(vsp < 10) vsp -= _sintheta * 0.8
		}
		if(obj_lasso.x < x) {
			if(hsp > 0) hsp = 0.5
			if(hsp > -12) hsp +=  _costheta* 0.8
		}
		if(obj_lasso.y < y) {
			if(vsp > 0) vsp = 0
			if(vsp > -10) vsp -= _sintheta* 0.8
		}
		
		
		
		
		
	}
	else{
	
	//invincible = 15
	

	instance_destroy(obj_lasso)	

		
	}
	

	
}





if (on_wall != 0) && (!on_ground) && (_key_jump || early_jump_frames && !is_locked && !is_stun_locked) {

	
	if(stomping) stomping = false;


    wall_jump_delay = wall_jump_delay_max;
    if (place_meeting(bbox_right + (hsp) + 1, y, obj_wall)) {
	
        hsp = -1 * hsp_wjump;
	
			
    } 
	if(place_meeting(bbox_left + hsp - 1, y, obj_wall)) { // used to be 4
		anim_direction *= -1 // you HAVE to make sure the anim_direction matches the direction you want the player to go
				// otherwise, the game will just set the hsp to 0 lolz
        hsp = 1* hsp_wjump;

    }
	
	
	
	jumped_this_airtime = true
	
	
    vsp = vsp_wjump;


	
	
    hsp_frac = 0;
    vsp_frac = 0;
	early_jump_frames = 0;
}





var _grv_final = grv;
var _vsp_max_final = vsp_max;



if (on_wall != 0) && (vsp > 0) && (!stomping) {
	jumpbuffer = 0;
    _grv_final = grv_wall;
    _vsp_max_final = vsp_max_wall;
}


// hold jump to jump higher
if (!_key_jump_hold && (jump_frames) || ((!key_slide && !_key_jump_hold) && bounce_frames))//(vsp < 0) && (!(_key_jump_hold && jump_frames) && !(bounce_frames && key_slide) && !on_ground)  
{


if(!is_grappling && !is_locked){
vsp = max(vsp, -_vsp_max_final / 3);
}
//else vsp = 0
}




if (vsp < 4) {
	if(dash_frames < 5 && !is_grappling)
	{
    vsp += _grv_final;
	}
	else
	{
		vsp += 0;
	}
}




vsp = clamp(vsp, -_vsp_max_final, _vsp_max_final);

if (jumpbuffer > 0) {
    stretch_frames = 15;
    jumpbuffer--;
    if ((_key_jump || early_jump_frames) && !is_grappling && !is_locked && !is_stun_locked) {
   
		
	
		
        yscale = scale_max;
        jumpbuffer = 0;
		if(bounce_frames)
		{
			vsp = vsp_bounce_max;
		}
		else
		{
        vsp = vsp_jump; // if SETTING speed, clear fractional speed
		}
		
		jumped_this_airtime = true
	
		
		
		
		vsp_frac = 0;
		jump_frames = jump_frame_max
    }
}


if(jump_frames) jump_frames --
if(jump_frames) jump_frames --







hsp += hsp_frac;
hsp_frac = frac(hsp);
hsp -= hsp_frac;
vsp += vsp_frac;
vsp_frac = frac(vsp);
vsp -= vsp_frac;




if (place_meeting(x + hsp, y, obj_wall)) {
	
	
	if(!place_meeting(x + hsp, y - abs(hsp) -1 , obj_wall))
	{
		if(vsp >= 0)
		{
			

		while(place_meeting(x + hsp, y + 1, obj_wall) ) { y -= 0.5;};
		
		fucker_message = "case 1";
		
		}
		else
		{
			if((_key_jump || early_jump_frames) && on_ground && !on_wall && abs(hsp) > 3) { vsp -= 2; early_jump_frames = 0;}
		}
	}
	
	else
	{
	
    while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
	fucker_message = "case_3";
    hsp = 0;
    hsp_frac = 0;
	
	}
	}

	
	
//} 

// all of these used to check obj_wall




//else {

    if (!(_key_down && on_ground && (!dash_frames) )) {
        x += hsp
	}
		
		
//}

if (place_meeting(x, y + vsp, obj_wall)) {
    var _onepixel = sign(vsp);
	
	
	
    while (!place_meeting(x, y + _onepixel, obj_wall))
	{
		
	y += _onepixel;
	}
	
	
	
	if(place_meeting(x, bbox_bottom, obj_wall))
	{
	
	
	}
	
    vsp = 0;
    vsp_frac = 0;
	
	
	
} 
	if(dash_frames < 7)
	{
    y += vsp
	}
	
	
	
	
	
	on_ground = place_meeting(x, y + 1, obj_wall);
on_wall = (place_meeting(x + (hsp) + 1, y, obj_wall) || place_meeting(x + (hsp) - 1, y, obj_wall)) && !on_ground ;

if(on_ground){
	
	
	jumpbuffer = 6
	
}

if(iframes){
	iframes--	
}


if(hp <= 0){
	room_restart()	
}


on_ground_cactus = place_meeting(x, y+1, obj_cactus_standing)
on_wall_cactus = (place_meeting(x + (hsp) + 1, y, obj_cactus_standing) || place_meeting(x + (hsp) - 1, y, obj_cactus_standing))

if(on_ground_cactus && iframes==0){
	is_stun_locked = true
	alarm[2] = 10
	hp--
	iframes = iframes_max
	hsp = choose(-4,4)
	vsp = -5
}
if(on_wall_cactus && iframes==0){
	is_stun_locked = true
	alarm[2] = 10
	hp--
	iframes = iframes_max
	hsp = -1*anim_dir*4
}

animStep()	
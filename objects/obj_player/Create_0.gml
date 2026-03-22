

animInit()

instance_create_layer(x, y, "PlayerLayer", obj_player_arm)
instance_create_layer(x, y, "PlayerLayer", obj_aim)

anim_direction = 1;

animAddAnim("IDLE", anim_direction, image_yscale, 1, 1, 2)
animAddAnim("FREE_FALLING", anim_direction, image_yscale, 1, 0, 1)
animAddAnim("JUMPING", anim_direction, image_yscale, 1, 1, 8)
animAddAnim("SLIDING", anim_direction, image_yscale, 1, 10, 11)
animAddChainedAnim("SLIDING_INIT", anim_direction, image_yscale, 1, 8, 10, 0, "SLIDING")
animAddAnim("PARRY", anim_direction, image_yscale, 1, 11, 19)
animAddAnim("WALKING", anim_direction, image_yscale, 1, 22, 25)
animAddChainedAnim("WALKING_INIT", anim_direction, image_yscale, 1, 19, 22, 0, "WALKING")

animSet("IDLE")
// grapple

is_grappling = false


is_parrying = false

hsp = 0; // this breaks when its above 6. NOT ANYMORE!!
vsp = 0;
hsp_frac = 0;
vsp_frac = 0;


is_stun_locked = false  // for kb




hsp_acc = 0.5;
kb_hsp = 0
kb_vsp = 0
hsp_fric_ground = 0.50;
hsp_fric_air = 0.15;
hsp_walk = 2.5; // 2.5
hsp_wjump = 3;
hsp_max_slide = 3.1; // 3.1
hsp_max_dash = 4.5; // 3.1, 4


is_locked = false

anim_dir = 1 // direction facing




vsp_jump = -7.5; // -6
vsp_max = 10;
vsp_wjump = -6;
jump_frames = 0
jump_frame_max = 15
vsp_max_wall = 4;

early_jump_frames = 0;
early_jump_frames_max = 8; // 5

check_me = 0;

on_ground = false;
on_wall = 0;
stomping = false;
stomp_trail = 0;
bounce_frames = 0;
bounce_frames_max = 5;
vsp_bounce_max = -7;
//sliding = false;
movement_lock = 0;
dash_cooldown = 0;
dash_cooldown_max = 35;
dash_frames = 0;
dash_frames_max = 20; // 15
dash_speed = 5; // 4
dash_anim_frames = 0

has_indicated_dash = false
dash_indicator_overlay_frames = 0
dash_indicator_overlay_frames_max = 20




grv = 0.3; // 0.3
grv_wall = 0.1;

jumpbuffer = 0;
wall_jump_delay = 0;
wall_jump_delay_max = 5;

xscale = 1;
yscale = 1;

scale_min = 0.7;
scale_max = 1.3;

stretch_frames = 0;


hit = false;
invincible = 0;





_key_left = keyboard_check(ord("A"));
_key_right = keyboard_check(ord("D"));
_key_jump = keyboard_check_pressed(vk_space);
_key_jump_hold = keyboard_check(vk_space);
_key_down = keyboard_check(ord("S"));
key_slide = keyboard_check(vk_control);
key_slide_press = keyboard_check_pressed(vk_control);
key_dash = keyboard_check_pressed(vk_shift);
key_reset = keyboard_check_pressed(ord("R"));
key_die = keyboard_check_pressed(ord("G"));
iframes = 0
iframes_max = 60
hp = 3
hp = 3
enum camMode
{
	follow_object,
	follow_mouse_drag,
	follow_mouse_border,
	follow_mouse_peek,
	move_to_target,
	move_to_follow_target,
	fixed,
}
mode = camMode.follow_object;
sigma_text = "";
cx_max = 0;
cy_max = 0;
lerp_amt = 0;
cx_min = 0;
cy_min = 0;
shake_force = 0

hsp_change = 0;

clamped = false;
//mode = camMode.move_to_follow_target;
tX = noone;
tY = noone;
halfview_h = 0;
halfview_w = 0;
following = obj_main_title;
boundless = false;
view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);
shaking = false;
shakeAmount = 5;
shakeTime = 2;


is_resetting = false

//cx = global.respawn_x;
//cy = global.respawn_y;
#macro RES_W 384
#macro RES_H 216
#macro RES_SCALE 1
#macro CAM_SMOOTH 0.1
scale_val = 0
xView = camera_get_view_x(view_camera[0]);
yView = camera_get_view_y(view_camera[0]);
camera = view_camera[0];
camposX = camera_get_view_x(camera);
camposY = camera_get_view_y(camera);
rm = room;

//instance_create_layer(x, y, "Camera_Layer", obj_parallax_controller)

// smooth cam tutorial pan + zoom

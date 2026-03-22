arm_arr = ["Lasso", "Gun"] // all the different arms the player can have (PURELY VISUAL)
global.cur_display_arm = arm_arr[0] // the arm that is currently being displayed
global.cheat_mode = false
//window_set_fullscreen(true)

window_set_cursor(cr_none)

instance_create_layer(x, y, "CameraLayer", obj_camera)

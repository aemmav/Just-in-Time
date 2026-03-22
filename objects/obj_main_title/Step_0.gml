if(begin_descent){



vsp += accel

y += vsp




}




if(keyboard_check_pressed(vk_enter)) begin_descent = true


if(y >= 2500) instance_destroy()
	var _cheat_murder_key = keyboard_check_pressed(ord("Y"));
	var _cheat_key = keyboard_check_pressed(vk_f1);
	var _respawn_key = keyboard_check_pressed(vk_enter);
	var _reset_key = keyboard_check_pressed(ord("L"));
	var _change_tool_key_f = keyboard_check_pressed(ord("Z"));
	var _change_tool_key_b = keyboard_check_pressed(ord("X"));
	var _change_weapon_key = keyboard_check_pressed(vk_tab);
	var _weapon_one_key = keyboard_check_pressed(ord("1"));
	var _weapon_two_key = keyboard_check_pressed(ord("2"));
	var _weapon_three_key = keyboard_check_pressed(ord("3"));
	var _weapon_four_key = keyboard_check_pressed(ord("4"));
	var _key_die = keyboard_check_pressed(ord("J"));
	var _rage_key = keyboard_check_pressed(ord("G"));
	var _cheat_tp_key = keyboard_check_pressed(ord("V"));
	var _cheat_start_timer_key = keyboard_check_pressed(ord("H"))
	var _cheat_reset_enemy_arr_key = keyboard_check_pressed(ord("M"))
	
	
	
	
	if(_weapon_one_key) global.cur_display_arm = arm_arr[0]
	if(_weapon_two_key) global.cur_display_arm = arm_arr[1]
	
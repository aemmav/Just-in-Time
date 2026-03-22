if (instance_exists(obj_player)) {
	for(var i = 0; i<obj_player.hp; i++){
			draw_sprite_ext(spr_hp, 0, 30+(i*32*5), 30, 5, 5, image_angle, image_blend, image_alpha)
	}
}
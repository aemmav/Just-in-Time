function Hurt(){
	var _timer = 15
	while(timer > 0) {
		draw_sprite_ext(spr_hurt, 0, 0, 0, 10, 10, 0, 0, 1)
		timer--
	}
}
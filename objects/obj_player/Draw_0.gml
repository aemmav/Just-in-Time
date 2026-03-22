

if(anim_dir == 1 && hsp < 0) anim_dir = -1
if(anim_dir == -1 && hsp > 0) anim_dir = 1


draw_sprite_ext(sprite_index, image_index, x, y, xscale * anim_dir, image_yscale, 0, c_white, 1)
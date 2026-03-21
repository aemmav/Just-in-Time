
var _index = 0

if(is_spinning && rot_speed > 30) _index = 1

draw_sprite_ext(sprite_index, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
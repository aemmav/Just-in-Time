 
 //show_message(string(x) + ", " + string(x + hspeed))
 
 
var _angle_hit = radtodeg(arctan2(-vspeed, hspeed))
 
var _spark = instance_create_layer(x + hspeed , y + vspeed , "Collision", obj_temp_effect)
_spark.sprite = spr_gun_spark
_spark.image_xscale = 1
_spark.image_yscale = 1
_spark.image_index = 0
_spark.sprite_index = spr_gun_spark

_spark.image_angle = _angle_hit  // + 90
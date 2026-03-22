event_inherited()

animInit()

cooldown_max = (60)*1.5
cooldown = cooldown_max
hp = 2
_sees_player = false
isShooting = false
shoot_cooldown = 15

anim_direction = 1

animAddAnim("IDLE", anim_direction, image_yscale, 1, 7, 9)


animSet("IDLE")
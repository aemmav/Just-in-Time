
var _bullet = other

if(_bullet.belongs_to_enemy && !iframes) {

hp -= _bullet.dmg
audio_play_sound(oof, 9, false)
Hurt()
iframes = iframes_max

instance_destroy(_bullet)

}
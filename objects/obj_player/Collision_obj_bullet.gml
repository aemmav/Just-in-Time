
var _bullet = other

if(_bullet.belongs_to_enemy && !iframes) {

hp -= _bullet.dmg
audio_play_sound(oof, 10, false)

iframes = iframes_max

instance_destroy(_bullet)

}
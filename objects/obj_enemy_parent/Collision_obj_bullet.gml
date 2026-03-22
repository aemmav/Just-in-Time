
var _bullet = other

if(!_bullet.belongs_to_enemy && (iframes == 0)){

hp -= _bullet.dmg
_temphsp = hsp
stunned = true
stunned_timer = 120

iframes = iframes_max


instance_destroy(_bullet)

}
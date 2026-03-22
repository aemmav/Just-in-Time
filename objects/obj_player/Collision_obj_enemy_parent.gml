var _enemy = other

if (iframes && !other.stunned) {
	hp -= _enemy.dmg
	audio_play_sound(oof, 9, false)
	Hurt()
	iframes = iframes_max
}
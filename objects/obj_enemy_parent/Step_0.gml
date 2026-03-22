


if(hp <= 0){
	instance_destroy() // IT DIED	
}

if(iframes != 0) {
	iframes--
}


if (stunned) {
	// Lerp is a very funny word
	hsp = lerp(hsp, 0, hsp_fric_ground)
	stunned_timer--
	if (stunned_timer <= 0) {
		stunned = false
		recovering_from_stun = true
	}
}
if (!stunned && recovering_from_stun) {
	if(hsp != _temphsp) {
		hsp = lerp(hsp, _temphsp, hsp_fric_ground)
	}
	else {
		recovering_from_stun = false
	}
}
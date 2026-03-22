if(!instance_exists(obj_main_title)) timer += 1;

if (timer >= (60)*5) {
    y -= 32;   // move up 32 pixels
	image_yscale += 32;
    timer = 0;
}
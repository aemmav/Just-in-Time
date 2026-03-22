// versatile animation thing
enum animationType
{
	looped,
	chained,
	finite
}

enum animKey
{
	animType = 0,
	animTagName = 1,
	scaleX =2,
	scaleY =3 ,
	maxAnimSpeed = 4,
	startFrame = 5,
	endFrame = 6,
	repeatAmount = 7,
	nextAnimTag = 8
	
	
	
	
}
function animInit()
{
	_animMap = ds_map_create(); // store animations as arrays
 	_currentAnimTag = "none"; // current animation
	_animIterations = 0; // how many times will it play
	image_speed = 0; // no animation
}
function animDestroy()
{
	ds_map_destroy(_animMap);
}
//looping animation
function animAddAnim(_animTagName, _scaleX, _scaleY, _maxAnimSpeed, _startFrame, _endFrame)
{
	_animMap[? _animTagName] = [animationType.looped, _animTagName, _scaleX, _scaleY, _maxAnimSpeed, _startFrame, _endFrame, noone, noone];
}
//chained animation
function animAddChainedAnim(_animTagName, _scaleX, _scaleY, _maxAnimSpeed, _startFrame, _endFrame, _repeatAmount, _nextAnimTag)
{
	_animMap[? _animTagName] = [animationType.chained, _animTagName, _scaleX, _scaleY, _maxAnimSpeed, _startFrame, _endFrame, _repeatAmount, _nextAnimTag];
}
//finite animation
function animAddFiniteAnim(_animTagName, _scaleX, _scaleY, _maxAnimSpeed, _startFrame, _endFrame, _repeatAmount)
{
	_animMap[? _animTagName] = [animationType.finite, _animTagName, _scaleX, _scaleY, _maxAnimSpeed, _startFrame, _endFrame, _repeatAmount, noone];
}

// sets animation with tag name
function animSet(animTag)
{
	if(_currentAnimTag != animTag)
{
	_currentAnimTag = animTag;
	_animIterations = 0;
}
}
// grabs anim tag
function animGet()
{
	return _currentAnimTag;
}
function animStep()
{
//	animStepExtended(1)
	//show_debug_message(_animMap[? _currentAnimTag][animKey.maxAnimSpeed])
	animStepExtended(_animMap[? _currentAnimTag][animKey.maxAnimSpeed]);
}

function animStepExtended(animSpeed)
{
	
	// check for valid tags
	if(ds_map_exists(_animMap, _currentAnimTag))
	{
		var checkScaleX = _animMap[? _currentAnimTag][animKey.scaleX];
		var checkScaleY = _animMap[? _currentAnimTag][animKey.scaleY];
		
		if(checkScaleX != noone) image_xscale = checkScaleX;
		if(checkScaleY != noone) image_yscale = checkScaleY;
		// nooone = null;
		
		if(is_undefined(animSpeed))
		{
			// did not have the gamespeed_fps / 60
			image_speed = max(min(_animMap[? _currentAnimTag][animKey.maxAnimSpeed ], 1 ), 0); // only support anims between 1 and 0 (for gamepad)
		}
		else
		{
			image_speed = max(min(min(animSpeed, _animMap[? _currentAnimTag][animKey.maxAnimSpeed]), 1), 0);
		}
		// grab parameters for current animTag
		var startFrame = _animMap[? _currentAnimTag][animKey.startFrame];
		var endFrame = _animMap[? _currentAnimTag][animKey.endFrame];
		var repeatAmount = _animMap[? _currentAnimTag][animKey.repeatAmount];
		var nextAnimTag = _animMap[? _currentAnimTag][animKey.nextAnimTag];
		
		if(floor(image_index) < startFrame) // haven't start anim
		{
			image_index = startFrame;
		}
		else if(floor(image_index) > endFrame) // beyond anim
		{
			image_index = startFrame;
		}
		
		else if(floor(image_index) == endFrame) // we finished
		{
			_animIterations++; // increase iter count for finite and chained anims
			switch(_animMap[? _currentAnimTag][animKey.animType])
			{
				case animationType.looped:
				image_index = startFrame;
				break;
				case animationType.finite:
				if(_animIterations >= repeatAmount)
				{
					image_speed = 0;
				}
				break;
				case animationType.chained:
				if(_animIterations >= repeatAmount) // >=
				{
					image_speed = 0;
					animSet(nextAnimTag);
				}
				break;
			}
		}
		
		
	}
}


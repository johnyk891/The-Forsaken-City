/// @description Movement and Collision

key_left_pressed = keyboard_check(vk_left);
key_right_pressed = keyboard_check(vk_right);
key_jump_pressed = keyboard_check_pressed(vk_space);

//Calculate movement

var move = key_right_pressed - key_left_pressed;

hsp = move * walkspd;
vsp = vsp + grv;


// Jumping

if(place_meeting(x,y + 1, obj_Wall) && (key_jump_pressed))
{
	vsp = -7;	
}

//Horizontal Collision

if(place_meeting(x + hsp, y, obj_Wall))
{
	while (!place_meeting(x + sign(hsp), y, obj_Wall))
	{
		x = x + sign(hsp);
	}
	
	hsp = 0;
}

x = x + hsp;


//Vertical Collision
if(place_meeting(x, y + vsp, obj_Wall))
{
	while (!place_meeting(x , y+ sign(vsp), obj_Wall))
	{
		y = y + sign(vsp);
	}
	
	vsp = 0;
}

y = y + vsp;




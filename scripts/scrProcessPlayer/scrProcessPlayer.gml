var c1;
var c2;
var c3;

// Apply gravity (and jumping)
y = y+grav;
grav+=gravdelta;
if( grav>=gravmax ) grav=gravmax;

//Vertical movement

if( grav<0 )
{								// If jumping check above player
    sprite_index = sJump;
} 
else 
{									// otherwise, falling so check UNDER the player
    if(jump)
	{								// if coming down after jumping display the correct sprite
        sprite_index = sJumpFall;
    } 
	else if(fall)
	{						// if falling from an edge display the fall sprite
        sprite_index = sFall;    
    }
	else 
	{								// if not already falling or jumping
		grav = 0;							// first stop falling (used for ladders)
		fall = true;						// flag that we are falling
	}
	// check the points at the bottom of the player character
	c1 = tilemap_get_at_pixel(oGame.map,x-(sprite_get_width(sprite_index)/2),y);	// left
	c2 = tilemap_get_at_pixel(oGame.map,x+(sprite_get_width(sprite_index)/2),y);	// right
	c3 = tilemap_get_at_pixel(oGame.map,x,y);										// center

	if( c1>=1 || c2>=1 || c3 >= 1)
	{			// if they are intersecting with a tile
		if((c1 == 1) || (c2 == 1) || (c3 == 1) || (c1 == 3) || (c2 == 3) || (c3 == 3))
		{
			// if the tile we are intersecting with cannot be fallen through
			y = real(y&$ffffffc0);			// move the sprite to the top of the tile
			sprite_index = choose(sIdle1);	// set the sprite to the idle sprite
			jump = false;					// stop any jumping
			fall = false;					// stop any falling
		}
	}


//Horizontal movement

if(keyboard_check(vk_left))  // moving left collisions
{				
    dir=-1;									// set the correct direction
	image_xscale = dir;						// make the sprite face the correct direction
    if(!jump && !fall)	// check if not jumping or falling
	{						
        sprite_index = sWalk;				// set the sprite to walking
    }
    x=x-xspeed								// move the player left
    c2 = -1;
	c3 = -1;
	// check the points at the bottom of the sprite
    c1 = tilemap_get_at_pixel(oGame.map,x-(sprite_get_width(sprite_index)/2),y-1);				// left
    c3 = tilemap_get_at_pixel(oGame.map,x,y-1);													// center
    if( y&$3f>0 ) c2=tilemap_get_at_pixel(oGame.map,x-(sprite_get_width(sprite_index)/2),y+1);	// left below (only check if there is a tile below)
    if(c1 == 3) || (c2 == 3)
	{																	// if we are intersecting with a box
		x = real(x&$ffffffc0)+(sprite_get_width(sprite_index)/2);								// stop the player from moving
    }
}
else if(keyboard_check(vk_right))  // moving right collisions
	{			
		dir=1;									// set the correct direction
		image_xscale = dir;						// make the sprte face the correct direction 
		if(!jump && !fall) // if we are not jumping or falling
		{						
			sprite_index = sWalk;				// set the sprite to walking
		}
		x=x+xspeed;								// move the player right
		c2 = -1;
		c3 = -1;
		// check the points at the bottom of the sprite
		c1 = tilemap_get_at_pixel(oGame.map,x+(sprite_get_width(sprite_index)/2),y-1);				// right
		c3 = tilemap_get_at_pixel(oGame.map,x,y-1);													// center
		if( y&$3f>0 ) c2=tilemap_get_at_pixel(oGame.map,x+(sprite_get_width(sprite_index)/2),y+1);	// right below (only check if there is a tile below)
		if(c1 == 3) || (c2 == 3){																	// if we are intersecting with a box
		x = real(x&$ffffffc0)+oGame.tilesize-(sprite_get_width(sprite_index)/2);			// stop the player from moving
	}
}
}

//Room wrapping
// If the X or Y values of the instance are outside the room, it will warp it to the opposite side.
if (x < -5) // This checks if the instance object is left of the room.
{
x = room_width+2;
}
if (x > room_width+5) // Checks if the instance object is right of the room.
{
x = -2;
}


//movement wrap
//if room==rGrass
//{
//	if (x > (room_width-(view_wview[0] / 2))+1)
//	{
//		x = (view_wview[0] / 2)+1;
//		view_xview[0] = 0;
//	}
//	if (x < (view_wview[0] / 2))
//	{
//		x = (room_width-(view_wview[0] / 2));
//		view_xview[0] = (room_width-view_wview[0]);
//	}
//}

//if (health <= 0)
//{
    //restart = true;
   // if (keyboard_check_pressed(vk_space))
    //{
  //      room_restart();
//    }
//}
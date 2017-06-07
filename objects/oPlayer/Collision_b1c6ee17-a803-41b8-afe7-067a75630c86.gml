// if the player collides with a ghost
//health = health - 1;				// reduce the players health
with(other) // destroy the ghost
{			
	instance_destroy();
	room_goto(rGameOver)
}
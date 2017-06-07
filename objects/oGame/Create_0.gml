/// Initialize varibles 
global.hard = false
tilesize = 64;															// size of tiles
map = layer_tilemap_get_id("Collisions");								// this will be the layer we use for collisions
hills = layer_get_all_elements("Hills");								// all the hill sprites
stars = layer_get_all_elements("Stars");								// all the star sprites
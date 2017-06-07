/// @description Insert description here
// You can write your code in this editor
draw_set_font(fTahoma24);											// set the font to draw text with
draw_set_valign(fa_middle);											// use the middle to position vertically
draw_set_halign(fa_right);											// use the right to position horizontally
draw_set_colour(c_white);											// set the colour to draw text
draw_sprite(sPickupStar,0,view_wport[0]-100,50);						// draw the star sprite
draw_text(view_wport[0]-100-sprite_get_width(sPickupStar),57,score);	// draw the number of stars collected

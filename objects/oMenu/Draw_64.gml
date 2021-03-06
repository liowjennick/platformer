/// @description Draw menu

draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (i = 0; i < menu_items; i++) {
	var offset = 2;
	var txt = menu[i];
	
	if (menu_cursor == i) {
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	} else {
		var col = c_gray;
	}

	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 2));
	
	draw_set_color(c_black);
	draw_text((xx - offset) - gui_margin, yy, txt);
	draw_text((xx + offset) - gui_margin, yy, txt);
	draw_text(xx - gui_margin, yy + offset, txt);
	draw_text(xx - gui_margin, yy - offset, txt);
	draw_set_color(col);
	draw_text(xx - gui_margin, yy, txt);
}

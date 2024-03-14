/// @description 説明をここに挿入
// このエディターでコードを作成することができます

draw_self();
draw_text_transformed_color(place_x_general, place_y_high_score - 100, "High score", 2, 2, 0, #606060, #606060, c_black, c_black,1);
show_board(global.high_score, 10, 3, place_x_general, place_y_high_score, #606060, c_black);

draw_text_transformed_color(place_x_general, place_y_current_score - 100, "Score", 2, 2, 0, #606060, #606060, c_black, c_black,1);
show_board(global.current_score, 10, 3, place_x_general, place_y_current_score, #606060, c_black);

draw_text_transformed_color(place_x_general, place_y_life - 100, "Sacrifice", 2, 2, 0, #606060, #606060, c_black, c_black,1);

draw_text_transformed_color(place_x_general, place_y_sub_power - 100, "Sub power", 2, 2, 0, #606060, #606060, c_black, c_black,1);
show_board(global.sub_power, 10, 2, place_x_general, place_y_sub_power, #606060, c_black);

draw_text_transformed_color(place_x_general, place_y_point - 100, "Point", 2, 2, 0, #606060, #606060, c_black, c_black,1);
show_board(global.point, 10, 2, place_x_general, place_y_point, #606060, c_black);

draw_text_transformed_color(place_x_general, place_y_graze - 100, "Graze", 2, 2, 0, #606060, #606060, c_black, c_black,1);
show_board(global.graze, 10, 2, place_x_general, place_y_graze, #606060, c_black);

show_sacrifice(place_x_life, place_y_life + 30);
/// @description 説明をここに挿入
// このエディターでコードを作成することができます
global.high_score = 0;
global.current_score = 0;
global.point = 1000;
global.sub_power = 0;
global.life = 2;
global.life_piece = 0;
global.graze = 0;
place_x_general = 2400;//表示する数字たちの右端
place_x_life = place_x_general + 50;
place_y_high_score = 300;
place_y_current_score = place_y_high_score + 300;
place_y_life = place_y_high_score + 900;
place_y_sub_power = place_y_high_score + 1300;
place_y_point = place_y_high_score + 1600;
place_y_graze = place_y_high_score + 1900;

function lifepiecesystem(){
	if(global.life_piece == 3){
		global.life++;
		global.life_piece = 0;
	}
}

function board(high_score, current_score, point, sub_power, life, life_piece){
	//draw_text_transformed();
}

function show_board(integer, digit, size, place_x, place_y, upper_color, under_color){//integerの桁数はdigitよりも小さくしてください　00001234のように表示します
	strings = string(integer);
	strings_digit = string_length(strings);
	ii = 0;
	for(i = 0; i < digit; i++){
		if(i >= digit - strings_digit){
			ii++;
			draw_text_transformed_color(place_x + i*size*40, place_y, string_char_at(strings, ii), size, size, 0,  upper_color,  upper_color, under_color, under_color, 1);
		}
		else{
			draw_text_transformed_color(place_x + i*size*40, place_y, 0, size, size, 0,  upper_color,  upper_color, under_color, under_color, 1);
		}
	}
	
}

function show_sacrifice(place_x, place_y){
	draw_text_transformed_color(place_x, place_y + 0, "●", 2, 2, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(place_x + 40, place_y + 90, "■", 2, 1, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(place_x + 115, place_y + 90, "▲", 1.2, 1.2, -30, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(place_x - 40, place_y + 90, "■", 2, 1, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(place_x - 65, place_y + 122, "▲", 1.2, 1.2, 30, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(place_x - 26, place_y + 30, "▲", 3, 4, 0, c_black, c_black, c_black, c_black,1);
}
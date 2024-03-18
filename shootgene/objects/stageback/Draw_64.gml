/// @description 説明をここに挿入
// このエディターでコードを作成することができます
draw_text_transformed_color(2500, 300, "第" + string(generation) + "世代", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
if (generation >= 2){
	draw_text_transformed_color(2500, 700, "被弾数の最小値と2番目：", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(2500, 900, string(hit_min) + ",", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(2500, 1100, string(hit_min2), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(2500, 1300, "被弾数の最大値と2番目：", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(2500, 1500, string(hit_max2), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(2500, 1700, string(hit_max), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(2500, 1900, "被弾数の平均：", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(2500, 2100, string(hit_average), 2, 2, 0, c_black, c_black, c_black, c_black, 1);
}
/// @description 説明をここに挿入
// このエディターでコードを作成することができます
ds_list_copy(bullets, global.bullets);
for (i = 0; i < ds_list_size(bullets); i++){//近い順に弾をソート
	for (ii = 0; ii < ds_list_size(bullets) - 1 - i; ii++){
		if (point_distance(x, y, bullets[| ii].x, bullets[| ii].y) > point_distance(x, y, bullets[| ii + 1].x, bullets[| ii + 1].y)){
			var buffer = bullets[| ii];
			bullets[| ii] = bullets[| ii + 1];
			bullets[| ii + 1] = buffer;
		}
	}
}

var bullet1 = bullets[| 0];//bullet1, bullet2:最も近い弾2つ
var bullet1_position = floor(point_direction(x, y, bullet1.x, bullet1.y) / 45);
var bullet1_direction = floor(bullet1.direction / 45);
var bullet1_distance = point_distance(x, y, bullet1.x, bullet1.y);

var bullet2 = bullets[| 1];
var bullet2_position = floor(point_direction(x, y, bullet2.x, bullet2.y) / 45);
var bullet2_direction = floor(bullet2.direction / 45);
var bullet2_distance = point_distance(x, y, bullet2.x, bullet2.y);

//bullet_position:個体から見た弾の方角を8分割して整数で表している
//bullet_direction:弾の進行方向を8分割して整数で表している
//bullet_distance:弾との距離
if (bullet1_distance <=100){//弾に近いほど罰を受ける
	punishment += 6 / bullet1_distance;
}

if (bullet1_distance > 200){//弾の角度、個体から見た弾の方角によって移動速度と方向を決める
	speed = 0;
}
else {//bullet1_position. bullet1_direction, bullet2_position, bullet2_directionの状態の組み合わせとgeneのindexを1対1対応させる
	speed = 20;
	direction = gene[bullet1_position, (64 * bullet1_direction) + (8 * bullet2_position) + bullet2_direction] * 45;
}

if (!place_meeting(x, y, background)){
	x = encx(300) + encx(random(300));
	y = ency(300) + ency(random(300));
}

self.alarm[0] = room_speed * 0.05;
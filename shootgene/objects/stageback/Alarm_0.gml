/// @description 説明をここに挿入
// このエディターでコードを作成することができます
for (i = 0; i < players_amount; i++){//punishmentが少ない順に個体をソート
	for (ii = 0; ii < players_amount - 1 - i; ii++){
		if (players[ii].punishment > players[ii + 1].punishment){
			buffer = players[ii];
			players[ii] = players[ii + 1];
			players[ii + 1] = buffer;
		}
	}
}

players_sorted_by_hitcount = players;
for (i = 0; i < players_amount; i++){//hitcount(被弾数)が少ない順に個体をソート
	for (ii = 0; ii < players_amount - 1 - i; ii++){
		if (players_sorted_by_hitcount[ii].hitcount > players_sorted_by_hitcount[ii + 1].hitcount){
			buffer = players_sorted_by_hitcount[ii];
			players_sorted_by_hitcount[ii] = players_sorted_by_hitcount[ii + 1];
			players_sorted_by_hitcount[ii + 1] = buffer;
		}
	}
}
	hit_min = players_sorted_by_hitcount[0].hitcount;//被弾数の最小値
	hit_min2 = players_sorted_by_hitcount[1].hitcount;//2番目
	
	hit_max = players_sorted_by_hitcount[players_amount - 1].hitcount;//被弾数の最大値
	hit_max2 = players_sorted_by_hitcount[players_amount - 2].hitcount;//2番目


good_ones = ds_list_create();
for (i = 0; i < 4; i++){//最もhitcountが少ない4個体をgood_onesに格納
	good_ones[| i] = players[i].gene;
}


parent1 = ixorshift(100);

if (0 <= parent1 && parent1 < 50){//50%の確率で親1として1位を選択
	parent1 = good_ones[| 0];
	ds_list_delete(good_ones, 0);
}
else if (50 <= parent1 && parent1 < 75){//25%
	parent1 = good_ones[| 1];
	ds_list_delete(good_ones, 1);
}
else if (75 <= parent1 && parent1 < 90){//15%
	parent1 = good_ones[| 2];
	ds_list_delete(good_ones, 2);
}
else if (90 <= parent1 && parent1 < 100){//10%
	parent1 = good_ones[| 3];
	ds_list_delete(good_ones, 3);
}

parent2 = ixorshift(100);

if (0 <= parent2 && parent2 < 50){//50%の確率で親2として2位を選択
	parent2 = good_ones[| 0];
}
else if (50 <= parent2 && parent2 < 80){//30%
	parent2 = good_ones[| 1];
}
else if (80 <= parent2 && parent2 < 100){//20%
	parent2 = good_ones[| 2];
}



hit_average = 0;//被弾回数の平均
for (i = 0; i < players_amount; i++){
	hit_average += players[i].hitcount;
}
hit_average /= players_amount;
show_debug_message("↓gen{0}↓", generation);
show_debug_message("被弾回数:{0}, punishment:{1}, gene:{2}", players[0].hitcount, players[0].punishment, players[0].gene);
show_debug_message("被弾回数:{0}, punishment:{1}, gene:{2}", players[1].hitcount, players[1].punishment, players[1].gene);
show_debug_message("被弾回数の平均:{0}", hit_average);

for (i = 0; i < players_amount; i++){//親1,2のペアで子を20体作成
	for (ii = 0; ii < 8; ii++){
		for (iii = 0; iii < 512; iii++){//一様交叉
			if (ixorshift(2) == 0){
				child[i][ii] = parent1[ii];
			}
			else {
				child[i][ii] = parent2[ii];
			}
		}
	}
}

if (ixorshift(5) == 0){//ランダムなgeneを持つ1個体を20%の確率でchild[0]に作成
	for (i = 0; i < 8; i++){
		for (ii = 0; ii < 512; ii++){
			child[0][i][ii] = choose(0, 1, 2, 3, 4, 5, 6, 7);
		}
	}
}
for (i = 0; i < players_amount; i++){
	for (ii = 0; ii < 8; ii++){
		for (iii = 0; iii < 512; iii++){
			if (ixorshift(100) == 0){//遺伝子1項目ごとに1%の確率で突然変異
				child[i][ii][iii] = choose(0, 1, 2, 3, 4, 5, 6, 7);
			}
		}
	}
}
for (i = 0; i < players_amount; i++){//親個体を消して子個体を出現させる
	xx = 300 + random(300);
	yy = 300 + random(300);
	instance_destroy(players[i]);
	players[i] = instance_create_layer(encx(xx), ency(yy), "player", playercollision);
	players[i].gene = child[i];
}

generation++;

self.alarm[0] = room_speed * 20;
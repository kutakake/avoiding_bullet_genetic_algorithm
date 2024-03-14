// スクリプトのアセットが v2.3.0 用に変更されました。 詳細については、
// https://help.yoyogames.com/hc/en-us/articles/360005277377 を参照してください

function xorshift(){//標準の乱数生成関数ではseed値を指定できないためxorshiftを用いる　数字がでかすぎるので最後にでかい数字で割ってある
	seed = global.seed;
	seed = seed^(seed<<13);
	seed = seed^(seed>>17);
	seed = seed^(seed>>5);
	global.seed = seed;
	return round(seed/10000000000);
}

function ixorshift(integer){//0以上integer未満の整数で乱数を返す
	return xorshift() % integer;
}


function encx(xx){//backgroundapriteで隠れていない部分の左端・上端と右端・下端をそれぞれ0から1000とした独自の座標からゲーム内座標に変換する
	return xx*2.272 + 32;
}
function decx(xx){//decはその逆
	return (xx - 32) / 2.272
}
function ency(yy){
	return yy*2.816 + 32;
}
function decy(yy){
	return (yy - 32) / 2.816;
}


function ulm(bx, by, bspeed, bdirection){//normal_bulletの出現位置、速度、向きを一度に指定して出現させる　Uniform Linear Motion(等速直線運動)の略　弾幕ゲーを作るとき頻繁に使うので名前が短い方がいいと思って……
	bulletinstance = instance_create_layer(bx, by, "bullet", normal_bullet);
	with(bulletinstance){
		speed = bspeed;
		direction = bdirection;
	}
}
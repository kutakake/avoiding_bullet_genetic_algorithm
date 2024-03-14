/// @description 説明をここに挿入
// このエディターでコードを作成することができます


if(!place_meeting(x, y, stageback)){
	instance_destroy();
	ds_list_delete(global.bullets, ds_list_find_index(global.bullets, id));
}

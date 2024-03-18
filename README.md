# Introduction
これは遺伝的アルゴリズムによって弾幕を避けさせる試みです。

Releases: https://github.com/rainoden/avoiding_bullet_genetic_algorithm/releases

# How to use
1.クローンしてGamemakerで開き好きな環境向けにビルドします。Windowsなら、Releasesにビルド済みのものがあります。

2.実行します。

3.眺めます。

![image](https://github.com/rainoden/avoiding_bullet_genetic_algorithm/assets/143584506/6bcbc954-256b-46d0-8671-d22864b38879)

白い球体が最も近い2つの赤い球体の方角、進行方向をもとにして避ける方向を決定し、避けます。コード内では白い球体をplayer、赤い球体をbulletと呼んでいます。

初めは避ける方向はランダムですが、被弾回数が少なく、長い時間弾から離れていた２個体の"避け方向"が遺伝子として次の世代に一様交叉で受け継がれます。

画面左部に表示されている世代は今の世代、被弾数についての情報は前の世代のものです。

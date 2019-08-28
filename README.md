# バックエンド

| name | age |
| --- | --- |
| man   | 11 |
| woman | 12 |
| monkey | 13 |
Users  
|column|Type|Description|
| --- | --- | --- |
|id|integer|primary|
| --- | --- | ---|
| latitude | double(9,6) | 緯度　|
| --- | --- | --- |
| longitude | double(9,6) | 経度　|
| --- | --- | --- |
| logintime | DATETIME | ログイン時刻 |

Messages  
|column|Type|Description|
|:---|:---|:---|
|id|integer|primary|
|:---|:---|:---|
|latitude|double(9,6)|緯度|
|:---|:---|:---|
|longitude|double(9,6)|経度|
|:---|:---|:---|
|content|text|メッセ内容|
|:---|:---|:---|
|color|string|文字色|
|:---|:---|:---|
|size|int|文字の大きさ|

Prefentures  
|column|Type|Description|
|:---|:---|:---|
|id|integer|primary|
|:---|:---|:---|
|min_latitude|double(9,6)|最低緯度|
|:---|:---|:---|
|min_longitude|double(9,6)|最低経度|
|:---|:---|:---|
|max_longitude|double(9,6)|最高経度|
:---|:---|:---|
|max_latitude|double(9,6)|最高緯度|
|:---|:---|:---|
|name|string|都道府県名|

user:message = 1:N

messge:prefecture = 1:1

※CREATED_AT と UPDATED_AT は省略

## 流れ

1.ユーザが新規登録  
2.ユーザがログイン(logintime に保存)  
3.メッセージを作成  
4.範囲検索で prefecture と紐付け  
5.メッセージが天気 api に沿って流れる  
6.スケジューラがサーバを起こすタイミングで、message の緯度経度が更新  
7.ユーザが再ログインする(logintime が更新)  
7-1.ユーザの都道府県を計算  
7-2.「周り」のメッセージを取得 ← 範囲は要相談

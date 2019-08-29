# バックエンド

Users

| column    | Type        |
| --------- | ----------- |
| id        | integer     |
| name      | string      |
| latitude  | double(9,6) |
| longitude | double(9,6) |
| logintime | DATETIME    |

Messages

| column    | Type        |
| --------- | ----------- |
| id        | integer     |
| latitude  | double(9,6) |
| longitude | double(9,6) |
| content   | text        |
| color     | string      |
| size      | int         |

Prefentures

| column        | Type        |
| ------------- | ----------- |
| id            | integer     |
| min_latitude  | double(9,6) |
| min_longitude | double(9,6) |
| max_longitude | double(9,6) |
| max_latitude  | double(9,6) |
| name          | string      |

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

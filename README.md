# アプリケーション情報

## アプリケーション名
canpinfo	

## アプリケーション概要
キャンプ場情報の紹介サイト
各ユーザーがキャンプ場の紹介記事を投稿し、情報交換を行う
記事に対するコメント機能やチャットページによって、ユーザー同士がコミュニケーションをとる

## URL	
https://campapp-31513.herokuapp.com/

## テスト用アカウント	
1 
ユーザー名:テストユーザー
アドレス:01sample@sample.com
パスワード:01sample

2 
ユーザー名:testuser
アドレス:sample02@sample.com
パスワード:sample02

## 利用方法	
ユーザー登録を行う
記事を投稿したり、他のユーザーの記事を閲覧する
記事へのコメントやチャットでユーザ同士で交流する


## 目指した課題解決	
キャンプ場を探すのは意外と面倒である
なぜなら、場所によってwebサイトが無かったり、必要な情報が開示されていなかったりと情報不足のケースが多い.
そこで、様々なユーザーが気軽に情報共有を行える場があればと思いこのwebサイトを考案した。


## 洗い出した要件	
スプレッドシートにまとめた要件定義を記述。

ユーザー管理機能
ユーザー情報を登録しアカウントを作成する
[![Image from Gyazo](https://i.gyazo.com/7a1681a1550c17c16108be99e77b6ca6.gif)](https://gyazo.com/7a1681a1550c17c16108be99e77b6ca6)


記事投稿機能
必要情報を記入し、キャンプ場紹介の記事を投稿する
[![Image from Gyazo](https://i.gyazo.com/458a5f3aa4bdb2f5d8df94f8acd59201.gif)](https://gyazo.com/458a5f3aa4bdb2f5d8df94f8acd59201)

記事検索機能
県名で記事を検索できるようにする
[![Image from Gyazo](https://i.gyazo.com/a15b606024147e8236b0fb23c399c2b2.gif)](https://gyazo.com/a15b606024147e8236b0fb23c399c2b2)

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/2665849e4d7d05b8b10655edf0e75d97.png)](https://gyazo.com/2665849e4d7d05b8b10655edf0e75d97)



## ローカルでの動作方法	
$ git clone https://github.com/87takakura/campapp-31513.git
$ cd campapp-31513
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s




## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| username           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| prefecture_id      | integer | null: false               |
| profile            | string 

### Association

- has_many :campposts
- has_many :comments
- has_many :chats
 
## campposts テーブル 
 
| Column          | Type        | Options                      |
| --------------- | ----------  | ---------------------------- |
| name            | string      | null: false                  |
| information     | text        | null: false                  |
| prefecture_id   | integer     | null: false                  |
| city            | text        | null: false                  |
| user            | references  | null: false foreign_key:true |
| water_supply_id | integer     | null: false                  |
| outlet_id       | integer     | null: false                  |
| fire_id         | integer     | null: false                  |
| cargetin_id     | integer     | null: false                  |
| toilet_id       | integer     | null: false                  |
| bath_id         | integer     | null: false                  |
| parking_id      | integer     | null: false                  |
| phone_number    | string    |
| web_site        | string     | 

### Association

- belongs_to :user
- has_many :comments
- has_many :chats

## comments テーブル

| Column    | Type       | Options                       |
| -------   | ---------- | ----------------------------- |
| message   | text       | null: false                   |
| user      | references | null: false, foreign_key:true |
| camppost  | references | null: false, foreign_key:true |


### Association

- belongs_to :user
- belongs_to :camppost

  ### chatsテーブル
  
  | Column             | Type       | Options                       |
  | ------------------ | ---------- | ----------------------------- |
  | user               | references | null: false, foreign_key:true |
  | camppost           | references | null: false, foreign_key:true |
  | message            | text       | null: false                   |

  ### Association

- belongs_to :user
- belongs_to :camppost

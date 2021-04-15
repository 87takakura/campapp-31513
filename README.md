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
[![Image from Gyazo](https://i.gyazo.com/f961ceb13a9ba066262cecc61cfded1b.png)](https://gyazo.com/f961ceb13a9ba066262cecc61cfded1b)
ユーザー情報を登録しアカウントを作成する

記事投稿機能

必要情報を記入し、キャンプ場紹介の記事を投稿する

実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

##実装予定の機能	
カテゴリによる検索機能
県名などの情報で記事を検索できるようにする

## データベース設計	ER図等を添付。
[![Image from Gyazo](https://i.gyazo.com/2665849e4d7d05b8b10655edf0e75d97.png)](https://gyazo.com/2665849e4d7d05b8b10655edf0e75d97)



##ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。





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
| phone_number    | integer     |
| web_site        | strings     | 

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

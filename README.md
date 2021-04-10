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
苗字：山田
名前：太郎
カナ苗字：ヤマダ
カナ名前：タロウ
生年月日1994-12-27

2 
ユーザー名:testuser
アドレス:sample02@sample.com
パスワード:sample02
苗字：山田
名前：次郎
カナ苗字：ヤマダ
カナ名前：ジロウ
生年月日1998-12-27

## 利用方法	
ユーザー登録を行う
記事を投稿したり、他のユーザーの記事を閲覧する
記事へのコメントやチャットでユーザ同士で交流する


## 目指した課題解決	
キャンプ場を探すのは意外と面倒である
なぜなら、場所によってwebサイトが無かったり、必要な情報が開示されていなかったりと情報不足のケースが多い
そこで、様々なユーザーが気軽に情報共有を行える場があればと思いこのアプリを考案した。


## 洗い出した要件	
スプレッドシートにまとめた要件定義を記述。

ユーザー管理機能
[![Image from Gyazo](https://i.gyazo.com/f961ceb13a9ba066262cecc61cfded1b.png)](https://gyazo.com/f961ceb13a9ba066262cecc61cfded1b)
ユーザー情報を登録しアカウントを作成する

記事投稿機能
[![Image from Gyazo](https://i.gyazo.com/53096df9bc02ea5a8f261d0319bfb90d.gif)](https://gyazo.com/53096df9bc02ea5a8f261d0319bfb90d)
必要情報を記入し、キャンプ場紹介の記事を投稿する

記事削除機能
[![Image from Gyazo](https://i.gyazo.com/2623f7f6c639676728f52e05cf5bb2bf.gif)](https://gyazo.com/2623f7f6c639676728f52e05cf5bb2bf)
自身が投稿した記事であれば削除できる

コメント投稿機能
[![Image from Gyazo](https://i.gyazo.com/ff9f0ddcaceb1c38726b68b6761f2aa6.gif)](https://gyazo.com/ff9f0ddcaceb1c38726b68b6761f2aa6)
記事に対してのコメント。質問や感想の投稿で、閲覧した人が情報を追加する。

コメント削除機能
[![Image from Gyazo](https://i.gyazo.com/2dc1400d7656d458637170daa5cd3a70.gif)](https://gyazo.com/2dc1400d7656d458637170daa5cd3a70)
自身が投稿したコメントであれば削除できる

チャット機能
[![Image from Gyazo](https://i.gyazo.com/40f131083ccd02f8873f0a260c07ac71.png)](https://gyazo.com/40f131083ccd02f8873f0a260c07ac71)
記事投稿者とチャットページで会話する


##実装予定の機能	
カテゴリによる検索機能
県名などの情報で記事を検索できるようにする

## データベース設計	ER図等を添付。
[![Image from Gyazo](https://i.gyazo.com/33e331d84382386806a63c162e089168.png)](https://gyazo.com/33e331d84382386806a63c162e089168)




ローカルでの動作方法















# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| username           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| katakanafirstname  | string | null: false |
| katakanalastname   | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :campposts
- has_many :comments
- has_many :chats
 
## campposts テーブル 
 
| Column          | Type        | Options      |
| --------------- | ----------  | -----------  |
| name            | string      | null: false  |
| information     | text        | null: false  |
| prefecture_id       | integer     | null: false  |
| city            | text        | null: false  |
| user            | references  | null: false foreign_key:true |
| water_supply_id | integer     | null: false  |
| socket_id       | integer     | null: false  |
| toilet_id       | integer     | null: false  |
| bath_id         | integer     | null: false  |
| parking_id      | integer     | null: false  |
| phone_number    | integer     |
| web_site        | strings     | 
### Association

- belongs_to :user
- has_many :comments
- has_many :chats

## comments テーブル

| Column    | Type       | Options     |
| -------   | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | null: false, foreign_key:true |
| camppost   | references | null: false, foreign_key:true |


### Association

- belongs_to :user
- belongs_to :camppost

  ### chatsテーブル
  
  | Column             | Type       | Options     |
  | ------------------ | ---------- | ----------- |
  | user               | references | null: false, foreign_key:true |
  | camppost           | references | null: false, foreign_key:true |
  | text               | text       | null: false |

  ### Association

- belongs_to :user
- belongs_to :camppost

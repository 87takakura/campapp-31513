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

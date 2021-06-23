# アプリケーション名
 Douzo 〜どうぞ〜

# アプリケーション概要
  


 # ローカルでの動作方法
 - Ruby 2.6.5
 - Ruby on Rails 6.0.0


# テーブル設計


## Users テーブル 

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |   
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| introduction         | string  |                           |

### Association

has_many :items
has_many :orders
has_many :comments



## Items テーブル 

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |   
| name            | string       | null: false                    |
| item_text       | text         | null: false                    |
| category_id     | integer      | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order
has_many :comments



##  Ordersテーブル 

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |   
| item       | references  | null: false, foreign_key: true |
| user       | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item



## Comments テーブル 

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |   
| comment              | text        | null: false                    |
| item                 | references  | null: false, foreign_key: true |
| user                 | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
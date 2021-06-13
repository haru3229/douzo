# テーブル設計


## Users テーブル 

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |   
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| introduction         | string  | null: false               |

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
| comment_text         | text        | null: false                    |
| item                 | references  | null: false, foreign_key: true |
| user                 | references  | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
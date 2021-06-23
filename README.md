# アプリケーション名
   「Douzo 〜どうぞ〜」

# アプリケーションの概要
 - 不要になった学用品（体操服，制服，学習道具など）を出品できる。
 - 欲しい学用品を購入または譲り受けることができる。

# URL
 https://douzo-app.herokuapp.com/

# テスト用アカウント

# 利用方法

# 目指した課題解決
 ## 「誰の」
  主に保育園（幼稚園），小中学校の子どもがいる家庭の保護者

 ## 「どのような課題を」
 - 成長や卒業等により，不要になった学用品を，売れる（譲れる）のであれば欲しい人に売りたい（譲りたい）
 - 学用品が欲しいが，子どもの成長や費用の面もあり，安く購入したい
 - 知り合いが少なく，譲りたい人がわからない

# 洗い出した要件



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
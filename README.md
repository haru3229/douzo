# アプリケーション名
   「Douzo 〜どうぞ〜」

# アプリケーションの概要
 - 不要になった学用品（体操服，制服，学習道具など）を出品できます。
 - 欲しい学用品を購入または譲り受けることができます。

# URL
 https://douzo-app.herokuapp.com/

# テスト用アカウント

# 利用方法

# 目指した課題解決
 ### 「誰の」
  主に保育園（幼稚園），小中学校の子どもがいる家庭の保護者

 ### 「どのような課題を」
 ①「子どもの成長や卒業等により，不要になった学用品を，売り（または譲り）たい。」

 ②「学用品が欲しいが，子どもの成長による買い替えや費用の面の課題があるため，安く購入したい。」
 
 ③「知り合いが少なく，「売り（譲り）たい」「欲しい」相手が分からない。」

 以上の願いをマッチさせるためのアプリケーションを作りたいと思い，開発しました。

# 洗い出した要件

# 実装した機能

# 実装予定の機能

# データベース設計

# ローカルでの動作方法
 Ruby 2.6.5
 Ruby on Rails 6.0.0



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
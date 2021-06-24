# アプリケーション名

   「Douzo 〜どうぞ〜」

# アプリケーションの概要
 - 不要になった学用品（体操服，制服，学習道具など）を出品したり，欲しい学用品を購入または譲り受けることができます。
 - 出品されたアイテムに対してコメントをしたり，購入者と出品者が個別にコメントを交わしたりすることもできます。

# 制作背景
 ### 「誰の」
  主に保育園（幼稚園），小中学校の子どもがいる家庭の保護者

 ### 「どのような課題を解決するためか」
 「子どもの成長や卒業等により，不要になった学用品を，売り（または譲り）たい。」
 「学用品が欲しいが，子どもの成長による買い替えや費用の面の課題があるため，安く購入したい。」
 「知り合いが少なく，「売り（譲り）たい」「欲しい」相手が分からない。」

 以上の願いをマッチさせるためのアプリケーションを作りたいと思い，開発しています。

# DEMO
 ### Myページ
 https://gyazo.com/7351a4b4401d1998fa525f4ae842e855
 https://i.gyazo.com/b1be3f7bd7b329b1b04151364a44aa78.gif
 <a href="https://gyazo.com/7351a4b4401d1998fa525f4ae842e855"><video alt="Video from Gyazo" width="1000" autoplay muted loop playsinline controls><source src="https://i.gyazo.com/7351a4b4401d1998fa525f4ae842e855.mp4" type="video/mp4" /></video></a>
 https://i.gyazo.com/7351a4b4401d1998fa525f4ae842e855.mp4
 
 ### アイテム検索
 https://gyazo.com/b1be3f7bd7b329b1b04151364a44aa78

# 実装予定の機能
 - 購入予定者と出品者だけでコメントしあえる
 - 購入予約をすると，予約済みの表示がされるようにする
 - 出品物のサンプル画像をスライド表示する
 - 出品登録数に応じて，画面の表示を変える

# DB設計

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
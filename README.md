# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| second_name  | string | null: false |
| first_name   | string | null: false |
| birthday     | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ------     | -------------------------------|
| price               | integer    | null: false                    |
| image               | string     | null: false                    |
| item_name           | string     | null: false                    |
| item_exp            | text       | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| delivery_fee        | integer    | null: false                    |
| shipping_area       | string     | null: false                    |
| days_until_shipping | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -------------------------------|
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
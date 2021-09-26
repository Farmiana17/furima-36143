# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases
- has_one :send



## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_detail      | text       | null: false                    |
| price            | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| item_state_id    | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipment_area_id | integer    | null: false                    |
| spend_day_id     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## sends テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_number   | strign     | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | strign     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone         | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase



## purchases テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :send
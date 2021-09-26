# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases
- has_one :sends



## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_detail   | text       | null: false                    |
| price         | integer    | null: false                    |
| category      | string     | null: false                    |
| item_status   | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| shipment_area | string     | null: false                    |
| spend_days    | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchases



## sends テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_number | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | strign     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: true                     |
| phone       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| purchase    | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :purchases



## purchases テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchased_name | string     | null: false                    |
| purchased_item | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| send           | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :purchases
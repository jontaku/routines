# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |

### Association

- has_many :my_routines
- has_many :routines


## my_routines テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| routine_name   | string | null: false |
| reason         | text   | null: false |

### Association

- belongs_to :user

## routines テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| title              | string     | null: false                    |
| continued_time     | siring     | null: false                    |
| introduction       | text       | null: false                    |
| result             | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
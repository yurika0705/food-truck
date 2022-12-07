# README

# テーブル設計


## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |





## locations テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| place              | string     | null: false                    |
| address            | string     | null: false                    |
| contact_address    | string     | null: false                    |
| fee                | string     |                                |
| info               | text       |                                |
| image              | string     |                                |
| user               | references | null: false, foreign_key: true |
| comment            | references | foreign_key: true              |




## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| location           | references | null: false, foreign_key: true |


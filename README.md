## quizzesテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| question           | text    | null: false               |
| source_id          | integer | null: false               |
| card_name          | string  | null: false               |
| attack             | integer |                           |
| defense            | integer |                           |

### Association
- has_many :choices
- has_many :challengers

## challengersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| score       | integer    | null: false                    |
| quiz        | references | null: false, foreign_key: true |

### Association
- belongs_to :quiz

## choicesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| answer      | boolean    | default: false, null: false    |
| quiz        | references | null: false, foreign_key: true |

### Association
- belongs_to :quiz


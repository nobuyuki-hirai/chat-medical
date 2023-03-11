## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null, false               |
| first_name         | string | null, false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null, false               |
| job                | string | null, false               |
| hobby              | string | null, false               |
| context            | string | null, false               |

### Association

- has_many :rooms
- has_many :user_rooms
- has_many :messages
- has_many :relationships
- has_many :events

## roomsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null, false                    |
| user               | references | null, false, foreign_key: true |

### Association

- has_many :users
- has_many :user_rooms
- has_many :messages
- has_one  :event

## user_roomsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null, false, foreign_key: true |
| room               | references | null, false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## messagesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| context            | string     | null, false                    |
| user               | references | null, false, foreign_key: true |
| room               | references | null, false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## eventsテーブル

| Column            | Type        | Options                         |
| text              | string      | null. false                     |
| join              | integer     | null. false                     |
| user              | references  | null, false, foreign_key: true  |
| room              | references  | null, false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :room

## relationshipsテーブル

| Column            | Type        | Options                         |
| follower_id       | integer     | null. false, foreign_key: true  |
| followed_id       | integer     | null, false, foreign_key: true  |

### Association

- belongs_to :follower
- belongs_to :followed
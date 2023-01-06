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
| image              | text       |                                |
| user               | references | null: false, foreign_key: true |


## events テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| start_time         | datetime   | null: false                    |
| user               | references | null: false, foreign_key: true |
| location           | references | null: false, foreign_key: true |


# アプリケーション概要
キッチンカーのオーナーをターゲットにした出店可能な場所の共有とスケジュール管理ができるアプリです。

紹介資料・・・https://docs.google.com/document/d/1Y1YN-0f5Elj-_rML7QL7L3mEK9gYSC3TiTwTRjABGsc/edit?usp=sharing

# URL
https://food-truck.onrender.com

# テスト用アカウント
メールアドレス   aaa@111

パスワード      aaa111

# 機能一覧
　・ユーザー登録

　・出店場所投稿

　・出店場所のMAP表示

　・出店場所ごとのスケジュール表示

　・出店予定の登録

　・マイページで自身の予定一覧表示

# 作成背景

昨年、友人とキッチンカーの運営をしていた際に出店可能な場所を一から電話で探す必要がありとても時間がかかりました。また貸し出し側のダブルブッキングなどで出店ができなくなる事態も発生し、非常に困った事もありました。
そこで、地域のキッチンカーの出店場所と場所ごとの出店予定がオーナー同士で共有できるアプリケーションを開発することでこのような手間やミスが減るのではと考え、このアプリを作成しました。


# 実装予定の機能

　・予約管理機能の実装

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/78cc9043cc9518d5ef7a08924c6ca823.png)](https://gyazo.com/78cc9043cc9518d5ef7a08924c6ca823)

# 開発環境
　・Ruby(2.6.5)

　・Ruby on Rails(6.0.0)

　・Javascript

　　　・Google APIs

　　　　　・Geocoding API

　　　　　・Maps Javascript API

　・MySQL

　・Git/GitHub

　・Visual Studio Code

　・AWS

　・Render

# 主なGem (ライブラリ)
　・devise(ユーザー管理機能)

 ・simple_calendar(カレンダー作成)

　・active_hash(カテゴリ選択)

　・gon(JavaScriptへのデータ受け渡し)

　・rspec-rails(テストコード)

　・factory_bot_rails(テストデータ作成の効率化)

　・faker(ランダムデータ作成)

　・rubocop(静的コード解析,コードチェック)

　・aws-sdk-s3(AWS,S3)

# 利用インフラ
　・Render

# 工夫したポイント
　・GoogleMapAPIに事前に登録したデータを読み込ませた。(登録済みの住所から緯度や経度を算出し表示した)

　・予定をそれぞれの場所に紐づけることで場所ごとのカレンダーを実装した。

　・自身が登録した予定のみをマイページのカレンダーに紐付け表示させた。

　・投稿された場所が都道府県ごとにまとまって表示されるように振り分けた。

　・TOPページの背景の透かしが上の文字にまで適用されないように間にブロックを作った。(CSS)


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



アプリケーション名
FOOD TRUCK

アプリケーション概要
キッチンカーのオーナーをターゲットにした出店可能な場所の共有とスケジュール管理ができるアプリ。

URL
https://food-truck.onrender.com

テスト用アカウント


利用方法

  出店場所投稿
  1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う
  2.ヘッダーの「出店場所の登録」から登録画面へ遷移し、(画像・場所名・住所・連絡先)を入力し登録する

  出店予定の登録
  1.トップページから投稿された出店場所をクリック、詳細画面の「出店状況の確認」から予定(キッチンカー名・日時)を入力し登録

  自身の予定の一覧表示
  1.ヘッダーの「マイページ」からマイページに遷移すると自身の予定が全て表示される

アプリケーションを作成した背景
昨年、友人とキッチンカーの運営をしていた際に出店可能な場所を一から電話で探す必要があった。また貸し出し側のダブルブッキングなどで出店ができなくなる事態も発生していた。
そこで、地域のキッチンカーの出店場所と場所ごとの出店予定がオーナー同士で共有できるアプリケーションを開発することにした。

洗い出した要件


実装した機能についての画像やGIFおよびその説明


実装予定の機能
予約管理機能の実装

データベース設計


画面遷移図


開発環境


ローカルでの動作方法


工夫したポイント

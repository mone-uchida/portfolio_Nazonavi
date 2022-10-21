# なぞなび<span>　</span>![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/mone-uchida/portfolio_Nazonavi?style=flat-square)<span> </span>![GitHub last commit](https://img.shields.io/github/last-commit/mone-uchida/portfolio_Nazonavi?style=flat-square)<span> </span>
なぞなびとは、日本全国の謎解きイベントに関する情報系アプリーションです。
#### URL<span> </span>http://ec2-13-112-145-99.ap-northeast-1.compute.amazonaws.com
### 特徴
* 地図やキーワードからイベントを検索することができます。
* 気になるイベントをいいねして、マイページから見返すことができます。
* 投稿機能を使って、他のユーザーと感想を共有することも可能です。
### 使用例
<p align="center">
  <img src="https://user-images.githubusercontent.com/84611383/150291016-e02e6445-4b64-4e75-9372-36ecc0203b3f.gif" width="80%">
</p>

# 開発環境
* Ruby 3.0.1
* Ruby on Rails 6.1.4.1
* MySQL 5.7
* Nginx
* AWS
  * EC2
* Docker/Docker-compose
* CircleCI CI/CD
* Rspec
* Rubocop
* Google Maps API
  * Maps JavaScript API
  * Geocoding API

# 構成図
<p align="center">
  <img src="https://user-images.githubusercontent.com/84611383/149880143-f0dcaf4b-07fc-4266-aaba-7582f36832dc.png" width="70%">
</p>

# 機能
* ユーザー登録/ログイン機能
  * アイコン画像の選択 (React.js)
* イベントの検索
  * 地図検索
    * 地図表示 (Maps JavaScript API)
    * エリア検索 (Geocoding API)
  * キーワード検索
* イベントのいいね機能(Ajax)
* 投稿機能
  * 作成/編集/削除
* メニュー表示
  * プルダウン(React.js)

## テスト
* Rspec
  * 単体テスト(model)
  * 機能テスト(request) 
  * 統合テスト(feature)
* Rubocop

# 備考
* ゲスト用のログインアカウント (アプリケーション上でもご確認いただけます)
  *  email: guest@guest.com
  *  password: guest_password
* 現在掲載中のイベント情報は架空のものです。ご了承ください。

# 作成者
* 内田　望音

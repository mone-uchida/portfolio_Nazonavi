# なぞなび<span>　</span>![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/mone-uchida/portfolio_Nazonavi?style=flat-square)<span> </span>![GitHub last commit](https://img.shields.io/github/last-commit/mone-uchida/portfolio_Nazonavi?style=flat-square)<span> </span>![CircleCI](https://circleci.com/gh/mone-uchida/portfolio_Nazonavi.svg?style=svg&circle-token=a43d934c72e1ee08a63589ac8b79eb33e62b2768)
なぞなびとは、日本全国の謎解きイベントに関する情報サイトです。
### URL
http://ec2-13-112-145-99.ap-northeast-1.compute.amazonaws.com
### 特徴
* 地図やキーワードからイベントを検索することができます。
* 気になるイベントをいいねして、マイページから見返すことができます。
* 投稿機能を使って、他のユーザーと感想を共有することも可能です。
### 使用例
![アプリのデモンストレーション](https://user-images.githubusercontent.com/84611383/149773444-f532b01d-c096-4d19-908c-1171835f4c57.gif)

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

# 機能
* ユーザー登録/ログイン機能
* イベントの検索
  * 地図検索(googlemapAPI)
  * キーワード検索
* イベントのいいね機能(Ajax)
* 投稿機能
* メニュー表示 
  * プルダウン(React.js)

### テスト
* Rspec
  * 単体テスト(model)
  * 機能テスト(request) 
  * 統合テスト(feature)
* Rubocop

# Note
* ゲスト用のログインアカウント (アプリケーション上でもご確認いただけます)
  *  email: guest@guest.com
  *  password: guest_password

# 作成者
* 内田　望音

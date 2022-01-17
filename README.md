# なぞなび
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/mone-uchida/portfolio_Nazonavi?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/mone-uchida/portfolio_Nazonavi?style=flat-square)
なぞなびとは、日本全国の謎解きイベントに関する情報サイトです。  
日本全国の謎解きイベントについて、地図やキーワードから検索することができます。  
投稿機能を使うことで、イベントの情報をユーザー同士で共有することや、イベントの感想を記録することができます。

# DEMO
![アプリのデモンストレーション](https://user-images.githubusercontent.com/84611383/149773444-f532b01d-c096-4d19-908c-1171835f4c57.gif)

## URL
http://ec2-13-112-145-99.ap-northeast-1.compute.amazonaws.com

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
  * googlemapを利用した地図検索
  * キーワード検索
* イベントのいいね機能(Ajax)
* 投稿機能
* メニュー表示 
  * プルダウン(React.js)

# テスト
* Rspec
  * 単体テスト(model)
  * 機能テスト(request) 
  * 統合テスト(feature)
* Rubocop

# Note
* ゲスト用のログインアカウント
  *  email: guest@guest.com
  *  password: guest_password

# 作成者
* 内田　望音

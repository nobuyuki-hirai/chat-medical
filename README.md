# アプリケーション名
## Chat-Medical
 

# アプリケーション概要

 複数人でのチャット機能を使用し、情報共有などの連携をスムーズに図る事ができる。

 # URL

 https://chat-medical.onrender.com

 # テスト用アカウント
 * Basic認証 ID： medical
 * Basic認証パスワード： MC119
 * メールアドレス： kano@kano.com
 * パスワード： kano1234

 # 利用方法

 ## チャットルームの作成
 ---

 1.ログインボタンより上記アカウントでログインする。

 2.トップページの「ルーム作成」ボタンをクリックする。

 3.チャットルーム名と招待するユーザーを2名以上選択する。(画像は任意)

 4.項目を入力したら「ルーム作成」ボタンをクリックする。

 ## メッセージを送信する
 ---

 1.トップページのチャットルームをクリックする。

 2.メッセージ内容か画像を入力して送信ボタンをクリックする。

 ## 他ユーザーをフォローする
 ---
 1.チャットルーム内の参加しているユーザーのボタンをクリックする。

 2.ユーザーの詳細ページからフォローボタンをクリックする。

 # アプリケーションを作成した背景
 前職での課題として事業所間の連絡手段が電話かFAXしかなく、先方が事業所に居ない場合に連携が取れない事や同じ情報を複数人に連絡しないといけない課題を抱えていた。分析した結果、「複数人でチャット形式での連絡をする場がない」という事が必要であると考え、アプリケーション作成に至りました。

 # 洗い出した要件
 [要件を定義したシート](https://docs.google.com/spreadsheets/d/1nioWFYfJCy4cRa9NdtXipo7Nb49fZqp7OvvYzs79pls/edit#gid=982722306)

 # 実装した機能についての画像やGIFおよびその説明

 #### トップページの「ルーム作成」ボタンをクリックし、項目を入力しルーム作成をする。
[![Image from Gyazo](https://i.gyazo.com/45c8b952390118ae7c52a1126d95c18b.gif)](https://gyazo.com/45c8b952390118ae7c52a1126d95c18b)

 #### トップページに所属しているルームのみ表示され、ルームをクリックしチャットページに遷移する。
[![Image from Gyazo](https://i.gyazo.com/474feb3743fd63063a6b939cfd82e39a.gif)](https://gyazo.com/474feb3743fd63063a6b939cfd82e39a)

 #### メッセージと画像を送信する事ができる。参加ユーザーのマイページに遷移できる。
[![Image from Gyazo](https://i.gyazo.com/89df0376afe54a25fd0e6e17279ea84d.gif)](https://gyazo.com/89df0376afe54a25fd0e6e17279ea84d)

 #### フォローボタンでフォローと解除をする事ができ、フォローの一覧ページに遷移できる。
 [![Image from Gyazo](https://i.gyazo.com/80fa66c2517c41ec799473241af87bb0.gif)](https://gyazo.com/80fa66c2517c41ec799473241af87bb0)

 # 実施予定の機能
 * チャット機能とフォロー機能の非同期通信
 * イベント機能(カレンダーでイベントの共有)
 * フォローしている同士での個別チャット機能
 * 携帯への通知機能

 # データベース設計
 [![Image from Gyazo](https://i.gyazo.com/80199fad8aa58ef94b5d2efbcd187a40.png)](https://gyazo.com/80199fad8aa58ef94b5d2efbcd187a40)

 # 画面遷移図
 [![Image from Gyazo](https://i.gyazo.com/2d05be2359920809cc5fbdd1c274bd59.png)](https://gyazo.com/2d05be2359920809cc5fbdd1c274bd59)

 # 開発環境
 * MySQL
 * HTML/CSS
 * Ruby
 * Ruby on Rails
 * GitHub
 * Render
 * Visual Studio Code

# 工夫したポイント
 ***ユーザーが使用しやすい事を第一に考え開発しました。***

* ページが遷移できるボタンはカーソルがボタン上に置かれると浮き上がるように実装しました。
* 使い馴染みのあるチャットアプリに見た目を意識しました。
* カリキュラム外の内容を実装しました。(複数人でのチャット機能、フォロー機能、CSSの装飾)
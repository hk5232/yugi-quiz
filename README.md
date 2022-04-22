# アプリケーション名
 YUGI-Quiz

# アプリケーション概要
 遊戯王カードクイズアプリ

# URL
 GitHub https://github.com/hk5232/yugi-quiz <br>
 Heroku https://yugi-quiz.herokuapp.com/

# テスト用アカウント
- Basic認証ID ： admin
- Basic認証パスワード : pass

# 利用方法

トップページにて出題範囲、何問解くか、画像問題かテキスト問題かを選択する。<br>
スタートを押して３０秒が経過するか、選択した問題数を回答すれば終了。<br>
ヒントボタンを押すと、画像問題の場合テキストが、テキスト問題の場合画像が表示される。

# アプリケーションを作成した背景
近頃、新しい遊戯王アプリが開発され、にわかに遊戯王が盛り上がってきているのを体感し、遊戯王世代である自分自身や友人たちの間で昔のカードの話になることがあった。
現状カードの種類が１万種類をこえている中で、私たちの一番楽しかった時代の記憶を友達と共有し盛り上がりたいと思い、クイズアプリを作成した。

# 洗い出した要件
要件定義シート https://docs.google.com/spreadsheets/d/1ZDMKrgkPzOv5VOMWGwcprkIryv9cJ_okhIzAIIjxD4s/edit?usp=sharing

# 実装した機能についての画像

## スタート機能
・モンスター、魔法、罠、全てのうちから出題範囲を選択できる
・問題数を選択できる
・画像クイズかテキストクイズか選択できる
[![Image from Gyazo](https://i.gyazo.com/6d08943f7937b88286d415b471e45186.gif)](https://gyazo.com/6d08943f7937b88286d415b471e45186)

## 問題、解答、ヒント機能
・選んだ出題範囲からランダムに問題を選び、出題する
・選んだクイズ種類によって、画像かテキストどちらかのみ表示される
・フォームから選択でカード名を選択できる
・正解の他に３つ、出題範囲が同じものから解答がランダムに表示される
・ヒントボタンを押すと画像、もしくはテキストが表示される
[![Image from Gyazo](https://i.gyazo.com/70fa6d15c894e3f001fde5b378935966.gif)](https://gyazo.com/70fa6d15c894e3f001fde5b378935966)

## 結果表示機能
[![Image from Gyazo](https://i.gyazo.com/289a22a543d2073418a9bc7ecac287b2.png)](https://gyazo.com/289a22a543d2073418a9bc7ecac287b2)

# データベース設計
ER図
[![Image from Gyazo](https://i.gyazo.com/0da0626610a6961293759fc89dffb9cb.png)](https://gyazo.com/0da0626610a6961293759fc89dffb9cb)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/836ad981158f6c7d9adf4e686601b154.png)](https://gyazo.com/836ad981158f6c7d9adf4e686601b154)

# 開発環境
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code /

# 工夫したポイント
１つ目が時間制限のかけ方。<br>アクションを複数に分け、最初のアクション実行時にタイムをとり、以後他アクション実行時に最初のアクションのタイムとの差を求めることで時間制限をかけることに成功した。<br>
２つ目がsessionの使い方。<br>選択した出題範囲や答えなどをDBに保存するわけにはいかず、アクション間をsessionで仲介し、無事にデータの引き渡しを行うことに成功した。<br>
３つ目が問題や答えの取得について。データベースから問題や答えを持ってくる際にwhereで条件指定をし、更に最初に取得したものを除いた偽の答えの情報を取得し、１つにしてランダムに表示するのを工夫した。<br>
取得したデータが、ハッシュやアクティブコントローラーパラメータなどが混在してしまい、上手に表示するのに苦労した。

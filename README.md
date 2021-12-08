# easy_sugar_management(仮)
〜面倒くさがり屋の、面倒くさがり屋による、面倒くさがり屋のための糖質収支アプリ〜

## サービス概要
痩せたいけど食事を管理、制限することが面倒で難しいという悩みを持った人に、  
簡単でざっくりと楽しく糖質を管理、制限できる環境を提供する、  
糖質収支アプリです  
## メインのターゲットユーザー
* 痩せたいけど食事の自己管理が難しい人 
* 運動する時間が少なく、食事制限によって体型を改善したい人
## ユーザーが抱える課題
痩せたいと思っているけれど、運動する時間も少なく、食事制限をするしかないが、
* 糖質を計算したり管理するのが面倒で難しい
* 食欲に負け、食事の自己管理ができない、続かない
## 解決方法
* 糖質収支を、一食の摂取糖質から一食に必要な糖質を引いた値として考える
* 続けることは考えず一食一食の管理、制限を目指し、簡単な入力だけでその食事による自身の糖質収支が黒字か赤字かを判定
* 自己管理は難しいので誰かの目が必要。アプリ内、SNSで食事の写真と判定内容を投稿、共有する
## 実装予定の機能
* 一般ユーザー
    * 自身の年齢、性別、活動レベルの3つの質問の入力と食事の写真と写真の解析から出した選択肢から選択することで、その食事の糖質収支が黒字か赤字かジャッジされる機能
    * 判定内容をアプリ内で共有できる
    * 他のユーザーの判定内容を閲覧できる
* 管理ユーザー
    * ユーザーのCRUD
    * 食事の判定内容のCRUD
## 実装を検討中の機能
* ログインユーザー
    * ユーザー作成時に自身の年齢、性別、活動レベルをあらかじめ登録できる
    * 食事の写真と写真の解析から出した選択肢から選ぶだけで、その食事の糖質収支が黒字か赤字かジャッジされる機能
    * 判定内容をアプリ内、Twitterで共有できる
    * 他のユーザーの判定内容を閲覧できる
    * 自身の判定内容、累積収支を振り返られる機能、
    * 糖質破産と称して累積収支をリセットできる機能

## なぜこのサービスを作りたいのか？
私には食欲が抑えられず、ついついご飯おかわりなど、食べすぎてしまい太ってしまうという悩みがあります。学生の頃、糖質制限をおこない、半年で10キロ痩せた経験がありますが、その後2年でまた10キロ太ってしまいました。それなのに、面倒くさがり屋なので現在は運動や食事制限などはあまり続かず、習慣にするのにはハードルを感じています。自己管理だけじゃ続かないと考え、「簡単に緩くはじめられて、誰かの目を感じつつ、ネタにできるサービス」があったらいいなと思いこのサービスを作りたいと思いました。

## 画面遷移図
https://www.figma.com/file/pJCjl536ti0H8VD3bAlPsw/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0%3A1

## ER図
https://drive.google.com/file/d/1Uf8_xfh0YygcwGZJyayWt5hlNnyLW9HN/view?usp=sharing
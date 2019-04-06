# Moji-Uttan
復活の切り戻し

ServerConnection_with_Dockerブランチでやりたいこと

通信のお勉強をしたい
どこの画面で通信を発生させるか？
  一覧画面？
  詳細画面？
  
いまのアプリの作りだと一覧画面と詳細画面にサーバー接続を追加するのは難しい
そう、Realmで実装してるからね

パッと思いついたのは、各画面にサーバー接続用の新しくボタンを追加する　→　これで決定

    実装要件メモ
    
    TOP画面
      ・TOP画面にサーバー保存用の登録ボタンを追加
        登録ボタンをタップしたらメモ詳細画面を表示して登録した内容を表示させる
        サーバーに入力した内容を登録させる
      ・TOP画面にサーバー側に登録したメモを呼び出すボタンの追加
        サーバー登録メモ一覧ボタンをタップしたらサーバー側目の一覧画面に遷移すること
          ※画面は一覧画面を使う
      ・ローカル登録メモ一覧ボタンをタップしたらローカル側メモ一覧画面に遷移すること
        ※画面は一覧画面を使う
        
    メモ一覧画面
      ・TOP画面のローカル登録メモ一覧ボタンをタップしたらアプリ内DBで登録しているメモ一覧を表示させる
        ローカル登録メモ一覧のメモをタップ
          メモ詳細画面に遷移して内容をメモ詳細画面に表示させる
      ・TOP画面のサーバー登録メモ一覧ボタンをタップしたらサーバー側に登録しているメモ一覧を表示させる
        サーバー登録メモ一覧のメモをタップ
          メモ詳細画面に遷移して内容をメモ詳細画面に表示させる
      
     メモ詳細画面
      ・一覧画面でタップしたメモの内容を取得して表示させる
    
    

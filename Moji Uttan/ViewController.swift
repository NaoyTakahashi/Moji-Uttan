//
//  ViewController.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2018/11/17.
//  Copyright © 2018 高橋直也. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // ヘッダーの戻るボタンを青色にする
        self.navigationController?.navigationBar.tintColor = UIColor(named: "backBule")
        textViewSet() //textViewの枠線指定
         // 初回画面表示時はボタンを非活性にする
        buttonStateCheck() //outputButtonとdereteButtonnのボタン判定メソッド
        keybordSet() //キーボードにDoneボタンを追加
    }
    
        @objc func commitButtonTapped() {
            self.view.endEditing(true)
    }
    
    func keybordSet() {
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.commitButtonTapped))
        kbToolBar.items = [spacer, commitButton]
        textView.inputAccessoryView = kbToolBar
        textField.inputAccessoryView = kbToolBar
    }
    
    //textViewの枠線を指定する
    func textViewSet() {
        // 枠のカラー
        textView.layer.borderColor = UIColor(named: "textViewgrey")!.cgColor
        // 枠の幅
        textView.layer.borderWidth = 1.0
        // 枠を角丸にする場合
        textView.layer.cornerRadius = 10.0
        textView.layer.masksToBounds = true
        textView.textContainer.lineFragmentPadding = 8
    }
    
    //タイトル入力欄
    @IBOutlet weak var textField: UITextField!
    //文章入力欄
    @IBOutlet weak var textView: UITextView!
    //出力した文字列
    @IBOutlet weak var label: UILabel!
    //入力した文字を表示するボタン
    @IBOutlet weak var outputButton: UIButton!
    //表示している文字を消すボタン
    @IBOutlet weak var dereteButton: UIButton!

    // OutputボタンをタップしたときにtextFieldにある文字をsegueでOutputViewControllerに渡す処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? OutputViewController
        let _ = next?.view
        next?.viewLabel.text = textField.text
        next?.textViewOutput.text = textView.text
    }
    
    //テキストフィールド内がnilの場合ボタンを押せないようにするイベント
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        buttonStateCheck()// outputButtonとdereteButtonnのボタン判定メソッド
    }
    
    //テキストの文字数制限
    var maxLength: Int = 20

   // 適当な所でこのターゲットアクションを設定してください。
    @objc func textFieldEditingChanged(textField: UITextField) {
        guard let text = textField.text else { return }
        textField.text = String(text.prefix(maxLength))
   }
    
    //出力ボタン
    @IBAction func OutputButton(_ sender: UIButton) {
        seveHistory() //入力した文字を保存する
        performSegue(withIdentifier: "toOutputViewSegue", sender: nil)
        displayTextLabel() //displayTextLabelのメソッドを呼び出す
        buttonStateCheck()// outputButtonとdereteButtonnのボタン判定メソッド
    }
    
    //ViewController画面のテキストフィールドとラベルの処理
    func displayTextLabel() {
        label.text = textField.text //入力した文字を表示
        textField.text = nil //タイトル入力欄の文字を削除
        textView.text = nil //文章入力欄の文字を削除
        textField.endEditing(true) //キーボードを閉じる
    }
    
    //出力された文字列を削除するボタン
    @IBAction func DeleteButton(_ sender: UIButton) {
        label.text = "" //タイトルlabelの文字を削除
        buttonStateCheck()//ボタンの非活性判定まとめ
    }
    
    // outputButtonとdereteButtonnのボタン判定メソッド
    func buttonStateCheck(){
        outputButtonState()//textField内に文字がなければボタン非活性にする判定メソッド
        dereteButtonState()//labelに文字が入っていなければボタンを非活性にする判定メソッド
    }
    
    func seveHistory() {
        let getDate = dateFormat() //Date型をString型にフォーマットする
        let realm = try! Realm() //Realmをインスタンス化する
        let History = history() //Realm用に定義したhistory()をHistoryに代入
        History.date = getDate //返したgetDateをここで使う
        History.title = textField.text!
        History.textView = textView.text!
        try! realm.write {
            realm.add(History) //各変数に代入した値をRealmに書き込む
        }
        //Realmファイルの保存先を表示させる
        print(Realm.Configuration.defaultConfiguration.fileURL!) //Realmのファイルの場所を確認する
    }
    
    //Date型をString型にフォーマットする
    func dateFormat() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy/mm/dd HH:mm:ss"
        
        //String型に変換したDateを入れる
        let getDate = format.string(from: Date())
        print(getDate)
        
        //String型Dateを返す
        return getDate
    }
    
    
    //textField内に文字がなければボタン非活性にする判定メソッド
    func outputButtonState() {
        if textField.text == "" {
            outputButton.isEnabled = false
            outputButton.setTitleColor(UIColor.lightGray, for: .disabled)  //非活性時は灰色にする
        } else {
            outputButton.isEnabled = true
        }
    }
    
    //labelに文字が入っていなければボタンを非活性にする判定メソッド
    func dereteButtonState() {
        if label.text == "" {
            dereteButton.isEnabled = false
            dereteButton.setTitleColor(UIColor.lightGray, for: .disabled)
        } else {
            dereteButton.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}


//
//  historyViewController.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2018/12/28.
//  Copyright © 2018 高橋直也. All rights reserved.
//

import UIKit
import RealmSwift

    //メモ：UIViewControllerを使ってTableViewを追加するときははUITableViewDelegate, UITableViewDataSourceが必要
class historyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    //RealmのオブジェクトをResults型に入れておく
    var historyItem: Results<history>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ClassにUITableViewDelegate, UITableViewDataSourceを追加したらviewDidLoadにこれを追加する
        historyTable.dataSource = self
        historyTable.delegate = self
        
        do{
            let realm = try Realm()
            historyItem = realm.objects(history.self)
            historyTable.reloadData()
        }catch{
            
        }
    }
    
    //これはよくわかってない
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TableViewをOutletする
    @IBOutlet weak var historyTable: UITableView!
   
    //tableViewのCellの数の設定をする
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Realmに登録されているオブジェクトの数をカウントしてCell生成の数を戻り値にして返す
        return historyItem.count
    }
    
    //セクションの数を設定する・・・セクションとは？
    func numberOfSections(in tableView: UITableView) -> Int {
        //tableViewにセクションの数1を戻り値にして返す
        return 1
    }

    //TableViewのなかで一番重要な設定場所らしい
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ここでindexViewのCellについて何かを設定している　多分indexPathを指定？してる　配列とかかも
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Realmオブジェクトが入っているhistoryItemをobjectに代入する
        let object = historyItem[indexPath.row]
        //historyItemの中にあるtitleをcellのtextLabelに代入する
        cell.textLabel?.text = object.title
        
        //tableViewにcellの中身を戻り値にして返す
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toDetail",sender: nil)
        
    }
    
    // OutputボタンをタップしたときにtextFieldにある文字をsegueでOutputViewControllerに渡す処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetail") {
        let next = segue.destination as? detailHistoryViewController
        let _ = next?.view
        next?.titleDetailView.text = historyItem[0].title
        next?.textDetailView.text = historyItem[0].textView
        }
    }
}

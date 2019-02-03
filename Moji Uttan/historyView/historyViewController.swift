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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ClassにUITableViewDelegate, UITableViewDataSourceを追加したらviewDidLoadにこれを追加する
        historyTable.dataSource = self
        historyTable.delegate = self
    }
    
    //これはよくわかってない
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //RealmのオブジェクトをResults型に入れておく
    var hitorydate: Results<history>!
    
    //TableViewをOutletする
    @IBOutlet weak var historyTable: UITableView!
   
    //tableViewのCellの数の設定をする
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableViewにcellの数5を戻り値にして返す
        return 5
    }
    
    //セクションの数を設定する・・・セクションとは？
    func numberOfSections(in tableView: UITableView) -> Int {
        //tableViewにセクションの数1を戻り値にして返す
        return 1
    }
    
    //TableViewのなかで一番重要な設定場所らしい
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //StoryboardのtableViewCellで指定したcellの中に文字を代入するやつ
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "swift"
        
        //tableViewにcellの中身を戻り値にして返す
        return cell
        
    }
        
    

}

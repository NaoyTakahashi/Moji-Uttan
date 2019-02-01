//
//  historyViewController.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2018/12/28.
//  Copyright © 2018 高橋直也. All rights reserved.
//

import UIKit
import RealmSwift

class historyViewController: UITableViewController  {
    
    var hitorydate: Results<history>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 永続化されているデータを取りだす
        do{
            let realm = try Realm()
            hitorydate = realm.objects(history.self)
            tableView.reloadData()
        }catch{
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return hitorydate.count
    }
    
    internal override func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        let object = hitorydate[indexpath.row]
        
        cell.textLabel?.text = object.title
        return cell
    }
    

}

//
//  history_db.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2018/12/21.
//  Copyright © 2018 高橋直也. All rights reserved.
//

import Foundation
import RealmSwift

class history: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var date : String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var textView: String = ""
    
//    // データを保存。
//    func save() {
//        let realm = try! Realm()
//        if realm.isInWriteTransaction {
//            if self.id == 0 { self.id = self.createNewId() }
//            realm.add(self, update: true)
//        } else {
//            try! realm.write {
//                if self.id == 0 { self.id = self.createNewId() }
//                realm.add(self, update: true)
//            }
//        }
//    }
//
//    // 新しいIDを採番します。
//    private func createNewId() -> Int {
//        let realm = try! Realm()
//        return (realm.objects(type(of: self).self).sorted(byKeyPath: "id", ascending: false).first?.id ?? 0) + 1
//    }
//
    //プライマリーキーを設定
    override static func primaryKey() -> String? {
        return "id"
    }
    
}


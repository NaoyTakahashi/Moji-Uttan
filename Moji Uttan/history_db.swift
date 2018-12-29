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
    @objc dynamic var date : String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var textView: String = ""
}

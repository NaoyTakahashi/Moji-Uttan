//
//  HelpViewController.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2018/11/24.
//  Copyright © 2018 高橋直也. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var BackToTop: UIButton!
    
    //前の画面に戻る
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

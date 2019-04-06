//
//  detailHistoryView.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2019/02/09.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import UIKit

class detailHistoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewOutputSet()
        viewLabelSet()
    }

    //viewLabelsetの枠線を指定する
    func viewLabelSet(){
        //文字入力位置の変更
        titleDetailView.textContainer.lineFragmentPadding = 8
    }
    
    //textViewOutputSetの枠線を指定する
    func textViewOutputSet() {
        //文字入力位置の変更
        textDetailView.textContainer.lineFragmentPadding = 8
    }
    
    @IBOutlet weak var hoge: UINavigationBar!
    @IBOutlet weak var titleDetailView: UITextView!
    @IBOutlet weak var textDetailView: UITextView!
    
//    //前の画面に戻る
//    @IBAction func backView(){
//        self.navigationController?.popViewController(animated: true)
//        viewLabel.text = nil
//    }
//    
    
    

}

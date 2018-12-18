//
//  OutputViewController.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2018/11/24.
//  Copyright © 2018 高橋直也. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewOutputSet()
        viewLabelSet()
    }
    
    //viewLabelsetの枠線を指定する
    func viewLabelSet(){
        //文字入力位置の変更
        viewLabel.textContainer.lineFragmentPadding = 8
    }
    
    //textViewOutputSetの枠線を指定する
    func textViewOutputSet() {
        //文字入力位置の変更
        textViewOutput.textContainer.lineFragmentPadding = 8
    }
    
    @IBOutlet weak var viewLabel: UITextView!
    @IBOutlet weak var textViewOutput: UITextView!
    @IBOutlet weak var backToTop: UIButton!
    
    //前の画面に戻る
    @IBAction func backView(){
        self.navigationController?.popViewController(animated: true)
        viewLabel.text = nil
    }
    
}

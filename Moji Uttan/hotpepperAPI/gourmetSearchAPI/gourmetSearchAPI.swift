//
//  gourmetSearchAPI.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2019/05/28.
//  Copyright © 2019 高橋直也. All rights reserved.
//

import Foundation

class HTTPClient {
    func get() {
        //URLSessionの設定らへん
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        let url: URL = URL(string: "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=0420906d54ca1f9a&large_area=Z011&count=11&format=json")!
        
        //URLSessionでRequestとResponseをやっているところ
        let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let taskData = data else {return}
            let str: String = String(data: taskData, encoding: .utf8)!
            print(str)
            
        })
        task.resume()
    }
}

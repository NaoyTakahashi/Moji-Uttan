//
//  transitionProtocol.swift
//  Moji Uttan
//
//  Created by 高橋直也 on 2018/12/29.
//  Copyright © 2018 高橋直也. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboardName: String { get }
    static var bundle: Bundle? { get }
}

extension StoryboardInstantiable where Self: UIViewController {
    static var bundle: Bundle? {
        return nil
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

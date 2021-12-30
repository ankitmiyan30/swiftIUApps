//
//  MainTabBarViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 17/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let items = self.tabBar.items {
            for item in items {
                item.title = ""
            }
        }
    }
    
    
}

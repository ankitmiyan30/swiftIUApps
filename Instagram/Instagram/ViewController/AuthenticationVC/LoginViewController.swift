//
//  LoginViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class LoginViewController: InstagramBaseViewController {

    var isUserLogin = true
    override func viewDidLoad() {
        super.viewDidLoad()
//        InstagramHelper.screenBackground(view: self.view)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if(isUserLogin){
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "TabBarStoryboard", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
            let window = UIApplication.shared.windows.first { $0.isKeyWindow }
            window!.rootViewController = vc
            
//            let storyboard = UIStoryboard(name: "TabBarStoryboard", bundle: nil)
//            let dashBoard = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController")
//            let window = UIApplication.shared.windows.first { $0.isKeyWindow }
//            window!.rootViewController = dashBoard
        }
    }

}

//
//  RegisterViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class RegisterViewController: InstagramBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "TabBarStoryboard", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window!.rootViewController = vc
    }

}

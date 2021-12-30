//
//  ViewController.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 22/09/20.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet var gifImageView: UIImageView!
    @IBOutlet var signButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupSigIn()
        let jeremyGif = UIImage.gifImageWithName("login-anim")
        gifImageView.image = jeremyGif
        GIDSignIn.sharedInstance()?.presentingViewController = self
        if GIDSignIn.sharedInstance()?.currentUser != nil {
        
        } else {
            GIDSignIn.sharedInstance()?.signIn()
        }
    }
    
    

}


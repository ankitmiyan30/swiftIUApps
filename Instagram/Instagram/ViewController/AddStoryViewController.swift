//
//  AddStoryViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 18/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class AddStoryViewController: InstagramBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        addHeaderActionView()
        swipeGestureSetup()
//        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 2
//        if UIDevice.current.userInterfaceIdiom == .pad{
//            self.revealViewController().rearViewRevealWidth = self.view.frame.width / 2
//        }else{
//            self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
//        }
//        self.revealViewController().panGestureRecognizer().isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func swipeGestureSetup(){
        let swipeToLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeToLeft.direction = .left
        InstagramHelper.controllerLeftToRightNavigation(view: self.view)
        self.view.addGestureRecognizer(swipeToLeft)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended {
            switch sender.direction {
            case .left:
                self.closePopTap()
                break
            default:
                break
            }
        }
    }
    
    func addHeaderActionView(){
        let width = self.view.frame.width
        let headerView = UIView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 40))
        headerView.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.view.addSubview(headerView)
        
        let settingButton = UIImageView(frame: CGRect(x: 15, y: 5, width: 30, height: 30))
        settingButton.tintColor = .white
        settingButton.tag = 1
        settingButton.image = UIImage(systemName: "gear")
        headerView.addSubview(settingButton)
        
        let flashButton = UIImageView(frame: CGRect(x: self.view.center.x - 15, y: 5, width: 30, height: 30))
        flashButton.tintColor = .white
        flashButton.tag = 2
        flashButton.image = UIImage(systemName: "flashlight.off.fill")
        headerView.addSubview(flashButton)
        
        let closeButton = UIImageView(frame: CGRect(x: width - 50, y: 5, width: 30, height: 30))
        closeButton.tintColor = .white
        closeButton.tag = 3
        closeButton.image = UIImage(systemName: "xmark")
        headerView.addSubview(closeButton)
        
        let tapGestureRecognizerSetting = UITapGestureRecognizer(target: self, action: #selector(settingTap))
        settingButton.isUserInteractionEnabled = true
        settingButton.addGestureRecognizer(tapGestureRecognizerSetting)
        
        let tapGestureRecognizerFlashLight = UITapGestureRecognizer(target: self, action: #selector(flashLightTap))
        flashButton.isUserInteractionEnabled = true
        flashButton.addGestureRecognizer(tapGestureRecognizerFlashLight)
        
        let tapGestureRecognizerPopScreen = UITapGestureRecognizer(target: self, action: #selector(closePopTap))
        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(tapGestureRecognizerPopScreen)
    }
    
    @objc func settingTap(){
        print("Setting")
    }
    
    @objc func closePopTap(){
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func flashLightTap(){
        print("flashTap")
    }
}

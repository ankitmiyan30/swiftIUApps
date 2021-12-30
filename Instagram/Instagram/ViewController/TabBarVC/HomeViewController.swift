//
//  HomeViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit
import FirebaseAuth
class HomeViewController: InstagramBaseViewController {
    
    private let homeTableView: UITableView = {
        let tablveView = UITableView()
        return tablveView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Instagram"
        addNavigationBarItems()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: AllStoryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AllStoryTableViewCell.identifier)
        homeTableView.register(UINib(nibName: InstagramFeedTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: InstagramFeedTableViewCell.identifier)
        self.view.addSubview(homeTableView)
        swipeGestureSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        verifyAuth()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    func swipeGestureSetup(){
        let swipeToLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeToLeft.direction = .left
        self.view.addGestureRecognizer(swipeToLeft)
        
        let swipeToRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeToRight.direction = .right
        self.view.addGestureRecognizer(swipeToRight)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended {
            switch sender.direction {
            case .left:
                self.messagerList()
                break
            case .right:
                self.addStroyScreen()
            default:
                break
            }
        }
    }
    
    
    
    func addNavigationBarItems(){
//        let cameraButton = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(SWRevealViewController.revealToggle(_:)))
//        cameraButton.target = revealViewController()
//        cameraButton.tintColor = .black
//        self.navigationItem.leftBarButtonItem  = cameraButton
//         self.revealViewController().panGestureRecognizer().isEnabled = true
        let cameraButton = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(addStroyScreen))
        cameraButton.tintColor = .black
        self.navigationItem.leftBarButtonItem  = cameraButton
        
        let messageScreen = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: #selector(self.messagerList))
        messageScreen.tintColor = .black
        self.navigationItem.rightBarButtonItem  = messageScreen
    }
    
    @objc func addStroyScreen() {
        let storyBoard = UIStoryboard(name: "TabBarStoryboard", bundle: nil)
        let messagerListVC = storyBoard.instantiateViewController(identifier: "AddStoryViewController") as! AddStoryViewController
        InstagramHelper.controllerLeftToRightNavigation(view: self.view)
        self.navigationController?.pushViewController(messagerListVC, animated: false)
    }
    
    @objc func messagerList() {
        let storyBoard = UIStoryboard(name: "ChatScreen", bundle: nil)
        let messagerListVC = storyBoard.instantiateViewController(identifier: "MessagersListViewController") as! MessagersListViewController
        self.navigationController?.pushViewController(messagerListVC, animated: true)
    }
    
    func verifyAuth(){
        if Auth.auth().currentUser == nil {
            //            let loginVC = LoginViewController()
            //            loginVC.modalPresentationStyle = .fullScreen
            //            present(loginVC, animated: false)
            
            //            let authSB = UIStoryboard(name: "Authentication", bundle: nil)
            //            let lgoinVc = authSB.instantiateViewController(identifier: "LoginViewController")
            //            navigationController?.present(lgoinVc, animated: false)
            
            //            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
            //            let vc = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            //            let window = UIApplication.shared.windows.first { $0.isKeyWindow }
            //            window!.rootViewController = vc
        }
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 100
        }
        return 285
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = homeTableView.dequeueReusableCell(withIdentifier: AllStoryTableViewCell.identifier, for: indexPath) as! AllStoryTableViewCell
            return cell
        } else {
             let cell = homeTableView.dequeueReusableCell(withIdentifier: InstagramFeedTableViewCell.identifier, for: indexPath) as! InstagramFeedTableViewCell
            return cell
        }
    }
    
    
}

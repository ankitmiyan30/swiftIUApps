//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class ProfileViewController: InstagramBaseViewController {

    @IBOutlet weak var profileTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ankit_singh"
        addNavigationBarItems()
        profileTableView.register(UINib(nibName: TopViewTableCellTableViewCellTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TopViewTableCellTableViewCellTableViewCell.identifier)
        
        self.profileTableView.estimatedRowHeight = 44.0;
        self.profileTableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    

    func addNavigationBarItems(){
        let messageScreen = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(self.rightDrawerMenu))
        messageScreen.tintColor = .black
        self.navigationItem.rightBarButtonItem  = messageScreen
    }

    @objc func rightDrawerMenu(){
        
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: TopViewTableCellTableViewCellTableViewCell.identifier) as! TopViewTableCellTableViewCellTableViewCell
        return cell
    }
    
    
}

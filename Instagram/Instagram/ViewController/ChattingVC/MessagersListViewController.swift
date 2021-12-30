//
//  MessagersListViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 17/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class MessagersListViewController: InstagramBaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var messagersTableView: UITableView!
    let userNameArray = ["ankit","rohit","mohit","jay","anthony","jack","rayn","prithvi","khal","jan", "fan"]
    var searchedUserName = [String]()
    var searching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        addBackButton()
        addNavItem()
        messagersTableView.register(UINib(nibName: MessagerListCell.identifier, bundle: nil), forCellReuseIdentifier: MessagerListCell.identifier)
    }
    
    func addNavItem(){
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        searchButton.setImage(UIImage(systemName: "video"), for: .normal)
        searchButton.addTarget(self, action: #selector(self.groupVideoCall), for: .touchUpInside)
        
        let ref = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        ref.setImage(UIImage(systemName: "pencil.circle"), for: .normal)
        ref.addTarget(self, action: #selector(self.groupChat), for: .touchUpInside)
        self.navigationItem.rightBarButtonItems  = [ UIBarButtonItem(customView: ref), UIBarButtonItem(customView: searchButton)]
    }
    
    @objc func groupVideoCall(){
        
    }
    
    @objc func groupChat(){
    
    }

}

extension MessagersListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedUserName.count
        } else {
            return userNameArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messagersTableView.dequeueReusableCell(withIdentifier: MessagerListCell.identifier, for: indexPath) as! MessagerListCell
        if searching {
            cell.userNameTF.text = searchedUserName[indexPath.row]
        } else {
            cell.userNameTF.text = userNameArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "ChatScreen", bundle: nil)
        let chatScreenVC = storyBoard.instantiateViewController(identifier: "ChatScreenViewController") as! ChatScreenViewController
        if(searchedUserName.count > 0){
            chatScreenVC.userName = searchedUserName[indexPath.row]
        }else {
            chatScreenVC.userName = userNameArray[indexPath.row]
        }
        self.navigationController?.pushViewController(chatScreenVC, animated: true)
    }
}

extension MessagersListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedUserName = userNameArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        messagersTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        messagersTableView.reloadData()
        self.searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.searchBar.endEditing(true)
    }
    
}

//
//  NotificationViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class NotificationViewController: InstagramBaseViewController {

    @IBOutlet weak var acitvityTableViewController: UITableView!
    
    let headerViewString:[String]  = ["This Month", "Suggestion for you"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Activity"
        registerCell()
        // Do any additional setup after loading the view.
    }

    func registerCell(){
        acitvityTableViewController.register(UINib(nibName: ActivityTableSuggestionsViewCell.identifier, bundle: nil), forCellReuseIdentifier: ActivityTableSuggestionsViewCell.identifier)
    }
}

extension NotificationViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerViewString.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        headerView.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 4, y: 10, width: headerView.frame.width, height: 40))
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.textColor = .black
        label.text = headerViewString[section]
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = acitvityTableViewController.dequeueReusableCell(withIdentifier: ActivityTableSuggestionsViewCell.identifier, for: indexPath) as! ActivityTableSuggestionsViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
           // print("this is the last cell")
            let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))

            self.acitvityTableViewController.tableFooterView = spinner
            self.acitvityTableViewController.isHidden = false
        }
    }
    
}

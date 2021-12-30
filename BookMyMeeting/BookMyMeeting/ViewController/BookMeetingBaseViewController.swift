//
//  BookMeetingBaseViewController.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 22/09/20.
//

import UIKit
public let kBaseNavigationBarTintColor = UIColor(red: 255.0 / 255.0, green: 99.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
class BookMeetingBaseViewController: UIViewController {

   
    let kBaseNavigationBarTintColor = UIColor(red: 255.0 / 255.0, green: 99.0 / 255.0, blue: 71.0 / 255.0, alpha: 1.0)
    let kBaseNavigationBarTitleColor = UIColor(red: 35.0 / 255.0, green: 31.0 / 255.0, blue: 32.0 / 255.0, alpha: 1.0)

    var filterButton:UIBarButtonItem? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.setupNavigationColor()

       // self.view.localizeAllSubView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupNavigationColor(){
        if let navigationBar = self.navigationController?.navigationBar{
            navigationBar.barTintColor = kBaseNavigationBarTintColor
            navigationBar.isTranslucent = true
            navigationBar.tintColor = .white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            , NSAttributedString.Key.font: UIFont(name: "Savoye Let", size: 28)!
        }
    }

    func addBackButton() {
        let editButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backAction))
        self.navigationItem.leftBarButtonItem  = editButton
    }

    @objc func backAction() -> Void {

        if self.presentingViewController == nil{
            self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}

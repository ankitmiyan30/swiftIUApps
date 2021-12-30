//
//  MainViewController.swift
//  Example
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import BLTNBoard
import TTGSnackbar
class MainViewController: UIViewController {

    private lazy var boardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Done")
        item.image = UIImage(named: "approved")
        item.actionButtonTitle = "Continue To Other"
//        item.alternativeButtonTitle = "Maybe Latter"
        item.descriptionText = "Payment Completed"
        item.actionHandler = {_ in
            self.continueClicked()
        }
        item.alternativeHandler = {_ in
            self.skipClicked()
        }
        item.appearance.titleTextColor = .gray
        item.appearance.actionButtonColor = .systemGreen
        return BLTNItemManager(rootItem: item)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bottomCardView(_ sender: Any) {
        boardManager.showBulletin(above: self)
    }
    
    func continueClicked() {
        print("Continue")
    }
    
    func skipClicked(){
        print("skip")
    }
    
    @IBAction func launchSnackBar(_ sender: Any) {
//        let snackbar = TTGSnackbar(message: "Cool !", duration: .short)
//        snackbar.show()
//        let snackbar = TTGSnackbar(
//            message: "Payment Success",
//            duration: .middle,
//            actionText: "Ok",
//            actionBlock: { (snackbar) in
//                print("OK")
//            }
//        )
//        snackbar.show()
        
//        let snackbar = TTGSnackbar(message: "Are you agree", duration: .long)
//
//        // Action 1
//        snackbar.actionText = "Yes"
//        snackbar.actionTextColor = UIColor.green
//        snackbar.actionBlock = { (snackbar) in NSLog("Click Yes !") }
//
//        // Action 2
//        snackbar.secondActionText = "No"
//        snackbar.secondActionTextColor = UIColor.yellow
//        snackbar.secondActionBlock = { (snackbar) in NSLog("Click No !") }
//
//        snackbar.show()
        
        let snackbar = TTGSnackbar(
            message: "Please wait a while",
            duration: .forever,
            actionText: "OK",
            actionBlock: { (snackbar) in
                print("Click action!")
                // Dismiss manually after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
                    snackbar.dismiss()
                }
            }
        )
        snackbar.show()
    }
    
    
}

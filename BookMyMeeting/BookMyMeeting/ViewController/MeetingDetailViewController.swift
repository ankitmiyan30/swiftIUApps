//
//  MeetingDetailViewController.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 23/09/20.
//

import UIKit
import BLTNBoard
import TTGSnackbar
class MeetingDetailViewController: BookMeetingBaseViewController {
    
    private lazy var boardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Delete")
    
        item.image = UIImage(named: "delete")
        item.actionButtonTitle = "Delete"
        item.alternativeButtonTitle = "Cancel"
        item.descriptionText = "Are you sure?"
        item.actionHandler = {_ in
            self.continueClicked()
            self.dismiss(animated: true)
        }
        item.alternativeHandler = {_ in
            self.skipClicked()
            self.dismiss(animated: true)
        }
        item.appearance.titleTextColor = .black
        item.appearance.actionButtonColor = .red
        return BLTNItemManager(rootItem: item)
    }()
//    YES / NO /  Not Responded
    
    @IBOutlet weak var durationTV: UILabel!
    @IBOutlet weak var responseTV: UILabel!
    @IBOutlet weak var locationTV: UILabel!
    @IBOutlet weak var hostNameTV: UILabel!
    @IBOutlet weak var meetingTitleTV: UILabel!
    @IBOutlet weak var memberTableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    var meetingObject:Meeting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Joinee introduction with all employee sfsgas sd fa fsdadfa"
        addBackButton()
        hidKeyBoardOnScreenTap()
        setupEditButton()
        addNavigationBarItems()
        updateUI()
    }
    
    func setupEditButton(){
        editButton.backgroundColor = kBaseNavigationBarTintColor
        editButton.layer.cornerRadius = 4
        editButton.layer.shadowOpacity = 0.25
    }
    
    func updateUI(){
        meetingTitleTV.text = meetingObject.meetingTitle
        hostNameTV.text = meetingObject.hostEmail
        locationTV.text = meetingObject.location
        durationTV.text = meetingObject.startTime + " To " + meetingObject.endTime
        if meetingObject.meetingResponse == 0 {
            responseTV.text = "Yes"
        } else if meetingObject.meetingResponse == 1 {
            responseTV.text = "No"
        } else {
            responseTV.text = "Not Responded"
        }
    }
    @IBAction func editMeetingAction(_ sender: Any) {
//        let nextSVC = EditMeetingSwiftUIView()
//        let host = UIHostingController(rootView: nextSVC)
//        navigationController?.pushViewController(host, animated: true)
    }
    
    func addNavigationBarItems(){
//        let cameraButton = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(SWRevealViewController.revealToggle(_:)))
//        cameraButton.target = revealViewController()
//        cameraButton.tintColor = .black
//        self.navigationItem.leftBarButtonItem  = cameraButton
//         self.revealViewController().panGestureRecognizer().isEnabled = true
        
        let messageScreen = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(self.deleteMeeting))
        messageScreen.tintColor = .white
        self.navigationItem.rightBarButtonItem  = messageScreen
    }
    
    @objc func deleteMeeting(){
        boardManager.showBulletin(above: self)
    }
    
    func continueClicked() {
        boardManager.dismissBulletin()
        if FireDBHelper.firebaseDBHelper.removeEvent(id: meetingObject.meetingId) {
            showAlertMessage(message: "Meeting Deleted.")
            self.navigationController?.popViewController(animated: true)
        } else {
            showAlertMessage(message: "Meeting not delete, Try again.")
        }
    }
    
    func showAlertMessage(message:String) {
        let snackbar = TTGSnackbar(message: message, duration: .short)
        snackbar.show()
    }
    
    func skipClicked(){
        boardManager.dismissBulletin()
    }
    
}

extension MeetingDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetingObject.guests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberTableView.dequeueReusableCell(withIdentifier: "meetingmembername", for: indexPath)
        cell.textLabel?.text = meetingObject.guests[indexPath.row]
        cell.textLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 11)
        return cell
    }
}

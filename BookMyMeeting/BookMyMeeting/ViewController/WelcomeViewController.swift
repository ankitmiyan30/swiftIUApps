//
//  WelcomeViewController.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 22/09/20.
//

import UIKit
import SwiftyJSON
import SwiftUI
import FirebaseDatabase
import GoogleSignIn
class WelcomeViewController: BookMeetingBaseViewController {

    @IBOutlet weak var addNewMeetingButton: UIButton!
    @IBOutlet weak var homeTableView: UITableView!
    var employeeObject = [Employee]()
    var meetingObject = [Meeting]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMeetingButton()
        registerForNib()
        addNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getListOfEvent()
    }
    
    func addNavigationBarItems(){
        let messageScreen = UIBarButtonItem(image: UIImage(systemName: "signpost.left"), style: .plain, target: self, action: #selector(self.logout))
        messageScreen.tintColor = .white
        self.navigationItem.rightBarButtonItem  = messageScreen
    }
    
    @objc func logout(){
        GIDSignIn.sharedInstance()?.signOut()
        self.navigationController?.popViewController(animated: true)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print(GIDSignIn.sharedInstance()?.currentUser != nil) // false - signed out
        print(user)
        // Remove any data saved to your app obtained from Google's APIs for this user.
    }
    
    func getListOfEvent(){
        self.meetingObject = []
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("meeting").observeSingleEvent(of: .value, with: { [self] snapshot in
            guard let arrayOfEvent = snapshot.value as? [String: [String:Any]] else {
                print("Data not fetched")
                return
            }
            for array in arrayOfEvent {
                if let meetingDict = array.value as? [String:Any] {
                    let meeting = Meeting(meetingTitle: meetingDict["meeting_title"] as! String, hostEmail: meetingDict["host_email"] as! String, startTime: meetingDict["startTime"] as! String, endTime: meetingDict["endTime"] as! String, location: meetingDict["location"] as! String, guests: meetingDict["guests"] as! [String], meetingResponse: meetingDict["meetingResponse"] as! Int, meetingId: array.key)
                    self.meetingObject.append(meeting)
                }
            }
            self.homeTableView.reloadData()
        })
    }
    
    func setupMeetingButton(){
        addNewMeetingButton.backgroundColor = kBaseNavigationBarTintColor
        addNewMeetingButton.layer.cornerRadius = addNewMeetingButton.frame.height / 2
        addNewMeetingButton.layer.shadowOpacity = 0.25
    }
    
    func registerForNib(){
        homeTableView.register(UINib(nibName: MeetingTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MeetingTableViewCell.identifier)
    }

    @IBAction func addNewMeetingAction(_ sender: Any) {
        _ = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard?.instantiateViewController(identifier: "AddNewMeetingViewController") as! AddNewMeetingViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension WelcomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetingObject.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: MeetingTableViewCell.identifier, for: indexPath) as! MeetingTableViewCell
        cell.meetingObject = meetingObject[indexPath.row]
        cell.updateCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard?.instantiateViewController(identifier: "MeetingDetailViewController") as! MeetingDetailViewController
        viewController.meetingObject = meetingObject[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

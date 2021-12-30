//
//  MeetingTableViewCell.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 22/09/20.
//

import UIKit
import TTGSnackbar

class MeetingTableViewCell: UITableViewCell {

    @IBOutlet weak var meetingResponseSegment: UISegmentedControl!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var endTimeText: UILabel!
    @IBOutlet weak var startTimeText: UILabel!
    @IBOutlet weak var locationText: UILabel!
    @IBOutlet weak var hostNameText: UILabel!
    @IBOutlet weak var meetingTitleText: UILabel!
    @IBOutlet weak var mainContainerView: UIView!
    var meetingObject:Meeting!
    static let identifier = "MeetingTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        mainContainerView.layer.shadowColor = UIColor.black.cgColor
        mainContainerView.layer.shadowOpacity = 0.5
        mainContainerView.layer.shadowOffset = .zero
        mainContainerView.layer.shadowRadius = 5
        meetingResponseSegment.layer.borderWidth = 1
        meetingResponseSegment.layer.borderColor = UIColor.gray.cgColor
        meetingResponseSegment.layer.cornerRadius = 4
    }

    func updateCell() {
        meetingTitleText.text = meetingObject.meetingTitle
        hostNameText.text = meetingObject.hostEmail
        startTimeText.text = meetingObject.startTime
        endTimeText.text = meetingObject.endTime
        locationText.text = meetingObject.location
        memberCountLabel.text = "\(meetingObject.guests.count + 1) Member(s)"
        if meetingObject.meetingResponse == 0 {
            meetingResponseSegment.selectedSegmentIndex = 0
        } else if meetingObject.meetingResponse == 1 {
            meetingResponseSegment.selectedSegmentIndex = 1
        }
    }
    
    @IBAction func meetingAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                updateMeetingAction(index: 0)
            case 1:
                updateMeetingAction(index: 1)
            default:
                break;
            }
    }
    
    func updateMeetingAction(index:Int) {
        if FireDBHelper.firebaseDBHelper.updateEvent(object: getObjectData(index: index), id: meetingObject.meetingId) {
            showAlertMessage(message: "Meeting responded.")
        } else {
            showAlertMessage(message: "Try Again")
        }
    }
    
    func showAlertMessage(message:String) {
        let snackbar = TTGSnackbar(message: message, duration: .short)
        snackbar.show()
    }
    
    func getObjectData(index:Int)-> [String: Any] {
        return [
            "meeting_title": meetingObject.meetingTitle,
            "host_email": meetingObject.hostEmail,
            "startTime": meetingObject.startTime,
            "endTime": meetingObject.endTime,
            "location": meetingObject.location,
            "guests": meetingObject.guests,
            "meetingResponse" : index
        ]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

class LocationsTableViewCell: UITableViewCell {
    
}

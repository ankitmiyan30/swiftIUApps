//
//  MeetingModel.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 22/09/20.
//

import Foundation

import Foundation

// MARK: - MeetingMain
class MeetingMain: Codable {
    let meeting: Meeting

    init(meeting: Meeting) {
        self.meeting = meeting
    }
}

// MARK: - Meeting
class Meeting: Codable {
    let meetingTitle, hostEmail, startTime, endTime: String
    let location: String
    let meetingId:String
    let guests: [String]
    let meetingResponse: Int
    

    enum CodingKeys: String, CodingKey {
        case meetingTitle = "meeting_title"
        case hostEmail = "host_email"
        case startTime, endTime, location, guests
        case meetingResponse
        case meetingId
    }

    init(meetingTitle: String, hostEmail: String, startTime: String, endTime: String, location: String, guests: [String], meetingResponse:Int, meetingId:String) {
        self.meetingTitle = meetingTitle
        self.hostEmail = hostEmail
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.guests = guests
        self.meetingResponse = meetingResponse
        self.meetingId = meetingId
    }
}

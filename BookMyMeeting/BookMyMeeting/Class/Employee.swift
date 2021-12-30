//
//  Employee.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 22/09/20.
//

import Foundation

// MARK: - Employee
class Employee: Codable {
    let name, givenName, additionalName, familyName: String
    let yomiName, givenNameYomi, additionalNameYomi, familyNameYomi: String
    let namePrefix, nameSuffix, initials, nickname: String
    let shortName, maidenName, birthday, gender: String
    let location, billingInformation, directoryServer, mileage: String
    let occupation, hobby, sensitivity, priority: String
    let subject, notes, language, photo: String
    let groupMembership, eMail1Type, eMail1Value: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case givenName = "Given Name"
        case additionalName = "Additional Name"
        case familyName = "Family Name"
        case yomiName = "Yomi Name"
        case givenNameYomi = "Given Name Yomi"
        case additionalNameYomi = "Additional Name Yomi"
        case familyNameYomi = "Family Name Yomi"
        case namePrefix = "Name Prefix"
        case nameSuffix = "Name Suffix"
        case initials = "Initials"
        case nickname = "Nickname"
        case shortName = "Short Name"
        case maidenName = "Maiden Name"
        case birthday = "Birthday"
        case gender = "Gender"
        case location = "Location"
        case billingInformation = "Billing Information"
        case directoryServer = "Directory Server"
        case mileage = "Mileage"
        case occupation = "Occupation"
        case hobby = "Hobby"
        case sensitivity = "Sensitivity"
        case priority = "Priority"
        case subject = "Subject"
        case notes = "Notes"
        case language = "Language"
        case photo = "Photo"
        case groupMembership = "Group Membership"
        case eMail1Type = "E-mail 1 - Type"
        case eMail1Value = "E-mail 1 - Value"
    }

    init(name: String, givenName: String, additionalName: String, familyName: String, yomiName: String, givenNameYomi: String, additionalNameYomi: String, familyNameYomi: String, namePrefix: String, nameSuffix: String, initials: String, nickname: String, shortName: String, maidenName: String, birthday: String, gender: String, location: String, billingInformation: String, directoryServer: String, mileage: String, occupation: String, hobby: String, sensitivity: String, priority: String, subject: String, notes: String, language: String, photo: String, groupMembership: String, eMail1Type: String, eMail1Value: String) {
        self.name = name
        self.givenName = givenName
        self.additionalName = additionalName
        self.familyName = familyName
        self.yomiName = yomiName
        self.givenNameYomi = givenNameYomi
        self.additionalNameYomi = additionalNameYomi
        self.familyNameYomi = familyNameYomi
        self.namePrefix = namePrefix
        self.nameSuffix = nameSuffix
        self.initials = initials
        self.nickname = nickname
        self.shortName = shortName
        self.maidenName = maidenName
        self.birthday = birthday
        self.gender = gender
        self.location = location
        self.billingInformation = billingInformation
        self.directoryServer = directoryServer
        self.mileage = mileage
        self.occupation = occupation
        self.hobby = hobby
        self.sensitivity = sensitivity
        self.priority = priority
        self.subject = subject
        self.notes = notes
        self.language = language
        self.photo = photo
        self.groupMembership = groupMembership
        self.eMail1Type = eMail1Type
        self.eMail1Value = eMail1Value
    }
}

class MainEmployee: Codable {
    let employeelist:[Employee]
   

    enum CodingKeys: String, CodingKey {
        case employeelist = "employeelist"
        
    }

    init(employeelist: [Employee] ) {
        self.employeelist = employeelist
    }
}


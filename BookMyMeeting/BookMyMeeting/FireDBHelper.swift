//
//  FireDBHelper.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 01/10/20.
//

import FirebaseDatabase

class FireDBHelper {
    
    public static var firebaseDBHelper = FireDBHelper()
    
    func saveEvent(object: [String: Any]) -> Bool {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let id = UUID()
        if ref.child("meeting").child("id-\(id)") .setValue(object) != nil {
            return true
        } else {
            return false
        }
    }
    
    func updateEvent(object: [String: Any], id: String) -> Bool {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        if ref.child("meeting").child(id) .setValue(object) != nil {
            return true
        } else {
            return false
        }
    }
    
    func removeEvent(id: String) -> Bool {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        if ref.child("meeting").child(id).removeValue() != nil {
            return true
        } else {
            return false
        }
    }
    
    func getEvent()-> [String: Any] {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        var returnObject = [String: Any]()
        ref.child("meeting").observeSingleEvent(of: .value, with: { snapshot in
            guard let arrayOfEvent = snapshot.value as? [String: Any] else {
                return
            }
            returnObject = arrayOfEvent
        })
        return returnObject
    }
    
    
    
    
}

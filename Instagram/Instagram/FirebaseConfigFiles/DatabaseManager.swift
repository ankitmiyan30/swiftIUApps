//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    
}

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerUser(email:String, password:String, name:String){
        
    }
    
    public func loginUser(email:String, password:String, name:String?){
        
    }
}

public class StorageManager {
    static let shared = StorageManager()
    

}

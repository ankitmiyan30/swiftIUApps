//
//  ChatScreenViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 17/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
    
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String = ""
    var sentDate: Date
    var kind: MessageKind
    
    
}
class ChatScreenViewController: MessagesViewController, UITextFieldDelegate, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    var userName:String = ""
    let currentUser = Sender(senderId: "self", displayName: "Ankit")
    let otherUser = Sender(senderId: "other", displayName: "Sam")
    var message = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = userName
        addBackButton()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        message.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-32445), kind: .text("Hello")))
        message.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-32445), kind: .text("Hello")))
        message.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-32445), kind: .text("Jao")))
        message.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-32445), kind: .text("Hello")))
        message.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-32445), kind: .text("Hello")))
        message.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-32445), kind: .text("Hello")))
        message.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-32445), kind: .text("Hello")))
        message.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-32445), kind: .text("Hello")))
        
        // Do any additional setup after loading the view.
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return message.count
    }
    
}

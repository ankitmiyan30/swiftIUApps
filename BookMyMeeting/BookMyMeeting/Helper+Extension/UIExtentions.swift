//
//  Extentions.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 23/09/20.
//

import UIKit

extension UIViewController {
    func hidKeyBoardOnScreenTap(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
                                                                
    }
    
    @objc func dismissKeyBoard(){
        view.endEditing(true)
    }
}

extension UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIView {
    func addShadow(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 4
    }
}

class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


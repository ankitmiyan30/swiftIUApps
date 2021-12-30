//
//  DateTimePickerView.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 24/09/20.
//

import UIKit

protocol DatePickerViewDelegate {
    func handleDismissal()
    func handleSetDate()
}

class DateTimePickerView: UIView {
    // MARK: - Properties
    
    var delegate: DatePickerViewDelegate?
    var timePickerWidth:CGFloat = 0
    let checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "Select Date"

        return label
    }()
    
    let timePicker: UIDatePicker = {
        let dateTimePicker = UIDatePicker()
        dateTimePicker.translatesAutoresizingMaskIntoConstraints = false
        dateTimePicker.minimumDate = Date()
        return dateTimePicker
    }()
    
    let buttonSet: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = kBaseNavigationBarTintColor
        button.setTitle("SET", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSetDate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let buttonCancel: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(timePicker)
        timePicker.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -60).isActive = true
        timePicker.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        timePicker.widthAnchor.constraint(equalToConstant: 280).isActive = true
        timePicker.minimumDate = Date()
        
        addSubview(buttonSet)
        buttonSet.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonSet.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        buttonSet.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 12).isActive = true
        buttonSet.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
        addSubview(buttonCancel)
        buttonCancel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonCancel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        buttonCancel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        buttonCancel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
    
    @objc func handleSetDate() {
        delegate?.handleSetDate()
    }
    
}

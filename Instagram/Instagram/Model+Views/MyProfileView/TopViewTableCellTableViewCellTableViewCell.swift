//
//  TopViewTableCellTableViewCellTableViewCell.swift
//  Instagram
//
//  Created by Anthony Ankit on 21/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class TopViewTableCellTableViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var editProfileDataButton: UIButton!
    @IBOutlet weak var editProfilePhoto: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    static let identifier = "TopViewTableCellTableViewCellTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        InstagramHelper.gredientBorderRadius(imageView: profileImageView)
        editProfilePhoto.layer.borderWidth = 1
        editProfilePhoto.layer.borderColor = UIColor.white.cgColor
        editProfilePhoto.clipsToBounds = true
        editProfileDataButton.layer.borderWidth = 1
        editProfileDataButton.layer.cornerRadius = 2
        editProfileDataButton.layer.borderColor = UIColor.lightGray.cgColor
        editProfileDataButton.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

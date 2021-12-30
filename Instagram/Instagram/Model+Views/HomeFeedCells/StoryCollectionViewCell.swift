//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by Anthony Ankit on 21/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var addStroyButton: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func addStroybutton(_ sender: Any) {
    }
}

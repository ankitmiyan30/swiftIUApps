//
//  MemberNameTableViewCell.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 23/09/20.
//

import UIKit

class MemberNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memberName: UILabel!
    static let identifier = "MemberNameTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

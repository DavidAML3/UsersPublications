//
//  UserCell.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 25/06/22.
//

import UIKit

class UserCell: UITableViewCell {
    static let id = "UserCell"

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBAction func seePublications(_ sender: Any) {
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  PublicationsCell.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import UIKit

class PublicationsCell: UITableViewCell {
    static let id = "PublicationsCell"

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
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

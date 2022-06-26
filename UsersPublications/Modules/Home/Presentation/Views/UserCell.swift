//
//  UserCell.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 25/06/22.
//

import UIKit

protocol CellDelegate {
    func didButtonPressed(id: Int, name: String)
}

class UserCell: UITableViewCell {
    static let id = "UserCell"
    
    var delegate: CellDelegate?
    
    var id: Int!

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func actionButton(_ sender: Any) {
        delegate?.didButtonPressed(id: id, name: userName.text!)
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

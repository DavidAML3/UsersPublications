//
//  PublicationsView.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import Foundation
import UIKit

class PublicationsView: UIViewController {
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: IPublicationsPresenter!
    
    var publications = [Publication]()
    var userName: String?
    var userId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        setData()
    }
    
    func setupTableView() {
        let userNib = UINib(nibName: UserCell.id, bundle: UsersPublicationsAPI.bundle)
        let defaultNib = UINib(nibName: DefaultCell.id, bundle: UsersPublicationsAPI.bundle)
        tableView.register(userNib, forCellReuseIdentifier: UserCell.id)
        tableView.register(defaultNib, forCellReuseIdentifier: DefaultCell.id)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setData() {
        userNameLbl.text = userName
    }
}

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
    
    var userData: UserItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        setData()
    }
    
    func setupTableView() {
        let userNib = UINib(nibName: UserCell.id, bundle: UsersPublicationsAPI.bundle)
        let publicationNib = UINib(nibName: PublicationsCell.id, bundle: UsersPublicationsAPI.bundle)
        tableView.register(userNib, forCellReuseIdentifier: UserCell.id)
        tableView.register(publicationNib, forCellReuseIdentifier: PublicationsCell.id)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setData() {
        presenter.getUserPublications(userId: Int(userData!.id))
    }
    
    // MARK: - Others
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PublicationsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.id, for: indexPath) as! UserCell
            
            cell.userName.text = userData?.name
            cell.userPhone.text = userData?.phone
            cell.userEmail.text = userData?.email
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PublicationsCell.id, for: indexPath) as! PublicationsCell
            
            let publication = publications[indexPath.row]
            
            cell.titleLbl.text = publication.title
            cell.descriptionLbl.text = publication.description
            
            return cell
        }
    }
}

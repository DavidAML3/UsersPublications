//
//  ViewController.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import UIKit

class HomeView: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: IHomePresenter!
    
    var usersList = [User]()
    var searchList = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View")
        setupModule()
        setData()
        setupTableView()
        setupView()
        setupSearchBar()
    }
    
    func setupModule() {
        self.presenter = HomePresenter(view: self)
    }
    
    func setData() {
        presenter.getUsersData()
    }
    
    func setupTableView() {
        let userCellNibName = "UserCell"
        let defaultCellNibNAme = "DefaultCell"
        let userNib = UINib(nibName: userCellNibName, bundle: UsersPublicationsAPI.bundle)
        let defaultNib = UINib(nibName: defaultCellNibNAme, bundle: UsersPublicationsAPI.bundle)
        tableView.register(userNib, forCellReuseIdentifier: userCellNibName)
        tableView.register(defaultNib, forCellReuseIdentifier: defaultCellNibNAme)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupView() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: searchBar.frame.height - 1, width: searchBar.frame.width, height: 1.0)
        bottomLine.backgroundColor = Colors.darkGreen?.cgColor
        searchBar.borderStyle = .none
        searchBar.layer.addSublayer(bottomLine)
    }
    
    func setupSearchBar() {
        searchBar.addTarget(self, action: #selector(searchRecords(_ :)), for: .editingChanged)
    }
    
    @objc func searchRecords(_ textField: UITextField) {
        self.usersList.removeAll()
        if textField.text?.count != 0 {
            for user in searchList {
                if let userToSearch = textField.text {
                    if let _ = user.name.lowercased().range(of: userToSearch, options: .caseInsensitive, range: nil, locale: nil) {
                        usersList.append(user)
                    }
                }
            }
        } else {
            for user in searchList {
                usersList.append(user)
            }
        }
        tableView.reloadData()
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count != 0 ? usersList.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if usersList.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as! DefaultCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
            
            let user = usersList[indexPath.row]
            
            cell.userName.text = user.name
            cell.userPhone.text = user.phone
            cell.userEmail.text = user.email
            
            return cell
        }
    }
}

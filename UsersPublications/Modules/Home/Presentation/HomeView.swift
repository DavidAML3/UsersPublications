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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View")
        setupModule()
        setData()
        setupTableView()
        setupView()
    }
    
    func setupModule() {
        self.presenter = HomePresenter(view: self)
    }
    
    func setData() {
        presenter.getUsersData()
    }
    
    func setupTableView() {
        let nibName = "UserCell"
        let nib = UINib(nibName: nibName, bundle: UsersPublicationsAPI.bundle)
        tableView.register(nib, forCellReuseIdentifier: nibName)
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
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        let user = usersList[indexPath.row]
        
        cell.userName.text = user.name
        cell.userPhone.text = user.phone
        cell.userEmail.text = user.email
        
        return cell
    }
}

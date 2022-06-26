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
    
    var usersList = [UserItem]()
    
    var userName: String?
    var userId: Int?
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupModule()
        setupTableView()
        setupView()
        setupSearchBar()
        setupKeyboard()
        
        setData()
    }
    
    // MARK: - Setups
    func setupModule() {
        self.presenter = HomePresenter(view: self)
    }
    
    func setupTableView() {
        let userNib = UINib(nibName: UserCell.id, bundle: UsersPublicationsAPI.bundle)
        let defaultNib = UINib(nibName: DefaultCell.id, bundle: UsersPublicationsAPI.bundle)
        tableView.register(userNib, forCellReuseIdentifier: UserCell.id)
        tableView.register(defaultNib, forCellReuseIdentifier: DefaultCell.id)
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
    
    func setupKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Sets
    
    func setData() {
        presenter.getUsersData()
    }
    
    // MARK: - objc functions
    
    @objc func searchRecords(_ textField: UITextField) {
        presenter.getSearchItems(textField: textField)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Others
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count != 0 ? usersList.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if usersList.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DefaultCell.id, for: indexPath) as! DefaultCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.id, for: indexPath) as! UserCell
            
            let user = usersList[indexPath.row]
            
            cell.user = user
            
            cell.userName.text = user.name
            cell.userPhone.text = user.phone
            cell.userEmail.text = user.email
            
            cell.delegate = self
            
            return cell
        }
    }
}

extension HomeView: CellDelegate {
    func didButtonPressed(userData: UserItem) {
        presenter.showPublicationsView(userData: userData)
    }
}

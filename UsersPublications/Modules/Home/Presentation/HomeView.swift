//
//  ViewController.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import UIKit

class HomeView: UIViewController {
    
    var presenter: IHomePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View")
        setupModule()
        setData()
    }
    
    func setupModule() {
        self.presenter = HomePresenter(view: self)
    }
    
    func setData() {
        presenter.getUsersData()
    }
}


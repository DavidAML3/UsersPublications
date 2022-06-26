//
//  HomePresenter.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation
import UIKit

protocol IHomePresenter {
    func getSearchItems(textField: UITextField)
    func getUsersData()
    func showPublicationsView(userData: UserItem)
}

class HomePresenter: IHomePresenter {
    
    var interactor: IHomeInteractor!
    var router: HomeRouter!
    weak var view: HomeView!
    
    private var spinner: UIView?
    
    init(view: HomeView) {
        self.interactor = HomeInteractor()
        self.router = HomeRouter()
        self.view = view
    }
    
    deinit {
        print("Deinit presenter")
    }
    
    func getSearchItems(textField: UITextField) {
        if let text = textField.text {
            interactor.getSearchItems(text: text) { [weak self] list in
                guard let strongSelf = self else { return }
                
                strongSelf.view.usersList = list
                strongSelf.view.reloadTableView()
            }
        }
    }
    
    func getUsersData() {
        interactor.getDataFromDatabase { [weak self] list in
            
            guard let strongSelf = self else { return }
            
            if !list.isEmpty {
                strongSelf.setupUsersLists(list: list)
            } else {
                strongSelf.requestUsersData()
            }
        }
    }
    
    private func requestUsersData() {
        view.activateSpinner(view: view, spinner: &spinner)
        interactor.requestUsersData { [weak self] list in
            
            guard let strongSelf = self else { return }
            
            strongSelf.setupUsersLists(list: list)
            
            // comment the following line if you want to see the loading dialog
            strongSelf.view.deactivateSpinner(view: strongSelf.view, spinner: &strongSelf.spinner)
        }
    }
    
    func showPublicationsView(userData: UserItem) {
        router.showPublicationsView(view: self.view, userData: userData)
    }
    
    private func setupUsersLists(list: [UserItem]) {
        self.view.usersList = list
        self.view.reloadTableView()
    }
}

//
//  HomePresenter.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation
import UIKit

protocol IHomePresenter {
    func getUsersData()
}

class HomePresenter: IHomePresenter {
    
    var interactor: IHomeInteractor!
    weak var view: HomeView!
    
    var spinner: UIView?
    
    init(view: HomeView) {
        self.interactor = HomeInteractor()
        self.view = view
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
    
    private func setupUsersLists(list: [UserItem]) {
        self.view.usersList = list
        self.view.searchList = list
        self.view.reloadTableView()
    }
}

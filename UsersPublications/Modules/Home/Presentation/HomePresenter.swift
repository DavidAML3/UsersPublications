//
//  HomePresenter.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomePresenter {
    func getUsersData()
}

class HomePresenter: IHomePresenter {
    
    var interactor: IHomeInteractor!
    weak var view: HomeView!
    
    init(view: HomeView) {
        print("Presenter")
        self.interactor = HomeInteractor()
        self.view = view
    }
    
    func getUsersData() {
        interactor.getUsersData { response in
            self.view.usersList = response
            self.view.searchList = response
            self.view.tableView.reloadData()
        }
    }
}

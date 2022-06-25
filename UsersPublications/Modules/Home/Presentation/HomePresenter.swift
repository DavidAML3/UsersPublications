//
//  HomePresenter.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomePresenter {
    
}

class HomePresenter: IHomePresenter {
    
    var interactor: IHomeInteractor!
    weak var view: HomeView!
}

//
//  PublicationsPresenter.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import Foundation

protocol IPublicationsPresenter {
    func getUserPublications()
}

class PublicationsPresenter: IPublicationsPresenter {
    
    var interactor: IPublicationsInteractor!
    weak var view: PublicationsView!
    
    init(view: PublicationsView, interactor: IPublicationsInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func getUserPublications() {
        
    }
}

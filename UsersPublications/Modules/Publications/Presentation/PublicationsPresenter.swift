//
//  PublicationsPresenter.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import Foundation
import UIKit

protocol IPublicationsPresenter {
    func getUserPublications(userId: Int)
}

class PublicationsPresenter: IPublicationsPresenter {
    
    var interactor: IPublicationsInteractor!
    weak var view: PublicationsView!
    
    private var spinner: UIView?
    
    init(view: PublicationsView, interactor: IPublicationsInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func getUserPublications(userId: Int) {
        view.activateSpinner(view: view, spinner: &spinner)
        interactor.getUserPublications(userId: userId) { [weak self] list in
            guard let strongSelf = self else { return }
            
            strongSelf.view.publications = list
            strongSelf.view.reloadTableView()
            
            // comment the following line if you want to see the loading dialog
            strongSelf.view.deactivateSpinner(view: strongSelf.view, spinner: &strongSelf.spinner)
        }
    }
}

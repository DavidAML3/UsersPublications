//
//  HomeRouter.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation
import UIKit

class HomeRouter {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func showPublicationsView(view: UIViewController, userData: UserItem) {
        
        let controller = storyboard.instantiateViewController(withIdentifier: "PublicationsView") as! PublicationsView
        
        let repository = PublicationsRepository()
        let interactor = PublicationsInteractor(repository: repository)
        let presenter = PublicationsPresenter(view: controller, interactor: interactor)
        
        controller.presenter = presenter
        controller.userData = userData
        
        view.present(controller, animated: true, completion: nil)
    }
}

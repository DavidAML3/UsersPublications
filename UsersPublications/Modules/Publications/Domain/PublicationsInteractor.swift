//
//  PublicationsInteractor.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import Foundation

protocol IPublicationsInteractor {
    func getUserPublications(_ completion: @escaping (_ list: [Publication]) -> Void)
}

class PublicationsInteractor: IPublicationsInteractor {
    
    var repository: IPublicationsRepository!
    
    init(repository: IPublicationsRepository) {
        self.repository = repository
    }
    
    func getUserPublications(_ completion: @escaping (_ list: [Publication]) -> Void) {
        
    }
}

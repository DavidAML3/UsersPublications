//
//  HomeInteractor.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomeInteractor {
    func getUsersData(_ completion: @escaping (_ list: [User]) -> Void)
}

class HomeInteractor: IHomeInteractor {
    
    var repository: IHomeRepository!
    
    init() {
        print("Interactor")
        self.repository = HomeRepository()
    }
    
    func getUsersData(_ completion: @escaping (_ list: [User]) -> Void) {
        repository.getUsersData { list in
            completion(list)
        }
    }
}

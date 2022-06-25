//
//  HomeRepository.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomeRepository {
    func getUsersData(_ completion: @escaping (_ response: String) -> Void)
}

class HomeRepository: IHomeRepository {
    
    var datasource: IHomeDataSource = HomeDataSource()
    
    init() {
        print("Repository")
    }
    
    func getUsersData(_ completion: @escaping (_ response: String) -> Void) {
        let endpoint = "https://jsonplaceholder.typicode.com/users"
        datasource.requestUsersData(endpoint: endpoint) { response in
            //
        }
    }
}

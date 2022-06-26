//
//  HomeRepository.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomeRepository {
    func requestUsersData(_ completion: @escaping (_ list: [User]) -> Void)
}

class HomeRepository: IHomeRepository {
    
    var datasource: IHomeDataSource = HomeDataSource()
    
    init() {
        print("Repository")
    }
    
    func requestUsersData(_ completion: @escaping (_ list: [User]) -> Void) {
        let endpoint = "https://jsonplaceholder.typicode.com/users"
        datasource.requestUsersData(endpoint: endpoint) { [weak self] data in
            guard let strongSelf = self else { return }
            completion(strongSelf.parseUsersData(data: data))
        }
    }
    
    private func parseUsersData(data: [[String: Any]]) -> [User] {
        var userList = [User]()
        
        for user in data {
            if let id = user["id"] as? Int, let name = user["name"] as? String, let phone = user["phone"] as? String, let email = user["email"] as? String {
                let user = User(id: id, name: name, phone: phone, email: email)
                userList.append(user)
            }
        }
        
        return userList
    }
}

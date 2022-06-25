//
//  HomeDataSource.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomeDataSource {
    func requestUsersData(endpoint: String, _ completion: @escaping (_ response: [[String: Any]]) -> Void)
}

class HomeDataSource: IHomeDataSource {
    
    private let requestManager = RequestManager()
    
    func requestUsersData(endpoint: String, _ completion: @escaping (_ response: [[String: Any]]) -> Void) {
        requestManager.get(endpoint, parameters: nil) { data in
            completion(data)
        }
    }
}

//
//  PublicationsDataSource.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import Foundation

protocol IPublicationsDataSource {
    func requestUsersPublications(endpoint: String, _ completion: @escaping (_ data: [[String: Any]]) -> Void)
}

class PublicationsDataSource: IPublicationsDataSource {
    
    private let requestManager = RequestManager()
    
    func requestUsersPublications(endpoint: String, _ completion: @escaping (_ data: [[String: Any]]) -> Void) {
        requestManager.get(endpoint, parameters: nil) { data in
            completion(data)
        }
    }
}

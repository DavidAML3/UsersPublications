//
//  PublicationsRepository.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import Foundation

protocol IPublicationsRepository {
    func requestUsersPublications(userId: Int, _ completion: @escaping (_ list: [Publication]) -> Void)
}

class PublicationsRepository: IPublicationsRepository {
    
    var datasource: IPublicationsDataSource!
    
    init() {
        self.datasource = PublicationsDataSource()
    }
    
    func requestUsersPublications(userId: Int, _ completion: @escaping (_ list: [Publication]) -> Void) {
        let endpoint = "\(EndpointList.BASE_URL)/posts?userId=\(userId)"
        datasource.requestUsersPublications(endpoint: endpoint) { [weak self] data in
            guard let strongSelf = self else { return }
            completion(strongSelf.parseUsersData(data: data))
        }
    }
    
    private func parseUsersData(data: [[String: Any]]) -> [Publication] {
        var publicationsList = [Publication]()
        
        for user in data {
            if let title = user["title"] as? String, let description = user["body"] as? String {
                let publication = Publication(title: title, description: description)
                publicationsList.append(publication)
            }
        }
        
        return publicationsList
    }
}

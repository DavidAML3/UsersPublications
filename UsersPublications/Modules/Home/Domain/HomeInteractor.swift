//
//  HomeInteractor.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomeInteractor {
    func getSearchItems(text: String, _ completion: @escaping (_ list: [UserItem]) -> Void)
    func getDataFromDatabase(_ completion: @escaping (_ list: [UserItem]) -> Void)
    func requestUsersData(_ completion: @escaping (_ list: [UserItem]) -> Void)
}

class HomeInteractor: IHomeInteractor {
    
    var repository: IHomeRepository!
    private var items = [UserItem]()
    
    init() {
        self.repository = HomeRepository()
    }
    
    func getSearchItems(text: String, _ completion: @escaping (_ list: [UserItem]) -> Void) {
        let searchList = UsersPublicationsPersistence.shared.getCDItems()
        
        self.items.removeAll()
        if text.count != 0 {
            for user in searchList {
                if let _ = user.name?.lowercased().range(of: text, options: .caseInsensitive, range: nil, locale: nil) {
                    items.append(user)
                }
            }
        } else {
            for user in searchList {
                items.append(user)
            }
        }
        
        completion(items)
    }
    
    func getDataFromDatabase(_ completion: @escaping (_ list: [UserItem]) -> Void) {
        // uncomment the following 2 lines if you want to erase the data from the database
//        UsersPublicationsPersistence.shared.deleteCD()
        
        items = UsersPublicationsPersistence.shared.getCDItems()
        
        if !items.isEmpty {
            completion(items)
        } else {
            completion([])
        }
    }
    
    func requestUsersData(_ completion: @escaping (_ list: [UserItem]) -> Void) {
        repository.requestUsersData { [weak self] list in
            
            guard let strongSelf = self else { return }
            
            for user in list {
                UsersPublicationsPersistence.shared.createCDItem(id: Int16(user.id), name: user.name, phone: user.phone, email: user.email)
            }
            
            strongSelf.items = UsersPublicationsPersistence.shared.getCDItems()
            
            completion(strongSelf.items)
        }
    }
}

//
//  HomeInteractor.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation
import UIKit

protocol IHomeInteractor {
    func getDataFromDatabase(_ completion: @escaping (_ list: [UserItem]) -> Void)
    func requestUsersData(_ completion: @escaping (_ list: [UserItem]) -> Void)
}

class HomeInteractor: IHomeInteractor {
    
    var repository: IHomeRepository!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var items = [UserItem]()
    
    init() {
        self.repository = HomeRepository()
    }
    
    func getDataFromDatabase(_ completion: @escaping (_ list: [UserItem]) -> Void) {
        
        getCDItems()
        // uncomment the following line if you want to erase the data from the database
//        deleteCD()
        
        if !items.isEmpty {
            completion(items)
        } else {
            completion([])
        }
    }
    
    func requestUsersData(_ completion: @escaping (_ list: [UserItem]) -> Void) {
        repository.requestUsersData { [weak self] list in
            
            guard let strongself = self else { return }
            
            for user in list {
                strongself.createCDItem(id: Int16(user.id), name: user.name, phone: user.phone, email: user.email)
            }
            
            completion(strongself.items)
        }
    }
    
    // MARK: - CoreData
    
    func deleteCD() {
        do {
            for item in items {
                context.delete(item)
            }
            
            try context.save()
            getCDItems()
        } catch {
            // error
        }
    }
    
    func getCDItems() {
        do {
            items = try context.fetch(UserItem.fetchRequest())
        } catch {
            // error
        }
    }
    
    func createCDItem(id: Int16, name: String, phone: String, email: String) {
        let newItem = UserItem(context: context)
        newItem.id = id
        newItem.name = name
        newItem.phone = phone
        newItem.email = email
        
        do {
            try context.save()
        } catch {
            // error
        }
    }
}

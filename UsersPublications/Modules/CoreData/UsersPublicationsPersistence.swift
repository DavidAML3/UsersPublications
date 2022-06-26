//
//  UsersPublicationsPersistence.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 26/06/22.
//

import Foundation
import CoreData

class UsersPublicationsPersistence {
    static var shared = UsersPublicationsPersistence()
    
    private var items = [UserItem]()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UsersPublications")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func getCDItems() -> [UserItem] {
        let context = persistentContainer.viewContext
        do {
            items = try context.fetch(UserItem.fetchRequest())
        } catch {
            // error
        }
        return items
    }
    
    func createCDItem(id: Int16, name: String, phone: String, email: String) {
        let context = persistentContainer.viewContext
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
    
    func deleteCD() {
        let context = persistentContainer.viewContext
        do {
            for item in items {
                context.delete(item)
            }
            
            try context.save()
            let _ = getCDItems()
        } catch {
            // error
        }
    }
}

//
//  UserItem+CoreDataProperties.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 25/06/22.
//
//

import Foundation
import CoreData

extension UserItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserItem> {
        return NSFetchRequest<UserItem>(entityName: "UserItem")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?

}

extension UserItem : Identifiable {

}

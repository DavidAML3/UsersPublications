//
//  UtilityMethods.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 25/06/22.
//

import Foundation

class UtilityMethods {
    
    static func convertToDictionary(text: String) -> [[String: Any]]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            } catch {
                print("error: ", error.localizedDescription)
            }
        }
        return nil
    }
}

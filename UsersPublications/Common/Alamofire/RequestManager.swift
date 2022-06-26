//
//  RequestManager.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation
import Alamofire

class RequestManager {
    
    typealias RequestCompletion = (_ data: [[String: Any]]) -> Void
    
    private let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        
        return Session(configuration: configuration)
    }()
    
    func get(_ url: String, parameters: [String: Any]?, completion: @escaping RequestCompletion) {
        request(.get, url, parameters: parameters, completion: completion)
    }
    
    private func request(_ method: Alamofire.HTTPMethod, _ url: String, parameters: [String: Any]?, completion: @escaping RequestCompletion) {
        sessionManager.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            if let data = response.data, let responseData = String(data: data, encoding: .utf8), let responseJSON = UtilityMethods.convertToDictionary(text: responseData) {
                completion(responseJSON)
            }
        }
    }
}

//
//  HomeRepository.swift
//  UsersPublications
//
//  Created by David Andres Mejia Lopez on 24/06/22.
//

import Foundation

protocol IHomeRepository {
    
}

class HomeRepository: IHomeRepository {
    
    var datasource: IHomeDataSource = HomeDataSource()
}

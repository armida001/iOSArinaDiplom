//
//  PatternsNetworkService.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit

protocol PersonsDataServiceProtocol {
    func getPersons(completion: @escaping ([Pattern]) -> Void,
                     errorCompletion: @escaping (NetworkServiceError)->Void)
}

final class PersonsDataService: NSObject, PersonsDataServiceProtocol {
    
    func getPersons(completion: @escaping ([Pattern]) -> Void,
                    errorCompletion: @escaping (NetworkServiceError)->Void) {
    }
}

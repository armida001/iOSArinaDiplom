//
//  ServiceProtocol.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 29.11.2021.
//

import Foundation

protocol DataBaseServiceProtocol {
    func loadPersons(completionHandler: @escaping ([Person]) -> Void,
                    errorCompletion: @escaping (Error) -> Void)

}

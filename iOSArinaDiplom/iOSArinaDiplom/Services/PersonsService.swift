//
//  PatternsNetworkService.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit
import CoreData

protocol PersonsProtocol {
    func loadData(completionHandler: @escaping ([Person]) -> Void,
                  errorCompletion: @escaping (Error) -> Void)
    func addPerson(_ person: PersonCellItem,
                   completionHandler: @escaping () -> Void,
                   errorCompletion: @escaping (Error) -> Void)
}

final class PersonsDataService: PersonsProtocol {
    private var dataBase: DataBaseService = DataBaseService()
    
    func addPerson(_ person: PersonCellItem, completionHandler: @escaping () -> Void, errorCompletion: @escaping (Error) -> Void) {
        dataBase.addPerson(person.title, detail: person.detail, completionHandler: completionHandler, errorCompletion: errorCompletion)
    }

    
    func loadData(completionHandler: @escaping ([Person]) -> Void,
                  errorCompletion: @escaping (Error) -> Void) {
        dataBase.loadPersons(completionHandler: completionHandler,
                             errorCompletion: errorCompletion)
    }
    
    static func loadImage(image: String, completion: @escaping (UIImage) -> Void) {
        Network.shared.loadImage(imageUrl: image) { imageData in
            if let data = imageData, let image = UIImage.init(data: data) {
                completion(image)
            }
        }
    }
}

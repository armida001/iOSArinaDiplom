//
//  DataBaseService.swift
//  CoreDataFRC
//
//  Created by Andrey Khyshov on 10.11.2021.
//

import Foundation
import CoreData
import UIKit

final class DataBaseService {
    
    private let coreDataStack = Container.shared.coreDataStack
    var context: NSManagedObjectContext {
        coreDataStack.viewContext
    }
}

extension DataBaseService {
    func loadPersons(completionHandler: @escaping ([DTOPerson]) -> Void,
                     errorCompletion: @escaping (Error) -> Void) {
        let persons = coreDataStack.loadData(dataType: DTOPerson.self)
        completionHandler(persons)
    }
    
    func addPerson(_ person: DTOPerson,
                   completionHandler: @escaping () -> Void,
                   errorCompletion: @escaping (Error) -> Void) {
        
        coreDataStack.viewContext.performAndWait {            
            if let error = coreDataStack.addData(dataType: DTOPerson.self, object: person) {
                errorCompletion(error)
            } else {
                completionHandler()
            }
        }
        
    }
}

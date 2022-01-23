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
}

extension DataBaseService {
    func loadPersons(completionHandler: @escaping ([DTOPerson]) -> Void,
                     errorCompletion: @escaping (Error) -> Void) {
        completionHandler(coreDataStack.loadData(dataType: DTOPerson.self))
    }
    
    func addPerson(_ name: String,
                   detail: String,
                   completionHandler: @escaping () -> Void,
                     errorCompletion: @escaping (Error) -> Void) {
        
        coreDataStack.mainContext.performAndWait {
            do {
            let entity = NSEntityDescription.entity(forEntityName: "DTOPerson", in: coreDataStack.mainContext)
            let card = DTOPerson(context: coreDataStack.mainContext)
            card.name = name
            card.comment = detail
            
                try coreDataStack.mainContext.save()
                completionHandler()
            } catch let error {
                errorCompletion(error)
            }
        }
        
//        if let error = coreData.addData(dataType: Person.self,
//                                        object: person) {
//            errorCompletion(error)
//        } else {
//            completionHandler()
//        }
    }
}

private extension DataBaseService {

    private func fetchRequest<T: NSObject, R: NSObject>(for dto: T) -> NSFetchRequest<R> {
        let request = NSFetchRequest<R>(entityName: String(describing: T.self))
//		request.predicate = .init(format: "number == %@", dto.number)
		return request
	}

}

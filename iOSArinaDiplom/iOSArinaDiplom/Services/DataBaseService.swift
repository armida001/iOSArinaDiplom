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

	private let coreData: CoreDataProtocol

	init(coreData: CoreDataProtocol) {
        self.coreData = coreData
	}
}

extension DataBaseService {
    func loadPersons(completionHandler: @escaping ([Person]) -> Void,
                     errorCompletion: @escaping (Error) -> Void) {
        completionHandler(coreData.loadData(dataType: Person.self))
    }
}

private extension DataBaseService {

    private func fetchRequest<T: NSObject, R: NSObject>(for dto: T) -> NSFetchRequest<R> {
        let request = NSFetchRequest<R>(entityName: String(describing: T.self))
//		request.predicate = .init(format: "number == %@", dto.number)
		return request
	}

}

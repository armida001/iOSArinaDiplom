//
//  CoreDataStack.swift
//  CoreDataFRC
//
//  Created by Andrey Khyshov on 10.11.2021.
//

import Foundation
import CoreData

final class CoreData: CoreDataProtocol {
    static var dbName = "Patterns"
    static let shared = CoreData(modelName: CoreData.dbName)

    let container: NSPersistentContainer

	init(modelName: String) {
		let container = NSPersistentContainer(name: modelName)
		self.container = container

        // 1. Первый способ связи контекстов через Parent->Child!!
//        self.mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        self.mainContext.persistentStoreCoordinator = coordinator
//
//        self.backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        self.backgroundContext.parent = self.mainContext



        // 2. Второй способ связывания контекстов через НОТИФИКАЦИЮ!

        self.mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.mainContext.persistentStoreCoordinator = coordinator

        self.backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        self.backgroundContext.persistentStoreCoordinator = coordinator

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(contextDidChange(notification:)),
                                               name: Notification.Name.NSManagedObjectContextDidSave,
                                               object: self.backgroundContext)
	}


	func load() {
		container.loadPersistentStores { desc, error in
			if let error = error {
				assertionFailure(error.localizedDescription)
			}
		}
	}

	var viewContext: NSManagedObjectContext { container.viewContext }
	lazy var backgroundContext: NSManagedObjectContext = container.newBackgroundContext()
	var coordinator: NSPersistentStoreCoordinator { container.persistentStoreCoordinator }

    let mainContext: NSManagedObjectContext

    func deleteAll<T: NSFetchRequestResult>(dataType: T.Type) {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        backgroundContext.performAndWait {
            let cards = try? fetchRequest.execute()
            cards?.forEach {
                backgroundContext.delete($0 as! NSManagedObject)
            }
            try? backgroundContext.save()
        }
    }
    
    func loadData<T: NSFetchRequestResult>(dataType: T.Type) -> [T] {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        do {
            return try backgroundContext.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
        return [T]()
    }

}

extension CoreData {
	@objc func contextDidChange(notification: Notification) {
		coordinator.performAndWait {
			mainContext.performAndWait {
				mainContext.mergeChanges(fromContextDidSave: notification)
			}
		}
	}
}


//        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
//        let url = URL(fileURLWithPath: documentsPath).appendingPathComponent("CoreDataFRC.sqlite")
//
//        do {
//            try container.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
//                                              configurationName: nil,
//                                              at: url,
//                                              options: [NSMigratePersistentStoresAutomaticallyOption: true,
//                                                        NSInferMappingModelAutomaticallyOption: true])
//        } catch {
//            print(error)
//            fatalError()
//        }

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
    
    var viewContext: NSManagedObjectContext { container.viewContext }
    private let container: NSPersistentContainer
    private var coordinator: NSPersistentStoreCoordinator { container.persistentStoreCoordinator }
    
    init(modelName: String) {
        let container = NSPersistentContainer(name: modelName)
        self.container = container
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(contextDidChange(notification:)),
                                               name: Notification.Name.NSManagedObjectContextDidSave,
                                               object: self.viewContext)
    }
    
    
    func load() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
            }
        }
    }
    
    
    func deleteAll<T: NSFetchRequestResult>(dataType: T.Type) {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        viewContext.performAndWait {
            let cards = try? fetchRequest.execute()
            cards?.forEach {
                viewContext.delete($0 as! NSManagedObject)
            }
            try? viewContext.save()
        }
    }
    
    func loadData<T: NSFetchRequestResult>(dataType: T.Type) -> [T] {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        do {
            return try viewContext.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
        return [T]()
    }
    
    func addData<T: NSFetchRequestResult>(dataType: T.Type, object: T) -> Error? {
        do {
            viewContext.insert(object as! NSManagedObject)
            try viewContext.save()
        } catch let error {
            return error
        }
        return nil
    }
}

extension CoreData {
    @objc func contextDidChange(notification: Notification) {
        coordinator.performAndWait {
            viewContext.performAndWait {
                viewContext.mergeChanges(fromContextDidSave: notification)
            }
        }
    }
}

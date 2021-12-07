//
//  Person+CoreDataProperties.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 07.12.2021.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var baseParameters: Data?
    @NSManaged public var comment: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension Person : Identifiable {

}

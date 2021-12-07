//
//  DataBaseProtocol.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 07.12.2021.
//

import Foundation
import CoreData

protocol CoreDataProtocol {
    func deleteAll<T: NSFetchRequestResult>(dataType: T.Type)
    func loadData<T: NSFetchRequestResult>(dataType: T.Type) -> [T]
}

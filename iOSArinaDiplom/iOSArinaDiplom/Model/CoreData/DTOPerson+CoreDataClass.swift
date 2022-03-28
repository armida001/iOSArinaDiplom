//
//  Person+CoreDataClass.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 07.12.2021.
//
//

import Foundation
import CoreData

struct Person {
    var title: String
    var detail: String
    var parameters: [Parameter]?
    
    init(title: String? = nil,
         detail: String? = nil,
         parameters: [Parameter]? = nil) {
        self.title = title ?? ""
        self.detail = detail ?? ""
        self.parameters = parameters
    }
}

@objc(DTOPerson)
public class DTOPerson: NSManagedObject {
    public class DTOPerson: NSManagedObject {
    }
    
    private var _parametersDictionary: [DTOParameter]?
    var parametersDictionary: [DTOParameter] {
        get {
            if _parametersDictionary == nil {
                if let data = self.baseParameters {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [DTOParameter]
                        _parametersDictionary = json
                    } catch {
                        print("Something went wrong")
                    }
                }
            }
            return _parametersDictionary ?? [DTOParameter]()
        }
    }
    
    var parametersDictionaryData: Data? {
        get {
            do {
                return try JSONSerialization.data(withJSONObject: parametersDictionary,
                                                  options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let myJSONError {
                print(myJSONError)
            }
            return nil;
        }
    }
}

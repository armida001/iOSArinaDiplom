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
    let title: String
    let detail: String
    let parameters: [Parameter]?
}

@objc(Person)
public class DTOPerson: NSManagedObject {
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
    
//    // Convert from NSData to json object
//    func nsdataToJSON(data: NSData) -> AnyObject? {
//        do {
//            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
//        } catch let myJSONError {
//            print(myJSONError)
//        }
//        return nil
//    }
//
//    // Convert from JSON to nsdata
//    func jsonToNSData(json: AnyObject) -> NSData?{
//        do {
//            return try NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions.PrettyPrinted)
//        } catch let myJSONError {
//            print(myJSONError)
//        }
//        return nil;
//    }
}

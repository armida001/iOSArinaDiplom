//
//  Person+CoreDataClass.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 07.12.2021.
//
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {
    private var _parametersDictionary: [PersonParameterType : NSNumber]?
    var parametersDictionary: [PersonParameterType : NSNumber] {
        get {
            if _parametersDictionary == nil {
                if let data = self.baseParameters {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [PersonParameterType : NSNumber]
                        _parametersDictionary = json
                    } catch {
                        print("Something went wrong")
                    }
                }
            }
            return _parametersDictionary ?? [PersonParameterType : NSNumber]()
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

//
//  Swifty.swift
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

import Foundation
import UIKit

class Person: NSObject {
    private var name: String!
    private var comments: String?
    private var baseParameters: [PersonParameterType : NSNumber]!
    
    init(name: String, comments: String? = nil, parameters: [PersonParameterType : NSNumber] = [:]) {
        self.name = name
        self.comments = comments
        self.baseParameters = parameters
    }
    
    override init() {
        super.init()
        self.name = ""
        self.baseParameters = [PersonParameterType : NSNumber]()
    }
}

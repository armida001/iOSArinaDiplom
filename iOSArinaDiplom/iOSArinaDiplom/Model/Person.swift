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
    private var parameters: [PersonParameterType : NSNumber]!
    
    init(name: String, comments: String? = nil, parameters: [PersonParameterType : NSNumber] = [:]) {
        self.name = name
        self.comments = comments
        self.parameters = parameters
    }
    
    override init() {
        super.init()
        self.name = ""
        self.parameters = [PersonParameterType : NSNumber]()
    }
}

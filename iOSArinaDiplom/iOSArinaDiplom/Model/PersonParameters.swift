//
//  Swifty.swift
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

import Foundation
import UIKit

enum PersonParameterType: String {
    ///Обхват талии
    case waistGirth
    ///Обхват бёдер
    case hipGirth
    ///Обхват груди
    case chestGirth
    ///Рост
    case height
    
    func title() -> String {
        switch self {
        case .waistGirth:
            return "Обхват талии"
        case .hipGirth:
            return "Обхват бёдер"
        case .chestGirth:
            return "Обхват груди"
        case .height:
            return "Рост"
        }
    }
}

//
//  UserDefaults+Extension.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 27.03.2022.
//

import Foundation

enum UserDefaultsKey: String {
    case isPatternsNeedReload = "PatternsNeedReload"
}

extension UserDefaults {
    static func value(forKey key: UserDefaultsKey) -> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}

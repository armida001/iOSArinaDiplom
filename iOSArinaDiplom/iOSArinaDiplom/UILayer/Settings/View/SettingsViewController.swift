//
//  SettingsViewController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    static func create() -> SettingsViewController {
        SettingsViewController.init()
    }
}

extension SettingsViewController: SettingsListView {
    
}

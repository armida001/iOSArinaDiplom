//
//  PatternsListDisplayManager.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

protocol SettingsListDisplayManager {
    func configure(tableView: UITableView)
    func update(person: Person)
}

//
//  PatternsListDisplayManager.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

protocol PersonsListDisplayManager {
    func configure(tableView: UITableView)
    var array: [Person] { get set }
}

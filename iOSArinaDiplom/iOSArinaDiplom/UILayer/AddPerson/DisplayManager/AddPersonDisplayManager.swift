//
//  PatternsListDisplayManager.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

protocol AddPersonDisplayManager {
    func configure(tableView: UITableView)
    var person: PersonCellItem? { get set }
    var savePerson: ((PersonCellItem) -> Void)? { get set }
}

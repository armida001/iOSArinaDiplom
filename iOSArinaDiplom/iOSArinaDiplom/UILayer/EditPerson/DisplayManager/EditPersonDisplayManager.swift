//
//  PatternsListDisplayManager.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

protocol EditPersonDisplayManager {
    func configure(tableView: UITableView)
    var person: Person { get set }
    var savePerson: ((Person) -> Void)? { get set }
}

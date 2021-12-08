//
//  PatternsListDisplayManager.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

protocol PatternDisplayManager {
    func configure(tableView: UITableView)
    var pattern: PatternCellItem { get set }
}

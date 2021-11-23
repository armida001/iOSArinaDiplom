//
//  PersonsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PersonsListController: UITableViewController {
    static func create() -> PersonsListController {
        PersonsListController.init()
    }
}

extension PersonsListController: PersonsListView {
    
}

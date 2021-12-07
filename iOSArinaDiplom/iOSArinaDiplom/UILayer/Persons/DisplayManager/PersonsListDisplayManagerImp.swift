//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PersonsListDisplayManagerImp: NSObject {
    var array: [Person]
    private var tableView: UITableView?
    
    init(array: [Person] = [Person]()) {
        self.array = array
    }
}

extension PersonsListDisplayManagerImp: PersonsListDisplayManager {
    func configure(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
}

extension PersonsListDisplayManagerImp: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "",
                                                       for: indexPath) as? PersonCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

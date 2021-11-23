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
    
    func configure(tableView: UITableView) {
        self.tableView = tableView
//        self.tableView?.register(PatternCell.self, forCellWithReuseIdentifier: "PatternCell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
    init(array: [Person] = [Person]()) {
        self.array = array
    }
}

extension PersonsListDisplayManagerImp: PersonsListDisplayManager {
    
}

extension PersonsListDisplayManagerImp: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        0
    }
}

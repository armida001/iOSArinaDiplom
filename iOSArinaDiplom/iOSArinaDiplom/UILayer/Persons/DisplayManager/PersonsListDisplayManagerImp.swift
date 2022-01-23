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
        self.tableView?.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        self.tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension PersonsListDisplayManagerImp: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell",
                                                       for: indexPath) as? PersonCell else {
            return UITableViewCell()
        }        
        cell.configure(with: array[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
}

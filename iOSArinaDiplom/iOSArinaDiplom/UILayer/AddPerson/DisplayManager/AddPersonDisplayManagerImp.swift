//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class AddPersonDisplayManagerImp: NSObject {
    var person: PersonCellItem?
    private var tableView: UITableView?
    var savePerson: ((PersonCellItem) -> Void)?
}

extension AddPersonDisplayManagerImp: AddPersonDisplayManager {
    func configure(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(ParameterCell.self, forCellReuseIdentifier: "ParameterCell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        self.tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
}

extension AddPersonDisplayManagerImp: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParameterCell",
                                                       for: indexPath) as? ParameterCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.configure(with: "Рост", value: "165")
        case 1:
            cell.configure(with: "Обхват груди", value: "90")
        case 2:
            cell.configure(with: "Обхват талии", value: "60")
        case 3:
            cell.configure(with: "Обхват бёдер", value: "90")
        default:
            cell.configure(with: "Рост", value: "165")
        }
        
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

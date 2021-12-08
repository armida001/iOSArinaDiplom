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
        self.tableView?.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        self.tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension AddPersonDisplayManagerImp: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "",
                                                       for: indexPath) as? PersonCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = person?.title
        cell.detailTextLabel?.text = person?.title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
}

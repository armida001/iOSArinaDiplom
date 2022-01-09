//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class EditPersonDisplayManagerImp: NSObject {
    var person: PersonCellItem
    private var tableView: UITableView?
    var savePerson: ((PersonCellItem) -> Void)?
    private var parameterKeysArray: [PersonParameterType] = [PersonParameterType]()
    init(person: PersonCellItem) {
        self.person = person
        if let params = person.parameters?.keys.sorted(by: { $0.rawValue > $1.rawValue } ) {
            self.parameterKeysArray = params
        }
    }
}

extension EditPersonDisplayManagerImp: EditPersonDisplayManager {
    func configure(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(ParameterCell.self, forCellReuseIdentifier: "ParameterCell")
        self.tableView?.register(ButtonFooterView.self, forHeaderFooterViewReuseIdentifier: "ButtonFooterView")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        self.tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}

extension EditPersonDisplayManagerImp: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        parameterKeysArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParameterCell",
                                                       for: indexPath) as? ParameterCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            cell.configure(with: ParameterCellItem(key: "name", title: "Имя", value: person.title))
        } else {
            let key = parameterKeysArray[indexPath.row]
            if let parameterValue = person.parameters?[key]?.stringValue {
                cell.configure(with: ParameterCellItem(key: key.rawValue,
                                                       title: key.title(),
                                                       value: parameterValue))
            } else {
                cell.configure(with: ParameterCellItem(key: "detail", title: "Описание", value: person.detail))
            }
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ButtonFooterView") as? ButtonFooterView else { return ButtonFooterView() }
        footerView.configure(with: "Сохранить") { [weak self] in
            guard let self = self else { return }
            self.savePerson?(PersonCellItem(id: "",
                                            title: "Name",
                                            detail: "Comment",
                                            parameters: nil))
        }
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        84
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 13))
    }
}

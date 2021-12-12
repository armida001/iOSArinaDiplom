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
    
    init(person: PersonCellItem) {
        self.person = person
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
        (person.parameters?.values.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParameterCell",
                                                       for: indexPath) as? ParameterCell else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.configure(with: ParameterCellItem(key: "name", title: "Имя", value: person.title))
        case 1:
            let parameterType = PersonParameterType.chestGirth
            let parameterValue = person.parameters?[parameterType]?.stringValue ?? ""
            cell.configure(with: ParameterCellItem(key: parameterType.rawValue,
                                                   title: parameterType.title(),
                                                   value: parameterValue))
        case 2:
            let parameterType = PersonParameterType.waistGirth
            let parameterValue = person.parameters?[parameterType]?.stringValue ?? ""
            cell.configure(with: ParameterCellItem(key: parameterType.rawValue,
                                                   title: parameterType.title(),
                                                   value: parameterValue))
        case 3:
            let parameterType = PersonParameterType.hipGirth
            let parameterValue = person.parameters?[parameterType]?.stringValue ?? ""
            cell.configure(with: ParameterCellItem(key: parameterType.rawValue,
                                                   title: parameterType.title(),
                                                   value: parameterValue))
        case 4:
            let parameterType = PersonParameterType.height
            let parameterValue = person.parameters?[parameterType]?.stringValue ?? ""
            cell.configure(with: ParameterCellItem(key: parameterType.rawValue,
                                                   title: parameterType.title(),
                                                   value: parameterValue))
        default:
            cell.configure(with: ParameterCellItem(key: "detail", title: "Описание", value: person.detail))
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
            self.savePerson?(self.person)
        }
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        68
    }
}

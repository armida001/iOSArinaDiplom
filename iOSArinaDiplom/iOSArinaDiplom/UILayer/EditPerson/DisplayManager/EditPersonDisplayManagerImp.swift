//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class EditPersonDisplayManagerImp: NSObject {
    var person: Person
    private var tableView: UITableView?
    var savePerson: ((Person) -> Void)?
    private var parametersArray: [Parameter] = [Parameter]()
    init(person: Person) {
        self.person = person
        if let params = person.parameters?.sorted(by: { $0.type.rawValue > $1.type.rawValue } ) {
            self.parametersArray = params
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
        parametersArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParameterCell",
                                                       for: indexPath) as? ParameterCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            cell.configure(with: Parameter(type: PersonParameterType.name, value: person.title))
        } else {
            let parameter = parametersArray[indexPath.row]
            cell.configure(with: parameter)
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
            self.savePerson?(Person(title: self.person.title,
                                    detail: self.person.detail,
                                    parameters: self.parametersArray))
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

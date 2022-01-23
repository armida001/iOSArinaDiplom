//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class SettingsListDisplayManagerImp: NSObject, SettingsListDisplayManager {
    private var tableView: UITableView?
    private var person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    func configure(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(PatternHeaderCell.self, forCellReuseIdentifier: "PatternHeaderCell")
        tableView.register(SettingsParamsCell.self, forCellReuseIdentifier: "SettingsParamsCell")
        tableView.register(ButtonFooterView.self, forHeaderFooterViewReuseIdentifier: "ButtonFooterView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func update(person: Person) {
        self.person = person
        self.tableView?.reloadData()
    }
}


extension SettingsListDisplayManagerImp: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatternHeaderCell", for: indexPath) as? PatternHeaderCell else {
                return PatternHeaderCell()
            }
            
            cell.configure(title: person.title, subTitle: person.detail)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsParamsCell", for: indexPath) as? SettingsParamsCell else {
            return SettingsParamsCell()
        }
        
        if let parameters = person.parameters {
            cell.configure(params: parameters)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 13))
    }
}

//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

class PatternDisplayManagerImp: NSObject {
    private var tableView: UITableView?
    
    var pattern: PatternCellItem
    
    func configure(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(PatternIconView.self, forHeaderFooterViewReuseIdentifier: "PatternIconView")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none        
    }
    
    init(pattern: PatternCellItem) {
        self.pattern = pattern
    }
}

extension PatternDisplayManagerImp: PatternDisplayManager {
    
}

extension PatternDisplayManagerImp: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        cell.textLabel?.text = pattern.title
        cell.detailTextLabel?.text = pattern.detail
        
        cell.textLabel?.font = UIFont
            .systemFont(ofSize: 19, weight: UIFont.Weight.semibold)
        cell.detailTextLabel?.font = UIFont
            .systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PatternIconView") as? PatternIconView else { return nil }
        
        header.configure(with: pattern.imageInfo?.url, title: pattern.patternTypeName)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
}

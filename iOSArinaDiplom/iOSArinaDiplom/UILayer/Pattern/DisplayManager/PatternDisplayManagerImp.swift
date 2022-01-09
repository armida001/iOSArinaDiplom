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
    private var topInset: CGFloat = 0
    var pattern: PatternCellItem
    
    func configure(tableView: UITableView) {
        self.tableView = tableView
        topInset = tableView.contentInset.top
        tableView.register(PatternHeaderCell.self, forCellReuseIdentifier: "PatternHeaderCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.sectionHeaderHeight = 14
        tableView.tableHeaderView = RoundedHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 14))
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatternHeaderCell", for: indexPath) as? PatternHeaderCell else {
            return PatternHeaderCell()
        }
        
        cell.configure(title: pattern.title, subTitle: pattern.patternTypeName)
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {        
        if scrollView.contentOffset.y < -topInset {
            scrollView.contentOffset = CGPoint(x: 0, y: -topInset)
        }
    }
}

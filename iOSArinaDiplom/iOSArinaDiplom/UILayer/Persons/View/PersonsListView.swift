//
//  PatternsListView.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol PersonsListView {
    func reloadData(_ array: [Person])
    func showError(_ error: NetworkError)    
}

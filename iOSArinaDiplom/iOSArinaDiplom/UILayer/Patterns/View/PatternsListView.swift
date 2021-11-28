//
//  PatternsListView.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol PatternsListView: NSObjectProtocol {
    func reloadData(_ data: [Pattern])
    func showError(_ error: NetworkError)
}

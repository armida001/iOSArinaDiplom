//
//  PatternsListView.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol AddPersonView {
    func reloadData(_ person: PersonCellItem)
    func showError(_ error: NetworkError)
}

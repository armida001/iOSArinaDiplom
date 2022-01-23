//
//  PatternsListView.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol EditPersonView {
    func reloadData(_ person: Person)
    func showError(_ error: NetworkError)
}

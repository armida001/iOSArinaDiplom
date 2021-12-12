//
//  PatternsListPresenter.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol PersonsListPresenter {
    var state: PersonsListPresenterState { get set }
    func configure(view: PersonsListView)
    func reloadData()
    func addPerson(_: PersonCellItem)
}

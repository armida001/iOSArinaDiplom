//
//  PatternsListPresenter.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol PatternsListPresenter {
    var state: PatternsListPresenterState { get set }
    func configure(view: PatternsListView)
    func reloadData()
}

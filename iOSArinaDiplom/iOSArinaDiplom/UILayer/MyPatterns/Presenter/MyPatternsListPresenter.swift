//
//  PatternsListPresenter.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol MyPatternsListPresenter {
    var state: MyPatternsListPresenterState { get set }
    func configure(view: MyPatternsListView)
    func reloadData()
}

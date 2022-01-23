//
//  PatternsListPresenter.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol SettingsListPresenter {
    var state: SettingsListPresenterState { get set }
    func configure(view: SettingsListView)
    func reloadData()
}

//
//  PatternsListPresenter.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol PatternPresenter {
    var state: PatternPresenterState { get set }
    func configure(view: PatternView)
    func reloadData()
}

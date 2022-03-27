//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class MyPatternsListPresenterImp: PatternsListPresenter {
    internal var state: PatternsListPresenterState
    private var view: PatternsListView?
    private var patternsService: PatternsService?
    
    
    init(state: PatternsListPresenterState) {
        self.state = state
        self.patternsService = PatternsServiceImpl()
    }
    
    func configure(view: PatternsListView) {
        self.view = view
    }
    
    func reloadData() {
        patternsService?.loadData(completionHandler: { [weak self] array in
            DispatchQueue.main.async {
                self?.view?.reloadData(array.compactMap({ $0.convertToPatternCellItem() }))
            }
        }, errorCompletion: { [weak self] error in
            DispatchQueue.main.async {
                self?.view?.showError(error)
            }
        })
    }
}

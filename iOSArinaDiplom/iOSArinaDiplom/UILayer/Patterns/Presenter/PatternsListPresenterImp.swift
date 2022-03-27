//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class PatternsListPresenterImp: PatternsListPresenter {
    internal var state: PatternsListPresenterState
    private var view: PatternsListView?
    private var service: PatternsService?
    
    
    init(state: PatternsListPresenterState) {
        self.state = state
        self.service = PatternsServiceImpl()
    }
    
    func configure(view: PatternsListView) {
        self.view = view
    }
    
    func reloadData() {
        service?.loadData(completionHandler: { [weak self] array in
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

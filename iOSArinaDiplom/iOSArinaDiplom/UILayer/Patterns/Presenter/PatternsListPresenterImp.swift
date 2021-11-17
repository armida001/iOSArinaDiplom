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
    private var service: PatternsNetworkServiceProtocol?
    
    
    init(state: PatternsListPresenterState) {
        self.state = state
        self.service = PatternsNetworkService()
    }
    
    func configure(view: PatternsListView) {
        self.view = view
    }
    
    func reloadData() {
        service?.getPatterns(after: "", completion: { [weak self] array in
            DispatchQueue.main.async {
                self?.view?.reloadData(array)
            }
        }, errorCompletion: { [weak self] error in
            DispatchQueue.main.async {
                self?.view?.showError(error)
            }
        })
    }
}

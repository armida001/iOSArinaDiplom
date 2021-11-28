//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class MyPatternsListPresenterImp: MyPatternsListPresenter {
    internal var state: MyPatternsListPresenterState
    private var view: MyPatternsListView?
    private var service: PatternsServiceProtocol?
    
    
    init(state: MyPatternsListPresenterState) {
        self.state = state
        self.service = PatternsService()
    }
    
    func configure(view: MyPatternsListView) {
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

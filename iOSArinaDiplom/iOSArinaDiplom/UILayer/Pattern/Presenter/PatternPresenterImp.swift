//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class PatternPresenterImp: PatternPresenter {
    internal var state: PatternPresenterState
    private var view: PatternView?
    private var service: PatternsProtocol?
    
    
    init(state: PatternPresenterState) {
        self.state = state
        self.service = PatternsService()
    }
    
    func configure(view: PatternView) {
        self.view = view
    }
    
    func reloadData() {
//        service?.loadData(completionHandler: { [weak self] array in
//            DispatchQueue.main.async {
        self.view?.reloadData(state.object)
//            }
//        }, errorCompletion: { [weak self] error in
//            DispatchQueue.main.async {
//                self?.view?.showError(error)
//            }
//        })
    }
}

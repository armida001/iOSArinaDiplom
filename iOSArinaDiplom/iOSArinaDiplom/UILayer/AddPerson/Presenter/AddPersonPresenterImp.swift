//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class AddPersonPresenterImp: AddPersonPresenter {
    internal var state: AddPersonPresenterState
    private var view: AddPersonView?
    private var service: PersonsDataService?
    
    
    init(state: AddPersonPresenterState) {
        self.state = state
        self.service = PersonsDataService()
    }
    
    func configure(view: AddPersonView) {
        self.view = view
    }
    
    func reloadData() {
//        service?.loadData(completionHandler: { [weak self] array in
//            DispatchQueue.main.async {
//                self?.view?.reloadData(array)
//            }
//        }, errorCompletion: { [weak self] error in
//            DispatchQueue.main.async {
//                self?.view?.showError(error as? NetworkError ?? NetworkError.unknown)
//            }
//        })
    }
}

//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PersonsListPresenterImp: PersonsListPresenter {
    internal var state: PersonsListPresenterState
    private var view: PersonsListView?
    private var service: PersonsDataService?
    
    
    init(state: PersonsListPresenterState) {
        self.state = state
        self.service = PersonsDataService()
    }
    
    func configure(view: PersonsListView) {
        self.view = view
    }
    
    func reloadData() {
        service?.loadData(completionHandler: { [weak self] array in
            DispatchQueue.main.async {
                self?.view?.reloadData(array.compactMap({ person in
                    return PersonCellItem(id: person.id?.uuidString ?? "", title: person.name ?? "", detail: person.comment ?? "", parameters: person.parametersDictionary)
                }))
            }
        }, errorCompletion: { [weak self] error in
            DispatchQueue.main.async {
                self?.view?.showError(error as? NetworkError ?? NetworkError.unknown)
            }
        })
    }
    
    func addPerson(_: PersonCellItem) {
//        service?.
    }
}

//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class EditPersonPresenterImp: EditPersonPresenter {
    internal var state: EditPersonPresenterState
    internal var editCompletion: (() -> Void)?
    
    private var view: EditPersonView?
    private var personsDataProvider: PersonsDataProvider = PersonsDataProviderImpl()
    
    init(state: EditPersonPresenterState,
         editCompletion: @escaping (() -> Void)) {
        self.state = state
        self.editCompletion = editCompletion
    }
    
    func configure(view: EditPersonView) {
        self.view = view
    }
    
    func addPerson(person: Person) {
        personsDataProvider.addPerson(person, completionHandler: { [weak self] in
            self?.editCompletion?()
        }, errorCompletion: { error in
            
        })
    }
}

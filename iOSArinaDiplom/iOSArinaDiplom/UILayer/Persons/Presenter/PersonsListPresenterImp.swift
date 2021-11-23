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
    private var service: PersonsDataServiceProtocol?
    
    
    init(state: PersonsListPresenterState) {
        self.state = state
        self.service = PersonsDataService()
    }
    
    func configure(view: PersonsListView) {
        self.view = view
    }
    
    func reloadData() {        
    }
}

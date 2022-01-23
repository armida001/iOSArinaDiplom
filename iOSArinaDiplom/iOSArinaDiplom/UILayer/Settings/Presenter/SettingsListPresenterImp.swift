//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class SettingsListPresenterImp: SettingsListPresenter {
    internal var state: SettingsListPresenterState
    private var view: SettingsListView?
    private var service: PatternsProtocol?
    private var dataService: PersonsDataService?
    
    init(state: SettingsListPresenterState) {
        self.state = state
        self.service = PatternsService()
        self.dataService = PersonsDataService()
    }
    
    func configure(view: SettingsListView) {
        self.view = view
    }
    
    func reloadData() {
        dataService?.loadData(completionHandler: { [weak self] persons in
            var personItem = persons.first ?? Person(title: "Мои данные",
                                            detail: "Основные параметры",
                                            parameters: [Parameter(type: PersonParameterType.chestGirth, value: ""),
                                                         Parameter(type: PersonParameterType.waistGirth, value: ""),
                                                         Parameter(type: PersonParameterType.hipGirth, value: "")])                        
            self?.state = SettingsListPresenterState(myData: personItem)
            self?.view?.reloadView()
        }, errorCompletion: { error in
            
        })
    }
}

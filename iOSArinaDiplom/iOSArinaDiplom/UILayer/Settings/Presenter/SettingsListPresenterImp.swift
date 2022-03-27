//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class SettingsListPresenterImp: SettingsListPresenter {
    private var view: SettingsListView?
    
    private var state: SettingsListPresenterState
    private let patternService: PatternsService
    private let dataProvider: PersonsDataProvider
    
    init(state: SettingsListPresenterState,
         patternService: PatternsService,
         dataProvider: PersonsDataProvider) {
        self.state = state
        self.patternService = patternService
        self.dataProvider = dataProvider
    }
    
    func configure(view: SettingsListView) {
        self.view = view
    }
    
    func reloadData() {
        dataProvider.loadData(completionHandler: { [weak self] persons in
            let personItem = persons.first ?? Person(title: "Мои данные",
                                            detail: "Основные параметры",
                                            parameters: [Parameter(type: PersonParameterType.chestGirth, value: ""),
                                                         Parameter(type: PersonParameterType.waistGirth, value: ""),
                                                         Parameter(type: PersonParameterType.hipGirth, value: "")])                        
            self?.state = SettingsListPresenterState(myData: personItem)
            self?.view?.reloadView(personItem)
        }, errorCompletion: { error in
            
        })
    }
}

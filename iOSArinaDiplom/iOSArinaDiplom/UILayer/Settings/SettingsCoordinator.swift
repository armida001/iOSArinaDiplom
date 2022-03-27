//
//  SettingsCoordinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class SettingsCoordinator: Coordinator {
    private var navigationController: UINavigationController?
    
    func start() {
        let defaultPersonItem = Person()
        let presenter = SettingsListPresenterImp(state:
                                                    SettingsListPresenterState(
                                                        myData: defaultPersonItem),
                                                        patternService: PatternsServiceImpl(),
                                                        dataProvider: PersonsDataProviderImpl())
        let displayManager = SettingsListDisplayManagerImp(person: defaultPersonItem)
        
        let controller = SettingsViewController(presenter: presenter,
                                                displayManager: displayManager)
        controller.title = "Мои параметры"
        controller.navigationItem.rightBarButtonItems = []
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

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
        let controller = EditPersonController.create(savePerson: { person in
            if let params = person.parameters {
                for key in params.keys {
                    UserDefaults.standard.setValue(params[key], forKeyPath: key.rawValue)
                }
            }
        })
        
        controller.title = "Мои параметры"
        controller.navigationItem.rightBarButtonItems = []
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

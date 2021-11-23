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
        self.navigationController?.pushViewController(SettingsViewController.create(), animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

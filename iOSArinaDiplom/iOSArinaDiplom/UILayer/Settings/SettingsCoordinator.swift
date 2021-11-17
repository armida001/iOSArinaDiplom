//
//  SettingsCoordinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

class SettingsCoordinator: Coordinator {
    private var navigationController: UINavigationController?
    
    func start() {
        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

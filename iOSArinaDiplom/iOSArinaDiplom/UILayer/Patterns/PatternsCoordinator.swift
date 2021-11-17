//
//  PatternsCoorinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PatternsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController?
    
    func start() {
        self.navigationController?.pushViewController(PatternsListController.create(), animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

//
//  PatternsCoorinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class MyPatternsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController?
    
    func start() {
        self.navigationController?.pushViewController(MyPatternsListController.create(showPattern: { pattern in
            self.showPattern(pattern: pattern)
        }), animated: true)        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPattern(pattern: PatternCellItem) {
        self.navigationController?.pushViewController(PatternController.create(pattern: pattern), animated: true)
    }
}

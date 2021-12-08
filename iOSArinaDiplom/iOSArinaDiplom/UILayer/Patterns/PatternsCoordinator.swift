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
        let patternController = PatternsListController.create(showPattern: { [weak self] pattern in
            self?.showPattern(pattern: pattern)
        })
        self.navigationController?.pushViewController(patternController, animated: true)        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPattern(pattern: PatternCellItem) {
        self.navigationController?.pushViewController(PatternController.create(pattern: pattern), animated: true)
    }
}

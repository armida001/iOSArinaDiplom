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
        self.navigationController?.pushViewController(MyPatternsListController.create(), animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

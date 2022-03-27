//
//  PatternsCoorinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class MyPatternsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController?
    
    func start() {
        let patternController = MyPatternsListController(
            presenter: MyPatternsListPresenterImp(state: PatternsListPresenterState(array: [])),
            displayManager: MyPatternsListDisplayManagerImp(
                array: [],
                showPattern: { [weak self]  pattern in
                    self?.showPattern(pattern: pattern)
                })
        )
        self.navigationController?.pushViewController(patternController, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPattern(pattern: PatternCellItem) {
        let controller = PatternController.create(
            presenter: PatternPresenterImp(state: PatternPresenterState(object: pattern)),
            displayManager: PatternDisplayManagerImp(pattern: pattern))
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

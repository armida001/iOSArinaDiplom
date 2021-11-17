//
//  RootCoordinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

class RootCoordinator: Coordinator {
    private var navigationController: UINavigationController?
    
    func start() {
        
    }
    
    func startWithError(error: NetworkServiceError) {
        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

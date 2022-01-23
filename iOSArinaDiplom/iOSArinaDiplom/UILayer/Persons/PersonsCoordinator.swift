//
//  PersonsCoordinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PersonsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController?
    private var currentAddedPerson: Person?
    
    func start() {
        let controller = PersonsListController.create { [weak self] in
            self?.showAddPerson()
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showAddPerson() {
        self.navigationController?.present(EditPersonController.create(savePerson: { [weak self] person in
            self?.currentAddedPerson = person
        }), animated: true, completion: nil)
    }
}

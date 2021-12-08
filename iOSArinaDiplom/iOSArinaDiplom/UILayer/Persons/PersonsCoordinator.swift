//
//  PersonsCoordinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PersonsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController?
    
    func start() {
        let controller = PersonsListController.create { [weak self] in
            self?.showAddPerson { person in
                
            }
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showAddPerson(completion: @escaping (PersonCellItem) -> Void ) {
        self.navigationController?.present(AddPersonController.create(savePerson: { person in
            completion(person)
        }), animated: true, completion: nil)
    }
}

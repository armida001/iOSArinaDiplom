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
        let controller = PersonsListController(
            presenter: PersonsListPresenterImp(
                state: PersonsListPresenterState(array: [])),
            displayManager: PersonsListDisplayManagerImp(),
            addNewPerson: { [weak self] in
                self?.showAddPerson()
            })
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showAddPerson() {
        let emptyPerson = Person(title: "", detail: "", parameters: nil)
        let displayManager = EditPersonDisplayManagerImp(person: emptyPerson,
                                                         savePerson: { [weak self] person in
            self?.currentAddedPerson = person
        })
        let controller = EditPersonController.create(
            presenter: EditPersonPresenterImp(state: EditPersonPresenterState(person: emptyPerson)),
            displayManager: displayManager)
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
}

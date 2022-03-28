//
//  PersonsCoordinator.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PersonsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController?
    private var rootPersonsPresenter: PersonsListPresenter = PersonsListPresenterImp(state: PersonsListPresenterState(array: []))
    private var currentAddedPerson: Person?
    
    func start() {
        let rootPersonsListController = PersonsListController(
            presenter: rootPersonsPresenter,
            displayManager: PersonsListDisplayManagerImp(),
            addNewPerson: { [weak self] in
                self?.showAddPerson()
            })
            navigationController?.pushViewController(rootPersonsListController, animated: true)
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
            presenter: EditPersonPresenterImp(
                state: EditPersonPresenterState(person: emptyPerson),
                editCompletion: { [weak self] in
                    self?.rootPersonsPresenter.reloadData()
                }),
            displayManager: displayManager)
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
}

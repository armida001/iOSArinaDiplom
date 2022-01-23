//
//  PersonsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class EditPersonController: UITableViewController {
    private var displayManager: EditPersonDisplayManager!
    private var presenter: EditPersonPresenter!
    
    static func create( savePerson: @escaping ((Person) -> Void)) -> EditPersonController {
        let controller = EditPersonController.init()
        var presenterState = EditPersonPresenterState()
        let person = Person(title: "", detail: "", parameters: nil)
        presenterState.person = person
        controller.presenter = EditPersonPresenterImp(state: presenterState)
        controller.displayManager = EditPersonDisplayManagerImp(person: person)
        controller.configure()
        
        controller.title = "Мерки людей"
//
//        let icon = UIImage(named: "plus")
//        let barItem = UIBarButtonItem(image: icon, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addPerson))
//        barItem.imageInsets = UIEdgeInsets(top: 4, left: 20, bottom: -4, right: -5)
//        controller.navigationItem.rightBarButtonItems = [barItem]
//        controller.navigationController?.navigationItem.rightBarButtonItem?.title = "+"
        
        return controller
    }
    
    private func configure() {
        self.displayManager.savePerson = { [weak self] person in
            self?.presenter.addPerson(person: person)            
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configure(view: self)
        displayManager.configure(tableView: tableView)
        tableView.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.black
        tableView.reloadData()
    }
    
//    @objc private func addPerson() {
//        presenter.addPerson()
//    }
}

extension EditPersonController: EditPersonView {
    func reloadData(_ person: Person) {
        tableView.reloadData()
    }
    
    func showError(_ error: NetworkError) {
        
    }
}

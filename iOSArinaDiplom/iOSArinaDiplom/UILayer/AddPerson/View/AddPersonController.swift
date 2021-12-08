//
//  PersonsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class AddPersonController: UITableViewController {
    private var displayManager: AddPersonDisplayManager!
    private var presenter: AddPersonPresenter!
    
    static func create(savePerson: @escaping ((PersonCellItem) -> Void)) -> AddPersonController {
        let controller = AddPersonController.init()
        controller.presenter = AddPersonPresenterImp(state: AddPersonPresenterState())
        controller.displayManager = AddPersonDisplayManagerImp()
        controller.displayManager.savePerson = savePerson
        return controller
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

        let icon = UIImage(named: "plus")
        let barItem = UIBarButtonItem(image: icon, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addPerson))
        barItem.imageInsets = UIEdgeInsets(top: 4, left: 20, bottom: -4, right: -5)
        navigationItem.rightBarButtonItems = [barItem]
        navigationController?.navigationItem.rightBarButtonItem?.title = "+"
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.black
        
        title = "Мерки людей"
        tableView.reloadData()
    }
    
    @objc private func addPerson() {
        
    }
}

extension AddPersonController: AddPersonView {
    func reloadData(_ person: PersonCellItem) {
        tableView.reloadData()
    }
    
    func showError(_ error: NetworkError) {
        
    }
}

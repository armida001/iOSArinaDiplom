//
//  PersonsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class PersonsListController: UITableViewController {
    private var displayManager: PersonsListDisplayManager!
    private var presenter: PersonsListPresenter!
    
    var showAddPerson: (() -> Void)?
    
    static func create(showAddPerson: @escaping () -> Void) -> PersonsListController {
        let controller = PersonsListController()
        controller.showAddPerson = showAddPerson
        controller.displayManager = PersonsListDisplayManagerImp()
        controller.presenter = PersonsListPresenterImp(state: PersonsListPresenterState(array: [PersonCellItem]()))
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configure(view: self)
        self.tableView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.displayManager.configure(tableView: self.tableView)
        self.presenter.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let icon = UIImage(named: "plus")
        let barItem = UIBarButtonItem(image: icon, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addPersonClick))
        barItem.imageInsets = UIEdgeInsets(top: 4, left: 20, bottom: -4, right: -5)
        navigationItem.rightBarButtonItems = [barItem]
        navigationController?.navigationItem.rightBarButtonItem?.title = "+"
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.black
        
        title = "Мерки людей"
    }
    
    @objc private func addPersonClick() {
        showAddPerson?()
    }
}

extension PersonsListController: PersonsListView {
    func reloadData(_ array: [PersonCellItem]) {
        tableView.reloadData()
    }
    
    func showError(_ error: NetworkError) {
        
    }
}

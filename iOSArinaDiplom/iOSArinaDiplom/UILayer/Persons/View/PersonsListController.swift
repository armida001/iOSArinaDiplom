//
//  PersonsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class PersonsListController: UITableViewController {
    private var displayManager: PersonsListDisplayManager!
    private var presenter: PersonsListPresenter!
    internal var addNewPerson: (() -> Void)!
    
    init(
        presenter: PersonsListPresenter,
        displayManager: PersonsListDisplayManager,
        addNewPerson: @escaping () -> Void
    ) {
        self.presenter = presenter
        self.displayManager = displayManager
        self.addNewPerson = addNewPerson
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configure(view: self)
        self.tableView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.displayManager.configure(tableView: tableView)
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
        addNewPerson()
    }
}

extension PersonsListController: PersonsListView {
    func reloadData(_ array: [Person]) {
        displayManager.array = array
        tableView.reloadData()
    }
    
    func showError(_ error: NetworkError) {
        
    }
}

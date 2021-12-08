//
//  PatternsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class PatternController: UITableViewController {
    private var displayManager: PatternDisplayManager!
    private var presenter: PatternPresenter!
    
    static func create(pattern: PatternCellItem) -> PatternController {
        let controller = PatternController()
        controller.presenter = PatternPresenterImp(state: PatternPresenterState.init(object: pattern))
        controller.displayManager = PatternDisplayManagerImp(pattern: pattern)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configure(view: self)
        view.backgroundColor = UIColor.white
        tableView.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.white
        title = "Выкройка"
        displayManager.configure(tableView: tableView)
        presenter.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem?.title = ""
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.black
    }
}

extension PatternController: PatternView {
    func showError(_ error: NetworkError) {
        
    }
    
    func reloadData(_ data: PatternCellItem) {
        self.displayManager.pattern = data
        self.tableView.reloadData()
    }
}

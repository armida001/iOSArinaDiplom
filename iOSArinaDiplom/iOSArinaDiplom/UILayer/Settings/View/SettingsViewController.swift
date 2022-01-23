//
//  SettingsViewController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    private var displayManager: SettingsListDisplayManager!
    private var presenter: SettingsListPresenter!
    private var tableView: UITableView!
    private var imageView: UIImageView!
    
    static func create() -> SettingsViewController {
        let controller = SettingsViewController()
        
        let personItem = Person(title: "",
                                detail: "",
                                parameters: nil)
        
        controller.presenter = SettingsListPresenterImp(state: SettingsListPresenterState(myData: personItem))
        controller.displayManager = SettingsListDisplayManagerImp(person: personItem)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
        presenter.configure(view: self)
        tableView.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.white
        displayManager.configure(tableView: tableView)
        presenter.reloadData()
        title = "Список выкроек"
    }
    
    private func setupConstraints() {
        
        let width = UIScreen.main.bounds.size.width
        let height = width - 2*width / 10
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "user")?.withTintColor(UIColor.purple.withAlphaComponent(0.6))
        imageView.tintColor = UIColor.purple.withAlphaComponent(0.6)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: height),
            
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension SettingsViewController: SettingsListView {
    func reloadView() {
        self.displayManager.update(person: self.presenter.state.myData)
    }
}

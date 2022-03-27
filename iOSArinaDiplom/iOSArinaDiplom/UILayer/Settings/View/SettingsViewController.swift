//
//  SettingsViewController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class SettingsViewController: UIViewController {
    private var displayManager: SettingsListDisplayManager!
    private var presenter: SettingsListPresenter!
    private var tableView: UITableView!
    private var imageView: UIImageView!

    
    init(
        presenter: SettingsListPresenter,
        displayManager: SettingsListDisplayManager
    ) {
        self.presenter = presenter
        self.displayManager = displayManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupConstraints()
        presenter.configure(view: self)
        displayManager.configure(tableView: tableView)
        presenter.reloadData()
    }
    
    private func configure() {
        imageView = UIImageView()
        imageView.image = UIImage(named: "user")?.withTintColor(UIColor.purple.withAlphaComponent(0.6))
        imageView.tintColor = UIColor.purple.withAlphaComponent(0.6)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        
        tableView.clipsToBounds = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        title = "Список выкроек"
        tableView.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.white
    }
    
    private func setupConstraints() {
        let width = UIScreen.main.bounds.size.width
        let height = width - 2*width / 10
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
                
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
    func reloadView(_ person: Person) {
        self.displayManager.update(person: person)
    }
}

//
//  PatternsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class PatternController: UIViewController {
    private var displayManager: PatternDisplayManager!
    private var presenter: PatternPresenter!
    private var tableView: UITableView!
    private var imageView: UIImageView!
    
    static func create(pattern: PatternCellItem) -> PatternController {
        let controller = PatternController()
        controller.presenter = PatternPresenterImp(state: PatternPresenterState.init(object: pattern))
        controller.displayManager = PatternDisplayManagerImp(pattern: pattern)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = ""
        
        navigationItem.backBarButtonItem?.title = ""
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        setupConstraints()
        presenter.configure(view: self)
        displayManager.configure(tableView: tableView)
        presenter.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = self.displayManager.pattern.imageInfo?.url {
            PatternsService.loadImage(image: url) { [weak self] image in
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = image
                }
            }
        }
    }
    
    private func setupConstraints() {
        
        let width = UIScreen.main.bounds.size.width
        let height = width - 2*width / 10
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.clipsToBounds = false        
        tableView.contentInset = UIEdgeInsets(top: height-20, left: 0, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: height),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension PatternController: PatternView {
    func showError(_ error: NetworkError) {
        
    }
    
    func reloadData(_ data: PatternCellItem) {
        displayManager.pattern = data
        tableView.reloadData()
    }
}

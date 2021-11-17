//
//  PatternsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class PatternsListController: UICollectionViewController {
    private var displayManager: PatternsListDisplayManager = PatternsListDisplayManagerImp()
    private var presenter: PatternsListPresenter!
    
    static func create() -> PatternsListController {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let controller = PatternsListController.init(collectionViewLayout: layout)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = PatternsListPresenterImp(state: PatternsListPresenterState.init(array: []))
        self.presenter.configure(view: self)
        self.collectionView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.displayManager.configure(collectionView: self.collectionView)
        self.presenter.reloadData()
    }
}

extension PatternsListController: PatternsListView {
    func showError(_ error: NetworkServiceError) {
        
    }
    
    func reloadData(_ data: [Pattern]) {
        self.displayManager.array = data
        self.collectionView.reloadData()
    }
}

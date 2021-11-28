//
//  PatternsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class MyPatternsListController: UICollectionViewController {
    private var displayManager: MyPatternsListDisplayManager = MyPatternsListDisplayManagerImp()
    private var presenter: MyPatternsListPresenter!
    
    static func create() -> MyPatternsListController {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0        
        let width = UIScreen.main.bounds.size.width
        layout.itemSize = CGSize.init(width: width, height: width)
        let controller = MyPatternsListController.init(collectionViewLayout: layout)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MyPatternsListPresenterImp(state: MyPatternsListPresenterState.init(array: []))
        self.presenter.configure(view: self)
        self.collectionView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.displayManager.configure(collectionView: self.collectionView)
        self.presenter.reloadData()
    }
}

extension MyPatternsListController: MyPatternsListView {
    func showError(_ error: NetworkServiceError) {
        
    }
    
    func reloadData(_ data: [Pattern]) {
        self.displayManager.array = data
        self.collectionView.reloadData()
    }
}

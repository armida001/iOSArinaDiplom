//
//  PatternsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class MyPatternsListController: UICollectionViewController {
    private var displayManager: MyPatternsListDisplayManager!
    private var presenter: PatternsListPresenter!
    
    init(
        presenter: PatternsListPresenter,
        displayManager: MyPatternsListDisplayManager
    ) {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()

        let width = UIScreen.main.bounds.size.width / 2 - 30
        let height = width / 10 * 2 + width
        layout.itemSize = CGSize.init(width: width, height: height)
        layout.sectionInset = UIEdgeInsets.init(top: 7, left: 20, bottom: 10, right: 20)
        
        super.init(collectionViewLayout: layout)
        self.presenter = presenter
        self.displayManager = displayManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configure(view: self)
        self.collectionView.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.displayManager.configure(collectionView: self.collectionView)
        title = "Сохранённое"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.reloadData()
    }
}

extension MyPatternsListController: PatternsListView {
    func showError(_ error: NetworkError) {
        
    }
    
    func reloadData(_ data: [PatternCellItem]) {
        self.displayManager.array = data.filter({
            UserDefaults.standard.value(forKey: $0.id) as? Bool ?? false
        })
        self.collectionView.reloadData()
    }
}

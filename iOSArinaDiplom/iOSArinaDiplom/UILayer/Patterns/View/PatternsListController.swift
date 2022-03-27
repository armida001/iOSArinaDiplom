//
//  PatternsListController.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

final class PatternsListController: UICollectionViewController {
    private var displayManager: PatternsListDisplayManager!
    private var presenter: PatternsListPresenter!
    
    init(
        presenter: PatternsListPresenter,
        displayManager: PatternsListDisplayManager
    ) {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
        layout.minimumLineSpacing = 0
        let width = UIScreen.main.bounds.size.width
        layout.itemSize = CGSize.init(width: width, height: width-width/10*2)
        
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
        self.presenter.reloadData()
        title = "Список выкроек"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let needReload = UserDefaults.value(forKey: UserDefaultsKey.isPatternsNeedReload) as? Bool, needReload {
           
            self.collectionView.reloadData()
        }
    }
}

extension PatternsListController: PatternsListView {
    func showError(_ error: NetworkError) {
        
    }
    
    func reloadData(_ data: [PatternCellItem]) {
        self.displayManager.update(
            data.compactMap({ object in
                let pattern = PatternCellItem(id: object.id,
                                              title: object.title,
                                              detail: object.detail,
                                              imageInfo: object.imageInfo,
                                              isLiked: UserDefaults.standard.value(forKey: object.id) as? Bool ?? false,
                                              patternTypeName: object.patternTypeName)
            
                return pattern
            }))
        self.collectionView.reloadData()
    }
}

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
    
    static func create(showPattern: @escaping ((PatternCellItem) -> Void)) -> PatternsListController {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
        layout.minimumLineSpacing = 0
        let width = UIScreen.main.bounds.size.width
        layout.itemSize = CGSize.init(width: width, height: width-width/10*2)
        
        let controller = PatternsListController.init(collectionViewLayout: layout)
        controller.presenter = PatternsListPresenterImp(state: PatternsListPresenterState.init(array: []))
        controller.displayManager = PatternsListDisplayManagerImp(showPattern: showPattern)
        return controller
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
}

extension PatternsListController: PatternsListView {
    func showError(_ error: NetworkError) {
        
    }
    
    func reloadData(_ data: [PatternCellItem]) {
        self.displayManager.array = data.compactMap({ object in
            let pattern = PatternCellItem(id: object.id, title: object.title, detail: object.detail, imageInfo: object.imageInfo, isLiked: UserDefaults.standard.value(forKey: object.id) as? Bool ?? false, patternTypeName: object.patternTypeName)
            
            return pattern
        })
        self.collectionView.reloadData()
    }
}

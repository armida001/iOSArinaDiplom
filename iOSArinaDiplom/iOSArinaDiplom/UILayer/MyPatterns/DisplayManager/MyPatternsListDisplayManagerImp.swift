//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

class MyPatternsListDisplayManagerImp: NSObject {
    private var collectionView: UICollectionView?
    var array: [PatternCellItem]
    var showPattern: ((PatternCellItem) -> Void)
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.register(MyPatternCell.self, forCellWithReuseIdentifier: "MyPatternCell")
        collectionView.delegate = self
        collectionView.dataSource = self        
    }
    
    init(array:  [PatternCellItem] = [PatternCellItem](), showPattern: @escaping ((PatternCellItem) -> Void)) {
        self.array = array
        self.showPattern = showPattern
    }
}

extension MyPatternsListDisplayManagerImp: MyPatternsListDisplayManager {
    
}

extension MyPatternsListDisplayManagerImp: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPatternCell", for: indexPath) as? MyPatternCell else { return MyPatternCell() }
        cell.configure(with: array[indexPath.row], nDelegate: self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pattern = array[indexPath.row]
        self.showPattern(pattern)
    }
}

extension MyPatternsListDisplayManagerImp: PatternCellDelegate {
    func clickLikePattern(pattern: PatternCellItem) {
        if let index = array.firstIndex(where: { $0.id == pattern.id }) {
            array.remove(at: index)
            collectionView?.reloadData()
            UserDefaults.standard.setValue(pattern.isLiked, forKey: pattern.id)
            UserDefaults.standard.setValue(true, forKey: "PatternsNeedReload")
        }
    }
}

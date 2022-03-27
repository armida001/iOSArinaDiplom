//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

final class PatternsListDisplayManagerImp: NSObject {
    private var collectionView: UICollectionView?
    private var array: [PatternCellItem]
    private let showPattern: ((PatternCellItem) -> Void)
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.register(PatternCell.self, forCellWithReuseIdentifier: "PatternCell")
        collectionView.delegate = self
        collectionView.dataSource = self        
    }
    
    init(array:  [PatternCellItem] = [PatternCellItem](), showPattern: @escaping ((PatternCellItem) -> Void)) {
        self.array = array
        self.showPattern = showPattern
    }
}

extension PatternsListDisplayManagerImp: PatternsListDisplayManager {
    func update(_ array: [PatternCellItem]) {
        self.array = array
    }
    
    func reloadData() {
        array.forEach { pattern in
            if let patternIsSelected = UserDefaults.standard.value(forKey: pattern.id) as? Bool {
                var pattern = pattern
                pattern.like(patternIsSelected)
            }
        }
    }
    
}

extension PatternsListDisplayManagerImp: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PatternCell", for: indexPath) as? PatternCell else { return PatternCell() }
        let pattern = array[indexPath.row]
        
        cell.configure(with: pattern, nDelegate: self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pattern = array[indexPath.row]
        showPattern(pattern)
    }
}
extension PatternsListDisplayManagerImp: PatternCellDelegate {
    func clickLikePattern(pattern: PatternCellItem) {
        if let index = array.firstIndex(where: { $0.id == pattern.id }) {
            array[index] = pattern
            UserDefaults.standard.setValue(pattern.isLiked, forKey: pattern.id)
        }
    }
}

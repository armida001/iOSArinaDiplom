//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

class PatternsListDisplayManagerImp: NSObject {
    var array: [Pattern]
    private var collectionView: UICollectionView?
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.register(PatternCell.self, forCellWithReuseIdentifier: "PatternCell")
        collectionView.delegate = self
        collectionView.dataSource = self        
    }
    
    init(array:  [Pattern] = [Pattern]()) {
        self.array = array
    }
}

extension PatternsListDisplayManagerImp: PatternsListDisplayManager {
    
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
        cell.configure(title: pattern.name, image: pattern.image)
        return cell
    }
}

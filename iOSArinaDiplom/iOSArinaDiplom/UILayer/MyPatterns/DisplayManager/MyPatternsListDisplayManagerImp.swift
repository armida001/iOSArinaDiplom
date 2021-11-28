//
//  PatternsListDisplayManagerImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

class MyPatternsListDisplayManagerImp: NSObject {
    var array: [Pattern]
    private var collectionView: UICollectionView?
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.register(MyPatternCell.self, forCellWithReuseIdentifier: "PatternCell")
        collectionView.delegate = self
        collectionView.dataSource = self        
    }
    
    init(array:  [Pattern] = [Pattern]()) {
        self.array = array
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
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PatternCell", for: indexPath) as? MyPatternCell else { return PatternCell() }
        let pattern = array[indexPath.row]
        let imageUrl = pattern.image?.url
        let width = pattern.image?.width
        let height = pattern.image?.height
                
        var imageInfo: (url: String, width: Int?, height: Int?)? = nil
        if let url = imageUrl {
            imageInfo = (url: url, width: width, height: height)
        }
        cell.configure(with: PatternCellItem(title: pattern.name,
                                             imageInfo: imageInfo))
        return cell
    }        
}

//
//  PatternsListDisplayManager.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

protocol PatternsListDisplayManager {
    func configure(collectionView: UICollectionView)
    func update(_ array: [PatternCellItem])
    func reloadData()
}

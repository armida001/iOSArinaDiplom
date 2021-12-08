//
//  PatternsListDisplayManager.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation
import UIKit

protocol MyPatternsListDisplayManager {
    func configure(collectionView: UICollectionView)
    var array: [PatternCellItem] { get set }
    var showPattern: ((PatternCellItem) -> Void) { get set }
}

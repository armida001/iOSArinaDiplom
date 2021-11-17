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
    var array: [Pattern] { get set }
}

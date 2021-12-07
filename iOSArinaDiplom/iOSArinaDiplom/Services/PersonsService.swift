//
//  PatternsNetworkService.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit
import CoreData

protocol PersonsProtocol {
    func loadData(completionHandler: @escaping ([Person]) -> Void,
                  errorCompletion: @escaping (Error) -> Void)
}

final class PersonsDataService: PersonsProtocol {
    
    func loadData(completionHandler: @escaping ([Person]) -> Void,
                  errorCompletion: @escaping (Error) -> Void) {
        
    }
    
    static func loadImage(image: String, completion: @escaping (UIImage) -> Void) {
        Network.shared.loadImage(imageUrl: image) { imageData in
            if let data = imageData, let image = UIImage.init(data: data) {
                completion(image)
            }
        }
    }
}

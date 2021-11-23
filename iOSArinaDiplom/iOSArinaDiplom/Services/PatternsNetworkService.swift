//
//  PatternsNetworkService.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit

protocol PatternsNetworkServiceProtocol {
    func getPatterns(after cursor: String?,
                     completion: @escaping ([Pattern]) -> Void,
                     errorCompletion: @escaping (NetworkServiceError)->Void)
}

final class PatternsNetworkService: NetworkService, PatternsNetworkServiceProtocol {
    private static let shared = PatternsNetworkService()
    
    func getPatterns(after cursor: String?,
                     completion: @escaping ([Pattern]) -> Void,
                     errorCompletion: @escaping (NetworkServiceError)->Void) {
        super.request(decodeType: GetPatternsResponse.self, parameters: [:], httpMethod: HttpMethodType.GET) { result in
            switch result {
            case .success(let data):
                if let response = data as? GetPatternsResponse {
                    completion(response.records.compactMap{Pattern(id: $0.id,
                                                                   name: $0.fields.name,
                                                                   instruction: $0.fields.instruction,
                                                                   image: $0.fields.image?.first,
                                                                   type: $0.fields.type) })
                }
                break
            case .failure(let error):
                errorCompletion(error)
                break
            }
        }
    }
    
    static func loadImage(image: String, completion: @escaping (UIImage) -> Void) {
        PatternsNetworkService.shared.loadImage(imageUrl: image) { imageData in
            if let data = imageData, let image = UIImage.init(data: data) {
                completion(image)
            }
        }
    }
}

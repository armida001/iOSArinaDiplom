//
//  PatternsNetworkService.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation

protocol PatternsNetworkServiceProtocol {
    func getPatterns(after cursor: String?,
                     completion: @escaping ([Pattern]) -> Void,
                     errorCompletion: @escaping (NetworkServiceError)->Void)
}

final class PatternsNetworkService: NetworkService, PatternsNetworkServiceProtocol {
    func getPatterns(after cursor: String?,
                     completion: @escaping ([Pattern]) -> Void,
                     errorCompletion: @escaping (NetworkServiceError)->Void) {
        super.request(decodeType: GetPatternsResponse.self, parameters: [:], httpMethod: HttpMethodType.GET) { result in
            switch result {
            case .success(let data):
                if let response = data as? GetPatternsResponse {
                    completion(response.records.compactMap{Pattern(name: $0.fields.name, instruction: $0.fields.instruction, image: nil, type: PatternType.dress) })//, type: $0.fields.type
                }
                break
            case .failure(let error):
                errorCompletion(error)
                break
            }
        }
    }
}

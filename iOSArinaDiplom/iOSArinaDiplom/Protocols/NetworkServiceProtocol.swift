//
//  NetworkServiceProtocol.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 16.11.2021.
//

import Foundation

typealias PatternAPIResponse = Result<GetPatternsResponse, NetworkServiceError>
typealias AuthorizeAPIResponse = Result<Void, NetworkServiceError>

protocol NetworkServiceProtocol {
    func authorize(completion: @escaping (AuthorizeAPIResponse) -> Void)
    func request<T: Decodable>(decodeType: T.Type, parameters: [String : String?]?, httpMethod: HttpMethodType?, completion: @escaping (Result<Any, NetworkServiceError>) -> Void)
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void)
}

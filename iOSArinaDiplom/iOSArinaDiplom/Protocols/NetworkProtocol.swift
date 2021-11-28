//
//  NetworkServiceProtocol.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 16.11.2021.
//

import Foundation

typealias PatternAPIResponse = Result<GetPatternsResponse, NetworkError>
typealias AuthorizeAPIResponse = Result<Void, NetworkError>

protocol NetworkProtocol {
    func authorize(completion: @escaping (AuthorizeAPIResponse) -> Void)
    func request<T: Decodable>(decodeType: T.Type, parameters: [String : String?]?, httpMethod: HttpMethodType?, completion: @escaping (Result<Any, NetworkError>) -> Void)
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void)
}

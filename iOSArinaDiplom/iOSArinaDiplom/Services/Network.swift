//
//  NetworkService.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 16.11.2021.
//

import Foundation

enum HttpMethodType: String {
    case GET
    case POST
}

enum BaseKey: String {
    case apikey = "api_key"
}

class Network {
    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
        $0.keyDecodingStrategy = .convertFromSnakeCase
        return $0
    } (JSONDecoder())
    
    private var authorizeResponse: AuthorizeResponse?
    
    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode),
              let data = data else {
            throw NetworkError.network
        }
        return data
    }
}

extension Network: NetworkProtocol {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    func authorize(completion: @escaping (AuthorizeAPIResponse) -> Void) {
        var components = URLComponents(string: Constants.apiBaseUrl + Constants.ApiMethods.authorize)
        components?.queryItems = []
        components?.queryItems?.append(URLQueryItem(name: BaseKey.apikey.rawValue,
                                                    value: Constants.Keys.APIKey))
        guard let url = components?.url else { return completion(.failure(.unknown)) }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let handler: Handler = { rawData, response, error in
            if let errorObject = error {
                completion(.failure((errorObject as? NetworkError) ?? .unknown))
            } else {
                completion(.success(()))
            }
        }
        
        session.dataTask(with: request, completionHandler: handler).resume()
    }
    
    func request<T: Decodable>(decodeType: T.Type, parameters: [String : String?]?, httpMethod: HttpMethodType?, completion: @escaping (Result<Any, NetworkError>) -> Void) {
        
        var components = URLComponents(string: Constants.apiBaseUrl + Constants.ApiMethods.getPatterns)
        components?.queryItems = []
        components?.queryItems?.append(URLQueryItem(name: BaseKey.apikey.rawValue,
                                                    value: Constants.Keys.APIKey))
        if let params = parameters {
            for item in params {
                components?.queryItems?.append(URLQueryItem(name: item.key, value: item.value))
            }
        }
        guard let url = components?.url else { return completion(.failure(.unknown)) }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod?.rawValue ?? HttpMethodType.GET.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        #if DEBUG
        print(request.url ?? "")
        #endif
        let handler: Handler = { rawData, response, error in
            guard error == nil else {
                #if DEBUG
                print(error ?? "")
                #endif
                completion(.failure((error as? NetworkError) ?? .unknown))
                return
            }
            
            if let respData = rawData {
                #if DEBUG
                print(respData)
                #endif
                if let jsonResponse = try? self.decoder.decode(decodeType.self, from: respData) {
                    #if DEBUG
                    print(jsonResponse)
                    #endif
                    completion(.success(jsonResponse))
                    return
                }
            }
            completion(.failure(.unknown))
        }
        
        session.dataTask(with: request, completionHandler: handler).resume()
    }
    
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: imageUrl) else { return completion(nil) }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData)
        
        let handler: Handler = { data, response, error in
            completion(data)
        }
        
        session.dataTask(with: request, completionHandler: handler).resume()
    }
}

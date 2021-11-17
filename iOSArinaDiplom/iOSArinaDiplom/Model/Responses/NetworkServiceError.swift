//
//  NetworkServiceError.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 16.11.2021.
//

import Foundation

enum NetworkServiceError: Error {
    case unauthorize
    case network
    case decodable
    case unknown

    var message: String {
        switch self {
        case .unauthorize:
            return "Вы не авторизованы"
        case .network:
            return "Упал запрос"
        case .decodable:
            return "Не смогли распарсить"
        case .unknown:
            return "?????"
        }
    }

}

//
//  GetPatternsResponse.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 16.11.2021.
//

import Foundation

struct GetPatternsResponse: Decodable {
    let records: [GetPatternsDataResponse]!
}

struct GetPatternsDataResponse: Decodable {
    let id: String!
    let fields: GetPatternsFieldsResponse!
}

struct GetPatternsFieldsResponse: Decodable {
    let name: String!
    let instruction: String!
//    let image: String?
    let type: PatternType?
}

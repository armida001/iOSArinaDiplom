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
    let image: [GetPatternsImageResponse]?
    let type: PatternType?
}

struct GetPatternsImageResponse: Decodable {
    let url: String
    let width: Int
    let height: Int
    let thumbnails: ThumbnailsResponse?
}

struct ThumbnailsResponse: Decodable {
    let small: ImageThumbnailsResponse?
    let large: ImageThumbnailsResponse?
    let full: ImageThumbnailsResponse?
}

struct ImageThumbnailsResponse: Decodable {
    let url: String
    let width: Int
    let height: Int
}

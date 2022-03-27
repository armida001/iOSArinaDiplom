//
//  Pattern.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 11.11.2021.
//

import Foundation
import UIKit

enum PatternType: String, Decodable {
    ///блузка
    case blouse
    ///бикини
    case bikini
    ///пиджак
    case coat
    ///женский костюм
    case costume
    ///кардиган
    case cardigan
    ///платье
    case dress
    ///перчатки
    case gloves
    ///шляпа
    case hat
    ///толстовка с капюшоном
    case hoodie
    ///куртка
    case jacket
    ///джинсы
    case jeans
    ///джемпер
    case jumper
    ///пальто
    case overcoat
    ///водолазка
    case polo
    ///шарф
    case scarf
    ///рубашка, блузка, сорочка
    case shirt
    ///шорты
    case shorts
    ///юбка
    case skirt
    ///свитер
    case sweater
    ///купальник
    case swimsuit
    ///галстук
    case tie
    ///спортивный костюм
    case track
    ///брюки
    case trousers
    ///футболка
    case tshirt
    ///жилет
    case waistcoat
    
    func title() -> String {
        switch self {
        case .blouse:
            return "Блуза"
        case .bikini:
            return "Бикини"
        case .cardigan:
            return "Кардиган"
        case .coat:
            return "Пиджак"
        case .costume:
            return "Костюм"
        case .dress:
            return "Платье"
        case .gloves:
            return "Перчатки"
        case .hat:
            return "Шляпа"
        case .hoodie:
            return "Толстовка с копюшоном"
        case .jacket:
            return "Жакет"
        case .jeans:
            return "Джинсы"
        case .jumper:
            return "Джемпер"
        case .overcoat:
            return "Пальто"
        case .polo:
            return "Водолазка"
        case .scarf:
            return "Шарф"
        case .skirt:
            return "Юбка"
        case .shirt:
            return "Рубашка"
        case .shorts:
            return "Шорты"
        case .sweater:
            return "Свитер"
        case .swimsuit:
            return "Купальник"
        case .tie:
            return "Гастук"
        case .track:
            return "Спортивный костюм"
        case .tshirt:
            return "Футболка"
        case .trousers:
            return "Брюки"
        case .waistcoat:
            return "Жилет"
        }
    }
}

struct Pattern {
    let id: String!
    let name: String!
    let instruction: String!
    let image: GetPatternsImageResponse?
    let type: PatternType!
    
    func convertToPatternCellItem() -> PatternCellItem {
        let imageUrl = self.image?.url
        let width = self.image?.width
        let height = self.image?.height
        
        var imageInfo: (url: String, width: Int?, height: Int?)? = nil
        if let url = imageUrl {
            imageInfo = (url: url, width: width, height: height)
        }
        
        return PatternCellItem(id: self.id,
                               title: self.name,
                               detail: self.instruction,
                               imageInfo: imageInfo,
                               isLiked: false,
                               patternTypeName: type.title())
    }
}

struct PatternCellItem {
    let id: String
    let title: String
    let detail: String
    let imageInfo: (url: String, width: Int?, height: Int?)?
    var isLiked: Bool
    let patternTypeName: String
    
    mutating func like(_ value: Bool) {
        self.isLiked = value
    }
}

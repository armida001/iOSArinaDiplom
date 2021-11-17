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
}

struct Pattern {
    let name: String!
    let instruction: String!
    let image: UIImage?
    let type: PatternType!
}

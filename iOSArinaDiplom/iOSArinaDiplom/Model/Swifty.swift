//
//  Swifty.swift
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

import Foundation
import UIKit

@objc protocol SkirtProtocol {
    var name: String { get }
    var isMini: Bool { get set }
}

@objc protocol TShirtProtocol {
    var name: String { get }
}

class BaseSkirtSew: SkirtProtocol {
    var name: String {
        "Базовая Юбка"
    }
    var isMini: Bool
    
    init(isMini: Bool) {
        self.isMini = isMini
    }
}

class BaseTShirtSew: TShirtProtocol {
    var name: String {
        "Базовая Футболка"
    }
}

class ModernSkirtSew: BaseSkirtSew {
    override var name: String {
        "Современная юбка с разрезом"
    }
}

class ModernTShirtSew: TShirtProtocol {
    var name: String {
        "Рубашка"
    }
}

/// Abstract Factory
@objc protocol AbstractFabric: AnyObject {
    @objc func createTShirt() -> TShirtProtocol
    @objc func createSkirt() -> SkirtProtocol
}


@objc final class SewFabric: NSObject, AbstractFabric {
    @objc func createTShirt() -> TShirtProtocol {
        BaseTShirtSew()
    }
    
    @objc func createSkirt() -> SkirtProtocol {
        BaseSkirtSew(isMini: false)
    }
    
    @objc static let shared = SewFabric()
}

@objc final class ModernSewFabric: NSObject, AbstractFabric {
    @objc func createTShirt() -> TShirtProtocol {
        ModernTShirtSew()
    }
    
    @objc func createSkirt() -> SkirtProtocol {
        ModernSkirtSew(isMini: true)
    }
    
    @objc static let shared = ModernSewFabric()
}

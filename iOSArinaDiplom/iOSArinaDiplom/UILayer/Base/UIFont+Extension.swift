//
//  UIFont+Extension.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 28.12.2021.
//

import UIKit

extension UIFont {
    
    static var title: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular) ?? UIFont()
    }
    
    static var detail: UIFont {
        return UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium) ?? UIFont()
    }    
}

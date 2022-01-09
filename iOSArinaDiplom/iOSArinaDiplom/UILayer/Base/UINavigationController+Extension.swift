//
//  UINavigationController+Extension.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 04.01.2022.
//

import UIKit

extension UINavigationController {
    func baseConfigure() {
        navigationBar.isTranslucent = false
        view.backgroundColor = .clear
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)]
    }
}

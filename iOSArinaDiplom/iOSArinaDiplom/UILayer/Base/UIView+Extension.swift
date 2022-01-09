//
//  UIView+Extension.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 04.01.2022.
//

import UIKit

extension UIView {
    func configureWhiteShadow() {
        let layer0 = CAGradientLayer()
        
        layer0.colors = [
            
            UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor,
            
            UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            
        ]
        
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = bounds.insetBy(dx: -0.5*bounds.size.width, dy: -0.5*bounds.size.height)
        layer0.position = center
        layer.addSublayer(layer0)
    }
    
    func greyShadow() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45).cgColor
        layer.shadowOpacity = 1
        layer.cornerRadius = 5
        layer.shadowRadius = 6.99
        layer.shadowOffset = CGSize(width: 0, height: 6.99)
    }
}

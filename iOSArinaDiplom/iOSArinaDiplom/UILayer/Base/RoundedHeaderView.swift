//
//  RoundedHeaderView.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 09.01.2022.
//

import UIKit

final class RoundedHeaderView: UIView {
    
    private var baseView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func baseConfig() {
        baseView = UIView()
        baseView.layer.cornerRadius = 14
        baseView.backgroundColor = UIColor.white
        backgroundColor = UIColor.clear
        
        addSubview(baseView)
        baseView.translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            baseView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            baseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            baseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 14),
            baseView.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}

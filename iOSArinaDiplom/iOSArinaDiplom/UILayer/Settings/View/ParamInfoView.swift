//
//  ParamInfoView.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 12.01.2022.
//

import UIKit

final class ParamInfoView: UIView {
    
    private var titleLabel: UILabel!
    private var subTitleLabel: UILabel!
    
    func configure(title: String, subTitle: String) {
        subTitleLabel.text = subTitle
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)            
        setupConstraints()
        titleLabelConfig()
        subTitleLabelConfig()
    }
    
    func setupConstraints() {
        titleLabel = UILabel()
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subTitleLabel = UILabel()
        addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    public func configure(with title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    private func titleLabelConfig() {
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor.black.withAlphaComponent(0.9)
    }
    
    private func subTitleLabelConfig() {
        subTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        subTitleLabel.textAlignment = NSTextAlignment.center
        subTitleLabel.textColor = UIColor.black.withAlphaComponent(0.6)
    }
}

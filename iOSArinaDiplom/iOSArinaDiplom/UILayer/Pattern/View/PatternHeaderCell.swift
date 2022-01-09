//
//  PatternHeaderCell.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 09.01.2022.
//

import UIKit

final class PatternHeaderCell: UITableViewCell {
    
    private var nameLabel: UILabel!
    private var typeLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        selectionStyle = UITableViewCell.SelectionStyle.none
        setupConstraints()
        labelConfig()
        typeLabelConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel = UILabel()
        contentView.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
             
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            typeLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    public func configure(title: String, subTitle: String) {
        nameLabel.text = title
        typeLabel.text = subTitle
    }
    
    private func labelConfig() {
        nameLabel.textColor = UIColor.black.withAlphaComponent(0.9)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.font = UIFont
            .systemFont(ofSize: 22, weight: UIFont.Weight.semibold)
    }
    
    private func typeLabelConfig() {
        typeLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        typeLabel.textAlignment = NSTextAlignment.center
        typeLabel.textColor = UIColor.black.withAlphaComponent(0.6)
    }
}

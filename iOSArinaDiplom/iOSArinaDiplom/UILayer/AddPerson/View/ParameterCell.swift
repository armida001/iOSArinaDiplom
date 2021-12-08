//
//  PersonCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 04.12.2021.
//

import UIKit

final class ParameterCell: UITableViewCell {
    private var nameLabel: UILabel!
    private var textField: UITextField!
    private var value: PersonCellItem!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupConstraints()
        self.labelConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        textField = UITextField()
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel = UILabel()
        self.contentView.addSubview(nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    public func configure(with info: PersonCellItem) {
        value = info
        nameLabel.text = value.title        
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.black.withAlphaComponent(0.9)
        nameLabel.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    }
    
}


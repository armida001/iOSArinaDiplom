//
//  PersonCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 04.12.2021.
//

import UIKit

struct ParameterCellItem {
    let key: String
    let title: String
    let value: String
}

final class ParameterCell: UITableViewCell {
    private var nameLabel: UILabel!
    private var textField: UITextField!
    
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
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 12),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -5),
            
            textField.heightAnchor.constraint(equalToConstant: 20),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 12),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    public func configure(with value: ParameterCellItem) {
        nameLabel.text = value.title
        textField.text = value.value
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.semibold)
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.textColor = UIColor.black.withAlphaComponent(0.9)
    }
    
}


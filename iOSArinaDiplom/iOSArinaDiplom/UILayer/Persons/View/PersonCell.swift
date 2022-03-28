//
//  PersonCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 04.12.2021.
//

import UIKit

final class PersonCell: UITableViewCell {
    private var nameLabel: UILabel!
    private var detailLabel: UILabel!
    private var value: Person!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupConstraints()
        self.labelConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        detailLabel = UILabel()
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            detailLabel.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    public func configure(with info: Person) {
        value = info
        nameLabel.text = value.title
        detailTextLabel?.text  = value.detail
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.title
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.textColor = UIColor.black
    }
    
    private func detailLabelConfig() {
        detailLabel.font = UIFont.detail
        detailLabel.textAlignment = NSTextAlignment.left
        detailLabel.textColor = UIColor.black
    }
    
}


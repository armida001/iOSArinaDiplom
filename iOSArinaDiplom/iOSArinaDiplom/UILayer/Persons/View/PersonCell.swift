//
//  PersonCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 04.12.2021.
//

import UIKit

struct PersonCellItem {
    let id: String
    let title: String
    let detail: String
    let parameters: [PersonParameterType : NSNumber]?
}

final class PersonCell: UITableViewCell {
    private var nameLabel: UILabel!
    private var detailLabel: UILabel!
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
        detailLabel = UILabel()
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            detailLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    public func configure(with info: PersonCellItem) {
        value = info
        nameLabel.text = value.title
        detailTextLabel?.text  = value.detail
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.semibold)
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.textColor = UIColor.black
    }
    
    private func detailLabelConfig() {
        detailLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        detailLabel.textAlignment = NSTextAlignment.left
        detailLabel.textColor = UIColor.black.withAlphaComponent(0.8)
    }
    
}


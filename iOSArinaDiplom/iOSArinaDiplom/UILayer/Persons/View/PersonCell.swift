//
//  PersonCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 04.12.2021.
//

import UIKit

struct PersonCellItem {
    let title: String
    let imageInfo: (url: String, width: Int?, height: Int?)?
}

final class PersonCell: UITableViewCell {
    private var nameLabel: UILabel!
    private var logoImageView: UIImageView!
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
        logoImageView = UIImageView()
        contentView.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel = UILabel()
        self.contentView.addSubview(nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.nameLabel.heightAnchor.constraint(equalToConstant: 50),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    public func configure(with info: PersonCellItem) {
        value = info
        nameLabel.text = value.title
        if let url = self.value.imageInfo?.url {
            PersonsDataService.loadImage(image: url) { [weak self] image in
                DispatchQueue.main.async { [weak self] in
                    self?.logoImageView.image = image
                }
            }
        }
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.black.withAlphaComponent(0.9)
        nameLabel.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    }
    
}


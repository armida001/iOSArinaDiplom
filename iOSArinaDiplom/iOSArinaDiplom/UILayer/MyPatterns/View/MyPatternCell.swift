//
//  PatternCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit

final class MyPatternCell: UICollectionViewCell {
    
    private var nameLabel: UILabel!
    private var imageView: UIImageView!
    private var value: PatternCellItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
        self.baseConfig()
        self.labelConfig()
        self.imageConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.nameLabel = UILabel()
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView = UIImageView()
        self.contentView.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 3),
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 3),
            self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -3),
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)
        ])
    }
    
    public func configure(with info: PatternCellItem) {
        self.value = info
        self.nameLabel.text = self.value.title
        if let url = self.value.imageInfo?.url {
            PatternsService.loadImage(image: url) { [weak self] image in
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = image
                }
            }
        }
    }
    
    private func labelConfig() {
        self.nameLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        self.nameLabel.textAlignment = NSTextAlignment.center
        self.nameLabel.textColor = UIColor.black.withAlphaComponent(0.9)
    }
    
    private func imageConfig() {
        self.imageView.layer.cornerRadius = 8
        self.imageView.clipsToBounds = true
    }
    
    private func baseConfig() {
        self.contentView.layer.cornerRadius = 12
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
    }
}

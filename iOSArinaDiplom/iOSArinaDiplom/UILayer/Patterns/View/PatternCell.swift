//
//  PatternCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit

struct PatternCellItem {
    let title: String
    let imageInfo: (url: String, width: Int?, height: Int?)?
}

final class PatternCell: UICollectionViewCell {
    private var nameLabel: UILabel!
    private var imageView: UIImageView!
    private var value: PatternCellItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
        self.labelConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.imageView = UIImageView()
        self.contentView.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel = UILabel()
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.nameLabel.heightAnchor.constraint(equalToConstant: 50),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
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
        self.nameLabel.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    }
    
}

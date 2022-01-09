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
    private var detailLabel: UILabel!
    private var typeLabel: UILabel!
    private var imageView: UIImageView!
    private var value: PatternCellItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
        self.labelConfig()
        self.detailLabelConfig()
        self.typeLabelConfig()
        self.imageConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        detailLabel = UILabel()
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel = UILabel()
        contentView.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: -50),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            detailLabel.heightAnchor.constraint(equalToConstant: 20),
            
            typeLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            typeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            typeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    public func configure(with info: PatternCellItem) {
        value = info
        nameLabel.text = value.title
        detailLabel.text = value.detail
        typeLabel.text = value.patternTypeName
        
        if let url = value.imageInfo?.url {
            PatternsService.loadImage(image: url) { [weak self] image in
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = image
                }
            }
        }
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.textColor = UIColor.black.withAlphaComponent(0.9)
    }
    
    private func detailLabelConfig() {
        detailLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        detailLabel.textAlignment = NSTextAlignment.left
        detailLabel.textColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    private func typeLabelConfig() {
        typeLabel.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        typeLabel.textAlignment = NSTextAlignment.left
        typeLabel.textColor = UIColor.purple
    }
    
    private func imageConfig() {
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
    }
}

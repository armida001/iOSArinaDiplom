//
//  PatternCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit

struct PatternCellItem {
    let id: String
    let title: String
    let detail: String
    let imageInfo: (url: String, width: Int?, height: Int?)?
    var isLiked: Bool
    let patternTypeName: String    
}

protocol PatternCellDelegate: NSObjectProtocol {
    func clickLikePattern(pattern: PatternCellItem)
}

final class PatternCell: UICollectionViewCell {
    private var nameLabel: UILabel!
    private var imageView: UIImageView!
    private var value: PatternCellItem!
    private var likeButton: UIButton!
    private var delegate: PatternCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        labelConfig()
        buttonConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
                
        likeButton = UIButton()
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            likeButton.heightAnchor.constraint(equalTo: likeButton.widthAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func configure(with info: PatternCellItem, nDelegate: PatternCellDelegate?) {
        value = info
        nameLabel.text = value.title
        if let url = value.imageInfo?.url {
            PatternsService.loadImage(image: url) { [weak self] image in
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = image
                }
            }
        }
        delegate = nDelegate
        likeButton.isSelected = info.isLiked
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.black.withAlphaComponent(0.8)
        nameLabel.backgroundColor = UIColor.white.withAlphaComponent(0.8)
    }
    
    private func buttonConfig() {
        likeButton.setImage(UIImage(named: "heart"), for: UIControl.State.normal)
        likeButton.setImage(UIImage(named: "red_heart"), for: UIControl.State.selected)
        likeButton.addTarget(self, action: #selector(likeClick), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func likeClick() {
        likeButton.isSelected = !likeButton.isSelected
        value.isLiked = likeButton.isSelected
        delegate?.clickLikePattern(pattern: value)
    }
}

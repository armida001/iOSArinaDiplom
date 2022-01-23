//
//  PatternCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit

protocol PatternCellDelegate: NSObjectProtocol {
    func clickLikePattern(pattern: PatternCellItem)
}

final class PatternCell: UICollectionViewCell {
    private var imageView: UIImageView!
    private var shadowView: UIView!
    private var value: PatternCellItem!
    private var likeButton: UIButton!
    private var delegate: PatternCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        imageViewConfig()
        buttonConfig()
        shadowView.greyShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        shadowView = UIView()
        shadowView.backgroundColor = UIColor.white
        contentView.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.clipsToBounds = false
        
        imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
                
        likeButton = UIButton()
        contentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            likeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 15),
            likeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            likeButton.heightAnchor.constraint(equalTo: likeButton.widthAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    public func configure(with info: PatternCellItem, nDelegate: PatternCellDelegate?) {
        value = info
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
   
    private func buttonConfig() {
        likeButton.setImage(UIImage(named: "heart")?.withTintColor(UIColor.purple), for: UIControl.State.normal)
        likeButton.setImage(UIImage(named: "red_heart")?.withTintColor(UIColor.purple), for: UIControl.State.selected)
        likeButton.addTarget(self, action: #selector(likeClick), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func likeClick() {
        likeButton.isSelected = !likeButton.isSelected
        value.isLiked = likeButton.isSelected
        delegate?.clickLikePattern(pattern: value)
    }
    
    private func imageViewConfig() {
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
    }
}

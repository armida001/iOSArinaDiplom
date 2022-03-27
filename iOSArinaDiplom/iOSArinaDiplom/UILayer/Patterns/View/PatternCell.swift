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
    
    private enum CellSettings {
        static let imageInset: CGFloat = 0
        static let shadowMinInset: CGFloat = 0
        static let shadowMaxInset: CGFloat = 3
    }
    
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
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellSettings.shadowMinInset),
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellSettings.shadowMinInset),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellSettings.shadowMaxInset),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -CellSettings.shadowMinInset),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellSettings.imageInset),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellSettings.imageInset),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellSettings.imageInset),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -CellSettings.imageInset),
            
            likeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 15),
            likeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
            likeButton.heightAnchor.constraint(equalTo: likeButton.widthAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    public func configure(with info: PatternCellItem, nDelegate: PatternCellDelegate?) {
        value = info
        if let url = value.imageInfo?.url {
            PatternsServiceImpl.loadImage(image: url) { [weak self] image in
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
        imageView.clipsToBounds = true
    }
}

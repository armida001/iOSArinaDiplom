//
//  PatternCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 17.11.2021.
//

import Foundation
import UIKit

final class PatternIconView: UITableViewHeaderFooterView {
    
    private var nameLabel: UILabel!
    private var imageView: UIImageView!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupConstraints()        
        labelConfig()
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
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor, constant: -30),
            self.imageView.bottomAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),                        
                        
            self.nameLabel.heightAnchor.constraint(equalToConstant: 50),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    public func configure(with urlString: String?, title: String) {
        self.nameLabel.text = title
        if let url = urlString {
            PatternsService.loadImage(image: url) { [weak self] image in
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = image
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

//
//  ButtonCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 10.12.2021.
//

import UIKit

final class ButtonFooterView: UITableViewHeaderFooterView {
    private var topView: UIButton!
    private var button: UIButton!
    private var clickHandle: (() -> Void)!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupConstraints()
        self.buttonConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        contentView.backgroundColor = UIColor.white
        
        button = UIButton()
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.leading),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.trailing),
            button.heightAnchor.constraint(equalToConstant: Constant.buttonHeight),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    public func configure(with title: String, completion: @escaping () -> Void) {
        button.titleLabel?.text = title
        clickHandle = completion
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitle(title, for: UIControl.State.selected)
    }
    
    private func buttonConfig() {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        button.titleLabel?.textAlignment = NSTextAlignment.left
        button.titleLabel?.textColor = UIColor.white
        button.layer.cornerRadius = CGFloat.buttonBorderRadius
        button.clipsToBounds = true
        button.backgroundColor = UIColor.purple
        button.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
    }
    
    @objc func buttonClick() {
        clickHandle()
    }
}

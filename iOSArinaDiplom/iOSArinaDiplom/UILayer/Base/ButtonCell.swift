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
        button = UIButton()
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    public func configure(with title: String, completion: @escaping () -> Void) {
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitle(title, for: UIControl.State.selected)
        clickHandle = completion
        contentView.backgroundColor = UIColor.white
    }
    
    private func buttonConfig() {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.semibold)
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
        button.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func click() {
        clickHandle()
    }
}

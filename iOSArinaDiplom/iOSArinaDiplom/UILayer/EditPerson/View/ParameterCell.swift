//
//  PersonCell.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 04.12.2021.
//

import UIKit

final class ParameterCell: UITableViewCell {
    static let textFieldPlaceHolder = "Введите значение"
    
    private var nameLabel: UILabel!
    private var textField: UITextField!
    private var endEditHandler: ((String) -> Void)?
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupConstraints()
        self.labelConfig()
        self.textFieldConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        textField = UITextField()
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.leading),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.trailing),
            nameLabel.heightAnchor.constraint(equalToConstant: 13),
            nameLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -8),
            
            textField.heightAnchor.constraint(equalToConstant: Constant.textFieldHeight),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.leading),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.trailing),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3)
        ])
    }
    
    public func configure(with value: Parameter,
                          endEditHandler: @escaping ((String) -> Void)) {
        self.nameLabel.text = value.type.title()
        self.textField.text = value.value
        self.endEditHandler = endEditHandler
        contentView.backgroundColor = UIColor.white
    }
    
    private func labelConfig() {
        nameLabel.font = UIFont.title
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.textColor = UIColor.black
    }
    
    private func textFieldConfig() {
        textField.font = UIFont.detail
        textField.textAlignment = NSTextAlignment.left
        
        textField.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 12.0, height: 10.0))
        textField.leftViewMode = .always
        
        textField.clipsToBounds = true
        textField.layer.cornerRadius = CGFloat.textBorderRadius
        textField.layer.borderWidth = CGFloat.textBorderWidth
        textField.layer.borderColor = UIColor.violet.cgColor
        
        textField.delegate = self
        textField.textColor = UIColor.baseText
    }
}

extension ParameterCell: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == ParameterCell.textFieldPlaceHolder {
            textField.text = ""
            textField.textColor = UIColor.baseText
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            textField.text = ParameterCell.textFieldPlaceHolder
            textField.textColor = UIColor.placeholder
        } else {
            endEditHandler?(textField.text ?? "")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//
//  SettingsParamsCell.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 12.01.2022.
//

import UIKit

final class SettingsParamsCell: UITableViewCell {
    private var baseStack: UIStackView!
    private var paramViews: [ParamInfoView]!
    var params: [Parameter]!
    
    private func setupConstraints() {
        paramViews = params.compactMap({ parameter in
            let pview = ParamInfoView()
            pview.configure(title: parameter.type.title(), subTitle: parameter.value)
            return pview
        })
        
        baseStack = UIStackView(arrangedSubviews: paramViews)
        baseStack.translatesAutoresizingMaskIntoConstraints = false
        baseStack.clipsToBounds = false
        addSubview(baseStack)
        
        NSLayoutConstraint.activate([
            baseStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            baseStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            baseStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            baseStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func configure(params: [Parameter]) {
        self.params = params
        setupConstraints()
        stackViewConfig()
    }
    
    private func stackViewConfig() {
        baseStack.alignment = UIStackView.Alignment.center
    }
}

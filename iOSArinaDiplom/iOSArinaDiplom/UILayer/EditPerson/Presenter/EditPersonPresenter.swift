//
//  PatternsListPresenter.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import Foundation

protocol EditPersonPresenter {
    var state: EditPersonPresenterState { get set }
    func configure(view: EditPersonView)
    func addPerson(person: Person)
}

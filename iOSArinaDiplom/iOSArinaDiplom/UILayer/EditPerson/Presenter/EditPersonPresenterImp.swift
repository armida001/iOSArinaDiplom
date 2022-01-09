//
//  PatternsListPresenterImp.swift
//  iOSArinaDiplom
//
//  Created by Арина Зимонина on 14.11.2021.
//

import UIKit

class EditPersonPresenterImp: EditPersonPresenter {
    internal var state: EditPersonPresenterState
    private var view: EditPersonView?
    private var service: PersonsDataService?
    
    
    init(state: EditPersonPresenterState) {
        self.state = state
        self.service = PersonsDataService()
    }
    
    func configure(view: EditPersonView) {
        self.view = view
    }
    
    func reloadData() {
//        service?.loadData(completionHandler: { [weak self] array in
//            DispatchQueue.main.async {
//                self?.view?.reloadData(array)
//            }
//        }, errorCompletion: { [weak self] error in
//            DispatchQueue.main.async {
//                self?.view?.showError(error as? NetworkError ?? NetworkError.unknown)
//            }
//        })
    }
    
    func addPerson(person: PersonCellItem) {
            service?.addPerson(person, completionHandler: { [weak self] in
                
//                if let data = person.baseParameters {
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [PersonParameterType : NSNumber]
//                        self?.view?.reloadData(PersonCellItem(id: person.id?.uuidString ?? "",  title: person.name ?? "", detail: person.comment ?? "", parameters: person.parametersDictionary))
//                    } catch {
//                        print("Something went wrong")
//                    }
//                }
            }, errorCompletion: { error in
                
            })
    }
}

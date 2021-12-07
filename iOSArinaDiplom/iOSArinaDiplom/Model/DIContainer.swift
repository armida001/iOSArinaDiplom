//
//  DIContainer.swift
//  CoreDataFRC
//
//  Created by Andrey Khyshov on 10.11.2021.
//

import Foundation

//Любой DI Container
// это просто ServiceLocator

final class Container {
	static let shared = Container()
	private init() {}

    lazy var coreDataStack = CoreData(modelName: "CoreDataFRC")
}

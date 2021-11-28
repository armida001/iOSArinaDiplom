//
//  ViewController.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 05.10.2021.
//

import UIKit

class TabBarController: UITabBarController {

    private var patternsCoordinator: PatternsCoordinator!
    private var myPatternsCoordinator: MyPatternsCoordinator!
    private var personsCoordinator: PersonsCoordinator!
    private var settingsCoordinator: SettingsCoordinator!
    
    func configure() {
        let patternsNavigationController = UINavigationController.init()
        patternsNavigationController.tabBarItem = UITabBarItem.init(title: "Выкройки",
                                                                    image: nil,
                                                                    selectedImage: nil)
        self.patternsCoordinator = PatternsCoordinator(navigationController: patternsNavigationController)

        let myPatternsNavigationController = UINavigationController.init()
        myPatternsNavigationController.tabBarItem = UITabBarItem.init(title: "Избранное",
                                                                    image: nil,
                                                                    selectedImage: nil)
        self.myPatternsCoordinator = MyPatternsCoordinator(navigationController: myPatternsNavigationController)
        
        let personNavigationController = UINavigationController.init()
        personNavigationController.tabBarItem = UITabBarItem.init(title: "Мерки",
                                                                    image: nil,
                                                                    selectedImage: nil)
        self.personsCoordinator = PersonsCoordinator(navigationController: personNavigationController)
        
        let settingsNavigationController = UINavigationController.init()
        settingsNavigationController.tabBarItem = UITabBarItem.init(title: "Настройки",
                                                                    image: nil,
                                                                    selectedImage: nil)
        self.settingsCoordinator = SettingsCoordinator(navigationController: settingsNavigationController)
        
        viewControllers = [myPatternsNavigationController,
                           patternsNavigationController,
                           personNavigationController,
                           settingsNavigationController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        myPatternsCoordinator.start()
    }
}


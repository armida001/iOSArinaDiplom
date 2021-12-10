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
        let little = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let patternsNavigationController = UINavigationController.init()
        patternsNavigationController.tabBarItem = UITabBarItem.init(title: "Выкройки",
                                                                    image: UIImage(named: "list"),
                                                                    selectedImage: nil)
        patternsNavigationController.tabBarItem.imageInsets = little
        selectedIndex = 0
        self.patternsCoordinator = PatternsCoordinator(navigationController: patternsNavigationController)

        let myPatternsNavigationController = UINavigationController.init()
        myPatternsNavigationController.tabBarItem = UITabBarItem.init(title: "Избранное",
                                                                    image:  UIImage(named: "heart"),
                                                                    selectedImage: nil)
        myPatternsNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.myPatternsCoordinator = MyPatternsCoordinator(navigationController: myPatternsNavigationController)
        
        let personNavigationController = UINavigationController.init()
        personNavigationController.tabBarItem = UITabBarItem.init(title: "Мерки",
                                                                    image:  UIImage(named: "people"),
                                                                    selectedImage: nil)
        personNavigationController.tabBarItem.imageInsets = little
        self.personsCoordinator = PersonsCoordinator(navigationController: personNavigationController)
        
        let settingsNavigationController = UINavigationController.init()
        settingsNavigationController.tabBarItem = UITabBarItem.init(title: "Настройки",
                                                                    image:  UIImage(named: "settings"),
                                                                    selectedImage: nil)
        settingsNavigationController.tabBarItem.imageInsets = little
        self.settingsCoordinator = SettingsCoordinator(navigationController: settingsNavigationController)
        
        viewControllers = [patternsNavigationController,
                           myPatternsNavigationController,
                           personNavigationController,
                           settingsNavigationController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        patternsCoordinator.start()
        myPatternsCoordinator.start()
        personsCoordinator.start()
        settingsCoordinator.start()
    }
}


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
        patternsNavigationController.baseConfigure()
        patternsCoordinator = PatternsCoordinator(navigationController: patternsNavigationController)

        let myPatternsNavigationController = UINavigationController.init()
        myPatternsNavigationController.tabBarItem = UITabBarItem.init(title: "Избранное",
                                                                    image: UIImage(named: "heart"),
                                                                    selectedImage: nil)
        myPatternsNavigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        myPatternsNavigationController.baseConfigure()
        myPatternsCoordinator = MyPatternsCoordinator(navigationController: myPatternsNavigationController)
        
        let personNavigationController = UINavigationController.init()
        personNavigationController.tabBarItem = UITabBarItem.init(title: "Мерки",
                                                                    image:  UIImage(named: "people"),
                                                                    selectedImage: nil)
        personNavigationController.tabBarItem.imageInsets = little
        personNavigationController.baseConfigure()
        personsCoordinator = PersonsCoordinator(navigationController: personNavigationController)
        
        let settingsNavigationController = UINavigationController.init()
        settingsNavigationController.tabBarItem = UITabBarItem.init(title: "Настройки",
                                                                    image:  UIImage(named: "settings"),
                                                                    selectedImage: nil)
        settingsNavigationController.tabBarItem.imageInsets = little
        settingsNavigationController.baseConfigure()
        settingsCoordinator = SettingsCoordinator(navigationController: settingsNavigationController)
        
        viewControllers = [patternsNavigationController,
                           myPatternsNavigationController,
                           personNavigationController,
                           settingsNavigationController]
        tabBar.tintColor = UIColor.purple
        tabBar.barTintColor = UIColor.white
        
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.75)
        tabBar.clipsToBounds = false
        tabBar.layer.borderWidth = 0
        tabBar.layer.borderColor = UIColor.clear.cgColor
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 5
        tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBar.layer.shadowOpacity = 1.0        
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


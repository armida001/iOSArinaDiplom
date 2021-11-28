//
//  AppDelegate.swift
//  iOSArinaDiplom
//
//  Created by Arina Zimonina on 05.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var rootCoordinator: RootCoordinator?
    private let service = Network.init()
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController,
              let navigationController = storyboard.instantiateViewController(withIdentifier: "MainNavigation") as? UINavigationController
        else { return true }
        
        navigationController.setViewControllers([tabBarController], animated: true)
        self.window?.rootViewController = navigationController
        
        self.rootCoordinator = RootCoordinator(navigationController: navigationController)
        service.authorize { authResponse in
            switch authResponse {
            case .success():
                self.rootCoordinator?.start()
                break
            case .failure(let error):
                self.rootCoordinator?.startWithError(error: error)
                break
            }
        }
        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


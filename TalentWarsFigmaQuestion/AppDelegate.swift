//
//  AppDelegate.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 19.02.2024.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: Coordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        coordinator?.start()
        window?.makeKeyAndVisible()
        return true
    }
}

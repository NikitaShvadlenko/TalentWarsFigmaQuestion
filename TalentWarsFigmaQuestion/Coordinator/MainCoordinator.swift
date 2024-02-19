//
//  Coordinator.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 19.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//
import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let searchViewController = ViewController()
        navigationController.pushViewController(searchViewController, animated: false)
    }
}


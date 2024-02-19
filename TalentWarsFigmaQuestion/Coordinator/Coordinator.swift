//
//  Coordinator.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 19.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

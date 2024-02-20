//
//  ViewModelConfigurable.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 20.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//

import Foundation

public protocol ViewModelConfigurable<T> {
    associatedtype T

    func configure(with viewModel: T)
}


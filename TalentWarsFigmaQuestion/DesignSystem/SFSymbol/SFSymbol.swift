//
//  SFSymbol.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 20.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//

import Foundation

public enum SFSymbol: String, SFSymbolRepresentable {
    case xmark
}

// MARK: - SFSymbolRepresentable

public protocol SFSymbolRepresentable {
    var systemName: String { get }
}

public extension SFSymbolRepresentable where Self: RawRepresentable, RawValue == String {
    var systemName: String { rawValue }
}

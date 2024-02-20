//
//  UIImage+SFSymbol.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 20.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//

import UIKit

extension UIImage {
    public convenience init?(
        sfSymbol: SFSymbolRepresentable,
        withConfiguration configuration: SymbolConfiguration? = nil
    ) {
        self.init(systemName: sfSymbol.systemName, withConfiguration: configuration)
    }
}

//
//  FittingTextField.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 20.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//

import UIKit

final class FittingTextField: UITextField {
    // MARK: - Appearance

    private let appearance = Appearance(); struct Appearance {
        let textRectInset = CGPoint(x: 27, y: 12)
        let editingRectInset = CGPoint(x: 27, y: 12)
        let clearButtonRectInset = CGPoint(x: -10, y: .zero)
    }

    private var clearButtonRect: CGRect {
        super.clearButtonRect(forBounds: bounds)
    }

    // MARK: - Override

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: appearance.textRectInset.x, dy: appearance.textRectInset.y)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(
            by: .init(
                top: appearance.editingRectInset.y,
                left: appearance.editingRectInset.x,
                bottom: appearance.editingRectInset.y,
                right: appearance.editingRectInset.x + clearButtonRect.size.width
            )
        )
    }

    override public func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        clearButtonRect.offsetBy(
            dx: appearance.clearButtonRectInset.x,
            dy: appearance.clearButtonRectInset.y
        )
    }
}

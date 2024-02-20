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
        let clearButtonRectInset = CGPoint(x: -32, y: .zero)
    }

    /// Custom clear button, as required by design
    private lazy var customClearButton: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Inter.bold.font(size: 16)
        label.textColor = Asset.Colors.clearButton.color
        // design requires to use the X symbol, otherwise I would use "xmark" SFSymbol.
        label.text = "X"
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 0, width: 12, height: 19)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clearText))
        label.addGestureRecognizer(tapGesture)
        label.isHidden = true
        return label
    }()

    public var showsClearButton = false {
        didSet {
            customClearButton.isHidden = !showsClearButton
        }
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

    override public func layoutSubviews() {
        super.layoutSubviews()
        customClearButton.frame = CGRect(
            x: bounds.width - customClearButton.frame.width + appearance.clearButtonRectInset.x,
            y: (bounds.height - customClearButton.frame.height) / 2,
            width: customClearButton.frame.width,
            height: customClearButton.frame.height
        )
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(customClearButton)
        clearButtonMode = .never
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private
extension FittingTextField {
    @objc
    private func clearText() {
        text = String()
        sendActions(for: .editingChanged)
    }
}

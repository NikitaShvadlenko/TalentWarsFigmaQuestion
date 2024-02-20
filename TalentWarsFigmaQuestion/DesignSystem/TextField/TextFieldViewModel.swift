//
//  TextFieldViewModel.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 20.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//

import UIKit

public struct TextFieldDefaultViewModel: Equatable, Hashable {
    /// Message that will be shown if smth went wrong
    public var errorMessage: String?

    /// Message(or hint) under the TextField
    public var hint: String?

    /// Enabled / Disabled
    public var isEnabled: Bool

    /// Particular keyboard type
    public var keyboardType: UIKeyboardType

    /// Placeholder message that will be used by default
    public var placeholder: String?

    /// Hide or show clear bottom
    public var needsShowClearButton: Bool

    /// Text that will be displayed by default
    public var text: String?

    /// Message above the TextField
    public var title: String?

    /// Keyboard autocorrection behavior
    public var autocorrectionType: UITextAutocorrectionType

    /// Text Alignment
    public var textAlignment: NSTextAlignment

    /// Text Alignment
    public var isSecureTextEntry: Bool

    // MARK: - Init

    public init(
        errorMessage: String? = nil,
        hint: String? = nil,
        isEnabled: Bool,
        keyboardType: UIKeyboardType,
        placeholder: String? = nil,
        needsShowClearButton: Bool,
        text: String? = nil,
        title: String? = nil,
        autocorrectionType: UITextAutocorrectionType,
        textAlignment: NSTextAlignment,
        isSecureTextEntry: Bool = false
    ) {
        self.errorMessage = errorMessage
        self.hint = hint
        self.isEnabled = isEnabled
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.needsShowClearButton = needsShowClearButton
        self.text = text
        self.title = title
        self.autocorrectionType = autocorrectionType
        self.textAlignment = textAlignment
        self.isSecureTextEntry = isSecureTextEntry
    }
}

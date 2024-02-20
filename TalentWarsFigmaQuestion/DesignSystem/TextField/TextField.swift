//
//  TextField.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 20.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//

import UIKit

public protocol TextFieldProtocol: UIView, ViewModelConfigurable {
    /// Unique ID of the text field
    var uid: Any? { get set }

    /// Called when the input in the text field changes
    var onEdit: (((any Equatable)?) -> Void)? { get set }

    /// Called on begining of editing
    var onBeginEditing: ((UITextField) -> Void)? { get set }

    /// Called on end of editing
    var onEndEditing: ((UITextField) -> Void)? { get set }

    /// Called before the entering the text
    var onShouldBeginEditing: ((Any?) -> Bool)? { get set }
}

// |-----------------------|
// |     _____________     |
// |    | Title Label |    |
// |     -------------     |
// |    | Text Field  |    |
// |     -------------     |
// |    | Hint Label  |    |
// |     -------------     |
// |_______________________|

/// Custom realization of text field with title and hint
open class TextField: UIView, TextFieldProtocol {

    // MARK: - TextFieldProtocol

    public var uid: Any?

    public var onEdit: (((any Equatable)?) -> Void)?

    public var onBeginEditing: ((UITextField) -> Void)?

    public var onEndEditing: ((UITextField) -> Void)?

    public var onShouldBeginEditing: ((Any?) -> Bool)?

    // MARK: - Private

    private let appearance = Appearance(); struct Appearance {
        /// The height of text-field (as required by design)
        let textFieldHeight = 43
        /// Corner radius of the text field (as required by design)
        let textFieldBorderRadius: CGFloat = 20
        /// spacing between elements in stackView
        let stackViewSpacing: CGFloat = 10
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = appearance.stackViewSpacing
        return view
    }()

    private let placeholderAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: Asset.Colors.titleLabel.color,
        .font: FontFamily.Inter.bold.font(size: 16)
    ]

    private let titleLabel = UILabel()

    private lazy var textField: FittingTextField = {
        let view = FittingTextField()
        view.delegate = self
        view.backgroundColor = Asset.Colors.primaryBackground.color
        view.layer.cornerRadius = appearance.textFieldBorderRadius
        view.returnKeyType = .done
        view.font = FontFamily.Inter.bold.font(size: 16)
        return view
    }()

    private let hintLabel = UILabel()

    // MARK: - Init

    public required init() {
        super.init(frame: .zero)
        addSubviews()
        makeConstraints()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIResponder

    override open func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
    }
}

// MARK: - UITextFieldDelegate

extension TextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        onBeginEditing?(textField)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        onEndEditing?(textField)
    }

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        onShouldBeginEditing?(uid) ?? true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - ViewModelConfigurable

extension TextField: ViewModelConfigurable {
    public func configure(with viewModel: TextFieldDefaultViewModel) {
        // Title
        titleLabel.text = viewModel.title
        titleLabel.isHidden = viewModel.title == nil ? true : false

        // Text field
        textField.isEnabled = viewModel.isEnabled
        textField.keyboardType = viewModel.keyboardType
        textField.clearButtonMode = viewModel.needsShowClearButton ? .whileEditing : .never
        textField.text = viewModel.text
        textField.autocorrectionType = viewModel.autocorrectionType
        textField.textAlignment = viewModel.textAlignment
        textField.isSecureTextEntry = viewModel.isSecureTextEntry
        textField.placeholder = viewModel.placeholder
        if let placeholder = viewModel.placeholder {
            textField.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: placeholderAttributes
            )
        }

        // Hint
        hintLabel.text = viewModel.hint
        hintLabel.isHidden = viewModel.hint == nil ? true : false
    }
}

// MARK: - Private

private extension TextField {
    func addSubviews() {
        [titleLabel, textField, hintLabel].forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
    }

    func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        textField.snp.makeConstraints { make in
            make.height.equalTo(appearance.textFieldHeight).priority(.high)
        }
    }
}

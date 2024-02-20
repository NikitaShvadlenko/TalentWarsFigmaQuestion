//
//  NavigationBar.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 20.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//
import SnapKit
import UIKit

final class NavigationBar: UIView {

    private lazy var searchBar: TextField = {
        let searchBar = TextField()
        searchBar.configure(
            with:
                TextFieldDefaultViewModel(
                    isEnabled: true,
                    keyboardType: .default,
                    placeholder: L10n.Search.SearchBar.placeholder,
                    needsShowClearButton: true,
                    autocorrectionType: .no,
                    textAlignment: .justified,
                    isSecureTextEntry: false
                )
        )
        return searchBar
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Jomhuria.regular.font(size: 60)
        label.textColor = Asset.Colors.navigationBarTitle.color
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeAppearance()
        addSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - ViewModelConfigurable
extension NavigationBar: ViewModelConfigurable {
    func configure(with viewModel: String) {
    }
}

// MARK: - Private
extension NavigationBar {
    private func makeAppearance() {
        backgroundColor = Asset.Colors.navigationBar.color
    }

    private func addSubviews() {
        addSubview(searchBar)
        addSubview(titleLabel)
    }

    private func makeConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(37)
            make.height.equalTo(43)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(37)
            make.leading.equalToSuperview().inset(31)
            make.trailing.equalToSuperview().inset(22)
            make.bottom.equalToSuperview().inset(27)
        }
    }
}

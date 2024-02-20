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

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = L10n.Search.SearchBar.placeholder
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

// MARK: - Public
extension NavigationBar {
    func configureView(title: String) {
        titleLabel.text = title
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

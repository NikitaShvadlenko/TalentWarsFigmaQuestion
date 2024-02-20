//
//  SearchView.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 19.02.2024.
//  Copyright © 2024 Nikita Shvadlenko. All rights reserved.
//
import SnapKit
import UIKit

final class SearchView: UIView {

    private lazy var navigationView: UIView = {
        let view = NavigationBar()
        view.configure(with: L10n.Search.SearchBar.popularRightNow)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
        makeAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private
extension SearchView {
    private func makeAppearance() {
        backgroundColor = Asset.Colors.primaryBackground.color
    }

    private func addSubviews() {
        addSubview(navigationView)
    }

    private func makeConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
    }
}

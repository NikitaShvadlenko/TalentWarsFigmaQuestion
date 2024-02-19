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

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = FontFamily.Jomhuria.regular.font(size: 90)
        label.textAlignment = .center
        label.text = "Hello world"
        return label
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
        backgroundColor = Asset.mainColor.color
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

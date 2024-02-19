//
//  SearchViewController.swift
//  TalentWarsFigmaQuestion
//
//  Created by Nikita Shvad on 19.02.2024.
//

import UIKit

class SearchViewController: UIViewController {

    private let searchView = SearchView()

    override func loadView () {
        view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

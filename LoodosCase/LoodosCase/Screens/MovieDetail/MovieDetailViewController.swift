//
//  MovieDetailViewController.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit
import TinyConstraints

class MovieDetailViewController: UIViewController {
    
    public var viewModel: MovieDetailViewModelContracts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UILayout
extension MovieDetailViewController {
    
    private func addSubViews() {
    }
}

// MARK: - ConfigureContents
extension MovieDetailViewController {
    
    private func configureContents() {
        configureViewController()
        configureViewModel()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white.withAlphaComponent(0.8)
    }
    
    private func configureViewModel() {
        viewModel?.routes = self
        viewModel?.output = self
    }
}

// MARK: - MovieDetailViewModelOutput
extension MovieDetailViewController: MovieDetailViewModelOutput {
        
}

// MARK: - MovieDetailViewModelRoute
extension MovieDetailViewController: MovieDetailViewModelRoute {
    
}

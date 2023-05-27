//
//  MovieDetailViewBuilder.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//
import Foundation

final class MovieDetailViewBuilder {
    
    static func make(imdbId: String?) -> MovieDetailViewController {
        let viewController = MovieDetailViewController()
        let services = MoviesServices()
        let repository = MoviesRepository(moviesServices: services)
        let viewModel = MoviesDetailViewModel(imdbId: imdbId, repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

//
//  MovieDetailViewModel.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

final class MoviesDetailViewModel: MovieDetailViewModelContracts {
    var repository: MoviesRepositoryContracts
    var routes: MovieDetailViewModelRoute?
    var output: MovieDetailViewModelOutput?
    var movieData: MovieDataResponse?
    
    private var imdbId: String?
        
    init(imdbId: String?, repository: MoviesRepositoryContracts) {
        self.imdbId = imdbId
        self.repository = repository
    }
    
    func viewDidLoad() {
    }
}

// MARK: - DataSources
extension MoviesDetailViewModel {

}

// MARK: - ConfigureContents
extension MoviesDetailViewModel {
    
}


// MARK: - Requests
extension MoviesDetailViewModel {
}

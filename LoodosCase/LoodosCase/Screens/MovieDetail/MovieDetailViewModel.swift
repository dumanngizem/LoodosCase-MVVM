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
        getMovieDetail()
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
    
    private func getMovieDetail() {
        guard let imdbId = imdbId else { return }
        repository.getMovieDetail(imdbId: imdbId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.movieData = response
                self.output?.notifyResponse(data: response)
            case .failure(let error):
                self.output?.showRequestError(message: error.localizedDescription)
            }
        }
    }
}

//
//  MoviesRepository.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

final class MoviesRepository: MoviesRepositoryContracts {

    let moviesServices: MoviesDataSources
    
    init(moviesServices: MoviesDataSources) {
        self.moviesServices = moviesServices
    }
    
    func getMovies(search: String, page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        moviesServices.getMovies(search: search, page: page) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieDataResponse, NetworkError>) -> Void) {
        moviesServices.getMoviesDetail(imdbId: imdbId) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

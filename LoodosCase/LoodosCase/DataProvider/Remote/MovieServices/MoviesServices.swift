//
//  MoviesServices.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

final class MoviesServices: MoviesDataSources {
    func getMoviesDetail(imdbId: String, completion: @escaping (Result<MovieDataResponse, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(route: OmdbAPI.getMoviesDetail(imdbId: imdbId), responseModel: MovieDataResponse.self, completion: completion)
    }
    
    func getMovies(search: String, page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(route: OmdbAPI.getMovies(search: search, page: page), responseModel: MoviesResponse.self, completion: completion)
    }
}

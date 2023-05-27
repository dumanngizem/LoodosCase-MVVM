//
//  MovieRepositoryContracts.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

protocol MoviesRepositoryContracts {
    func getMovies(search: String, page: Int, completion: @escaping (Result<MoviesResponse, NetworkError>) -> Void)
    func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieDataResponse, NetworkError>) -> Void)
}

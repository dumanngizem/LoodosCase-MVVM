//
//  MovieDetailViewContracts.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

//MARK: - Contracts
protocol MovieDetailViewModelContracts {
    var routes: MovieDetailViewModelRoute? { get set }
    var output: MovieDetailViewModelOutput? { get set }
    var repository: MoviesRepositoryContracts { get set }
        
    func viewDidLoad()
}

// MARK: - Routes
protocol MovieDetailViewModelRoute: AnyObject {
}

//MARK: - Outputs
protocol MovieDetailViewModelOutput: AnyObject {
    func showRequestError(message: String)
    func notifyResponse(data: MovieDataResponse?)
}

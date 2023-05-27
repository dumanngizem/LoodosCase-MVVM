//
//  HomeViewContracts.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

//MARK: - Contracts
protocol HomeViewModelContracts {
    var routes: HomeViewModelRoute? { get set }
    var output: HomeViewModelOutput? { get set }
    var repository: MoviesRepositoryContracts { get set }
   
    var numberOfRowsInSection: Int { get }
    var moviesData: [SearchResponse]? { get set }
    var searchText: String { get set }
    
    func viewDidLoad()
    func textDidChange(text: String)
    func swipeConfigration(search: String)
    func didSelectRowAt(_ indexPath: IndexPath)
}

// MARK: - Routes
protocol HomeViewModelRoute: AnyObject {
    func pushMovieDetail(imdbId: String?)
}

//MARK: - Outputs
protocol HomeViewModelOutput: AnyObject {
    func showMoviesError(message: String)
    func showLoadingIndicator(isShow: Bool)
    func showEmptyData(isShow: Bool)
    func reloadTableView()
    func showBottomLoadingIndicator(isShow: Bool)
}

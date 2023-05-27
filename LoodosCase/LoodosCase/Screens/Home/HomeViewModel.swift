//
//  HomeViewModel.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

final class HomeViewModel: HomeViewModelContracts {
    weak var routes: HomeViewModelRoute?
    weak var output: HomeViewModelOutput?
    var repository: MoviesRepositoryContracts
    
    var searchText: String = ""
    var moviesData: [SearchResponse]?
    var movieData: MoviesResponse?
    
    private var currentPage: Int = 1
    
    init(repository: MoviesRepositoryContracts) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        
    }
    
    func textDidChange(text: String) {
        if !text.isEmpty {
            self.searchText = text
            getMovies(search: text)
        }
    }
    
    func swipeConfigration(search: String) {
        getMovieWithPaggination(search: search)
    }
    
    func didSelectRowAt(_ indexPath: IndexPath) {
        let id = moviesData?[indexPath.row].imdbID
        routes?.pushMovieDetail(imdbId: id)
    }
}

// MARK: - DataSources
extension HomeViewModel {
 
    var numberOfRowsInSection: Int {
        return moviesData?.count ?? 0
    }
}

// MARK: - ConfigureContents
extension HomeViewModel {
    
    private func configureCellItem(searchData: [SearchResponse]?, isPagination: Bool) {
        guard let searchData = searchData else {
            return
        }
        if isPagination {
            searchData.forEach { item in
                self.moviesData?.append(item)
            }
        } else {
            self.moviesData = searchData
        }
    }
}

// MARK: - Requests
extension HomeViewModel {
 
    private func getMovies(search: String) {
        output?.showLoadingIndicator(isShow: true)
        self.repository.getMovies(search: search, page: 1) { [weak self] result in
            guard let self = self else { return }
            self.output?.showLoadingIndicator(isShow: false)
            switch result {
            case .success(let response):
                self.configureCellItem(searchData: response.search, isPagination: false)
                self.movieData = response
                self.output?.reloadTableView()
                self.output?.showEmptyData(isShow: response.search?.isEmpty ?? true)
            case .failure(let error):
                self.output?.showMoviesError(message: error.localizedDescription)
            }
        }
    }
    
    private func getMovieWithPaggination(search: String) {
        guard let totalPage = movieData?.totalResults, currentPage <= Int(totalPage) ?? 0 else { return }
        output?.showBottomLoadingIndicator(isShow: true)
        self.repository.getMovies(search: search, page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.output?.showBottomLoadingIndicator(isShow: false)
            switch result {
            case .success(let response):
                self.currentPage += 1
                self.configureCellItem(searchData: response.search, isPagination: true)
                self.output?.reloadTableView()
                self.output?.showEmptyData(isShow: response.search?.isEmpty ?? true)
            case .failure(let error):
                self.output?.showMoviesError(message: error.localizedDescription)
            }
        }
    }
}

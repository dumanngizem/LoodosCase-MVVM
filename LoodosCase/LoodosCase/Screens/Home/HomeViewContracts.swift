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
    
    func viewDidLoad()
}

// MARK: - Routes
protocol HomeViewModelRoute: AnyObject {}

//MARK: - Outputs
protocol HomeViewModelOutput: AnyObject {}

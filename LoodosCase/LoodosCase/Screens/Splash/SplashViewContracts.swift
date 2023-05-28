//
//  SplashViewContracts.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

//MARK: - Contracts
protocol SplashViewModelContracts {
    var routes: SplashViewModelRoute? { get set }
    var output: SplashViewModelOutput? { get set }
   
    func viewDidLoad()
    func pushHome()
}

// MARK: - Routes
protocol SplashViewModelRoute: AnyObject {
    func pushHome()
}

//MARK: - Outputs
protocol SplashViewModelOutput: AnyObject {
    func showConnectionError(message: String)
    func remoteConfigration()
}


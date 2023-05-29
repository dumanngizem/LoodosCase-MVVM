//
//  SplashViewModel.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

final class SplashViewModel: SplashViewModelContracts {

    weak var routes: SplashViewModelRoute?
    weak var output: SplashViewModelOutput?
    
    func viewDidLoad() {
        internetConnection()
    }
    
    func pushHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.routes?.pushHome()
        }
    }
}

// MARK: - Requests
extension SplashViewModel {
 
    private func internetConnection() {
        if Connection.isConnectionInternet() {
            output?.remoteConfigration()
        } else {
            output?.showConnectionError(message: "NO INTERNET CONNECTION")
        }
    }
}

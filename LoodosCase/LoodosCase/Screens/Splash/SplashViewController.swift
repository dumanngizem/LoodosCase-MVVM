//
//  SplashViewController.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit
import TinyConstraints
import FirebaseRemoteConfig

class SplashViewController: UIViewController {
    
    var viewModel: SplashViewModelContracts = SplashViewModel()
    var remoteConfig: RemoteConfig?
    
    private let loodosLabel: UILabel = {
       let label = UILabel()
        label.textColor = .orange
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension SplashViewController {
    
    private func addSubViews() {
        addLodosLabel()
    }
    
    private func addLodosLabel() {
        view.addSubview(loodosLabel)
        loodosLabel.centerInSuperview()
    }
}

// MARK: - ConfigureContents
extension SplashViewController {
    
    private func configureContents() {
        configureView()
        configureViewModel()
        configureRemoteConfig()
    }
    
    private func configureView() {
        view.backgroundColor = .white.withAlphaComponent(0.9)
    }
    
    private func configureViewModel() {
        viewModel.routes = self
        viewModel.output = self
    }
    
    private func configureRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig?.configSettings = settings
    }
}

// MARK: - SplashViewModelOutput
extension SplashViewController: SplashViewModelOutput {
    func remoteConfigration() {
        let defaults: [String: NSObject] = ["lds_splash_text" : false as NSObject]
        self.remoteConfig?.setDefaults(defaults)
        self.remoteConfig?.fetch(withExpirationDuration: 0, completionHandler: { [weak self] status, error in
            guard let self = self else { return }
            if status == .success, error == nil {
                self.remoteConfig?.activate(completion: { bool, error in
                    guard error == nil else { return }
                    let value = self.remoteConfig?.configValue(forKey: "lds_splash_text")
                    DispatchQueue.main.async {
                        self.loodosLabel.text = value?.stringValue
                        self.viewModel.pushHome()
                    }
                })
            } else {
                let alertController = UIAlertController(title: "Remote Config", message: "Remote Configrasyonda Bir Hata Oluştu", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "Tamam", style: .default)
                alertController.addAction(confirmAction)
                DispatchQueue.main.async {
                    self.present(alertController, animated: true)
                }
            }
        })
    }
    
    func showConnectionError(message: String) {
        let alertController = UIAlertController(title: "Connection Error", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(alertAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}

// MARK: - SplashViewModelRoute
extension SplashViewController: SplashViewModelRoute {
    func pushHome() {
        let viewController = HomeViewBuilder.make()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

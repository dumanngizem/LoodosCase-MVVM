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
    
    private let loodosButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 60)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.viewDidLoad()
        addTargets()
    }
}

// MARK: - UILayout
extension SplashViewController {
    
    private func addSubViews() {
        addLoodosButton()
    }
    
    private func addLoodosButton() {
        view.addSubview(loodosButton)
        loodosButton.centerInSuperview()
        loodosButton.size(.init(width: 200, height: 150))
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
        view.backgroundColor = .orange
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

// MARK: - Targets
extension SplashViewController {
    
    private func addTargets() {
        loodosButton.addTarget(self, action: #selector(loodosButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension SplashViewController {
    @objc
    private func loodosButtonTapped() {
        loodosButton.setTitle("", for: .normal)
        EntryKitHelper.showLoading()
        viewModel.loodosButtonTapped()
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
                        self.loodosButton.setTitle(value?.stringValue, for: .normal)
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

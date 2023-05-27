//
//  HomeViewController.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit

final class HomeViewController: UIViewController {

    var viewModel: HomeViewModelContracts = HomeViewModel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

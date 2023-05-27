//
//  TableView+Extensions.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit

extension UITableView {
    
    func setEmptyViewIcon(message: String, image: UIImage) {
        let emptyView = EmptyView(frame: CGRect(x: self.center.x,
                                                y: self.center.y,
                                                width: self.bounds.size.width,
                                                height: self.bounds.size.height))
        
        emptyView.setImage = image
        emptyView.messageText = message

        self.backgroundView = emptyView
    }
    
    func showActivityIndicator() {
         
        let activityIndicator = UIActivityIndicatorView(style: .gray)
         
         addSubview(activityIndicator)
         activityIndicator.centerInSuperview()
         activityIndicator.startAnimating()
         
         self.backgroundView = activityIndicator
     }

    func restore() {
        self.backgroundView = nil
    }
    
    func showSpinnerView() {
        let view = UIView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.center = view.center
        spinner.startAnimating()
        view.addSubview(spinner)
        self.tableFooterView = view
    }
    
    func hideSpinnerView() {
        self.tableFooterView = nil
    }
}


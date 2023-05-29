//
//  StackView+Extension.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit

extension UIStackView {
    
    func allRemove(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            allRemove(view: view)
        }
    }
}

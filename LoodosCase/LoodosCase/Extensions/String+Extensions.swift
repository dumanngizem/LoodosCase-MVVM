//
//  String+Extensions.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

extension String {
    var toURL: URL? {
        let stringUrl = self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let stringUrl = stringUrl {
            return URL(string: stringUrl)
        } else {
            return nil
        }
    }
}

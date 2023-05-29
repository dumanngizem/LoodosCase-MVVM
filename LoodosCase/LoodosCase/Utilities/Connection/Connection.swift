//
//  Connection.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation
import Alamofire

class Connection {
    class func isConnectionInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

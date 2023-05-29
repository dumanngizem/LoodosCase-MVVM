//
//  HttpHeader.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

enum HttpHeader {
    case contentType(value : String? = "application/json")
    case bearerToken(token : String)
    
    var key : String {
        switch self {
        case .contentType:
            return "Content-Type"
        case .bearerToken(_):
            return "Authorization"
        }
    }
    
    var value : String {
        switch self {
        case .contentType(let value):
            return value ?? "application/json"
        case .bearerToken(let token):
            return "Bearer \(token)"
        }
    }
}

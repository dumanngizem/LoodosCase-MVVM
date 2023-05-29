//
//  NetworkError.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation

enum NetworkError : Error, LocalizedError{
    case invalidURL
    case request(statusCode : Int,data : Data?)
    case badRequest
    case decodeError
    case noInternet
    case noResponse
    case responseConvert
    case noData
}

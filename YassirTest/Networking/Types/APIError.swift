//
//  APIError.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

enum APIError: Error {
    
    // MARK: - Cases
    
    case unknown
    case unreachable
    case unauthorized
    case failedRequest
    case invalidResponse

}

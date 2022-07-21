//
//  APIEndpoint.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Foundation

enum APIEndpoint {
    
    // MARK: - Cases
    
    case movies
    case movieDetails(id: Int)
    
    
    // MARK: - Properties
    
    func request() throws -> URLRequest {
        var request = URLRequest(url: url)
        
        request.addParameters(parameters)
        request.addHeaders(headers)
        
        request.httpMethod = httpMethod.rawValue
        request.httpBody = httpBody
        
        return request
    }
    
    private var url: URL {
        Environment.apiBaseURL.appendingPathComponent(path)
    }
    
    private var path: String {
        switch self {
        case .movies:
            return "discover/movie"
        case let .movieDetails(id: id):
            return "/movie/\(id)"
        }
    }
    
    private var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    private var httpBody: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .movieDetails:
            return [ "api_key": "\(Environment.apiKey)", "language": "en-US" ]
        default:
            return [ "api_key": "\(Environment.apiKey)" ]
        }
    }
    
    private var headers: Headers {
        let headers: Headers = [
            "Content-Type": "application/json"
        ]
        
        return headers
    }
    
}

extension URLRequest {
    
    mutating func addHeaders(_ headers: Headers) {
        headers.forEach { header, value in
            addValue(value, forHTTPHeaderField: header)
        }
    }
    
    mutating func addParameters(_ parameters: Parameters) {
        guard let url = url else { return }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                let queryItem = URLQueryItem (name: key, value: "\(value)" .addingPercentEncoding (withAllowedCharacters: .urlHostAllowed))
                
                urlComponents.queryItems?.append(queryItem)
                self.url = urlComponents.url
            }
        }
    }
    
}

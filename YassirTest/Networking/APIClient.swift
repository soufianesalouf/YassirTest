//
//  APIClient.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import Combine
import Foundation

final class APIClient: APIService {
    
    // MARK: - API Service
    
    func movies() -> AnyPublisher<TrendingMovies, APIError> {
        request(.movies)
    }
    
    func movieDetails(id: Int) -> AnyPublisher<Movie, APIError> {
        request(.movieDetails(id: id))
    }
    
    func posterConfiguration() -> AnyPublisher<Posters, APIError> {
        request(.posterConfiguration)
    }

    // MARK: - Helper Methods

    private func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
        do {
            
            let request = try endpoint.request()

            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { data, response -> T in
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                        throw APIError.failedRequest
                    }

                    guard (200..<300).contains(statusCode) else {
                        if statusCode == 401 {
                            throw APIError.unauthorized
                        } else {
                            throw APIError.failedRequest
                        }
                    }

                    if statusCode == 204, let noContent = NoContent() as? T {
                        return noContent
                    }

                    do {
                        return try JSONDecoder().decode(T.self, from: data)
                    } catch {
                        print("Unable to Decode Response \(error)")
                        throw APIError.invalidResponse
                    }
                }
                .mapError { error -> APIError in
                    switch error {
                    case let apiError as APIError:
                        return apiError
                    case URLError.notConnectedToInternet:
                        return APIError.unreachable
                    default:
                        return APIError.failedRequest
                    }
                }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        } catch {
            if let apiError = error as? APIError {
                return Fail(error: apiError)
                    .eraseToAnyPublisher()
            } else {
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
        }
    }

}

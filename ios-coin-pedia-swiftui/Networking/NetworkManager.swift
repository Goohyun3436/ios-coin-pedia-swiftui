//
//  NetworkManager.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import Foundation

typealias Parameters = [String: String]
typealias HTTPHeaders = [String: String]

protocol APIRequest {
    var endpoint: String { get }
    var parameters: Parameters { get }
    var headers: HTTPHeaders { get }
}

protocol APIErrorResponse: Decodable {
    var error: String { get }
}

protocol APIError: Error {
    var title: String { get }
    var message: String { get }
    init(statusCode: Int)
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<ResponseType: Decodable, ErrorResponseType: APIErrorResponse, ErrorType: APIError>(
        _ request: APIRequest,
        _ responseT: ResponseType.Type,
        _ errorResponseT: ErrorResponseType.Type,
        _ errorT: ErrorType.Type
    ) async -> Result<ResponseType, ErrorType> {
        
        guard let urlRequest = self.setupRequest(request) else {
            return .failure(ErrorType(statusCode: 0))
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(ErrorType(statusCode: 0))
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if !(200...299).contains(httpResponse.statusCode) {
                return .failure(ErrorType(statusCode: httpResponse.statusCode))
//                do {
//                    let error = try decoder.decode(errorResponseT.self, from: data)
//                    return .failure(ErrorType(statusCode: error.statusCode))
//                } catch {
//                    return .failure(ErrorType(statusCode: 0))
//                }
            }
            
            do {
                let responseObject = try decoder.decode(responseT.self, from: data)
                return .success(responseObject)
            } catch {
                dump(error)
                return .failure(ErrorType(statusCode: 0))
            }
            
        } catch {
            return .failure(ErrorType(statusCode: 0))
        }
    }
    
    private func setupRequest(_ request: APIRequest) -> URLRequest? {
        guard var urlComponents = URLComponents(string: request.endpoint) else { return nil }
        
        urlComponents.queryItems = request.parameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        guard let url = urlComponents.url else { return nil }
        
        var urlRequest = URLRequest(url: url, timeoutInterval: 5)
        
        request.headers.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return urlRequest
    }
}

extension NetworkManager {
    func fetchCGTrending() async -> Result<CGTrendingDTO, CGError> {
        await request(
            CGRequest.trending,
            CGTrendingDTO.self,
            CGErrorResponse.self,
            CGError.self
        )
    }
}

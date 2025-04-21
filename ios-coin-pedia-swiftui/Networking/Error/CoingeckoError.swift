//
//  CoingeckoError.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import Foundation

struct CGErrorResponse: APIErrorResponse {
    let error: String
}

enum CGError: String, APIError {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case missingParameter
    case tooManyRequests
    case internalServerError
    case serviceUnavailable
    case accessDenied
    case apiKeyMissing
    case unowned
    
    init(statusCode: Int) {
        switch statusCode {
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 422:
            self = .missingParameter
        case 429:
            self = .tooManyRequests
        case 500:
            self = .internalServerError
        case 503:
            self = .serviceUnavailable
        case 1020:
            self = .accessDenied
        case 10002:
            self = .apiKeyMissing
        default:
            self = .unowned
        }
    }
    
    var title: String {
        return "네트워크 에러"
    }
    
    var message: String {
        return "\(self.description) (\(self.rawValue))"
    }
    
    private var description: String {
        switch self {
        case .badRequest, .missingParameter:
            return "잘못된 요청입니다."
        case .unauthorized:
            return "리소스에 대한 유효한 인증 자격 증명이 필요합니다."
        case .forbidden:
            return "엑세스가 차단되었습니다."
        case .notFound:
            return "요청한 리소스를 찾을 수 없습니다."
        case .tooManyRequests:
            return "요금이 한도에 도달하였습니다. 서비스 플랜을 확장하세요."
        case .internalServerError:
            return "CoinGecko 서버에 오류가 발생했습니다."
        case .serviceUnavailable:
            return "현재 CoinGecko 서비스를 이용할 수 없습니다. API 상태와 업데이트를 확인하세요."
        case .accessDenied:
            return "CoinGecko CDN 방화벽 규칙 위반으로 인해 요청이 거부되었습니다."
        case .apiKeyMissing:
            return "CoinGecko API 키의 자격 증명을 확인하세요."
        case .unowned:
            return "Coin Pedia 내부에 오류가 발생했습니다."
        }
    }
}

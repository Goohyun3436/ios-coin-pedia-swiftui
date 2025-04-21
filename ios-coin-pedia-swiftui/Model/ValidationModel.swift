//
//  ValidationModel.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import Foundation

enum SearchError: Error {
    case emptyQuery
    
    var title: String {
        return "검색 실패"
    }
    
    var message: String {
        switch self {
        case .emptyQuery:
            return "검색어를 입력해주세요"
        }
    }
    
    static func validation(_ query: String) -> Result<String, SearchError> {
        let query = query.trimmingCharacters(in: .whitespaces)
        
        guard !query.isEmpty else {
            return .failure(.emptyQuery)
        }
        
        return .success(query)
    }
}

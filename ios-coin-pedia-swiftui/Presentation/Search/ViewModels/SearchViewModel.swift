//
//  SearchViewModel.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import Foundation
import Combine

//MARK: - Initializer
final class SearchViewModel: BaseViewModel {
    var input = Input()
    
    @Published
    var output = Output()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        transform()
    }
}

//MARK: - Input/Output
extension SearchViewModel {
    struct Input {}

    struct Output {}
    
    func transform() {}
}

//MARK: - Action
extension SearchViewModel {
    enum Action {}
}

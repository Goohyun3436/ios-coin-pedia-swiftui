//
//  BaseViewModel.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/20/25.
//

import Foundation
import Combine

protocol BaseViewModel: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get set }
    
    var input: Input { get set }
    var output: Output { get set }
    
    func transform()
}

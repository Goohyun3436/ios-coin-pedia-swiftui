//
//  NavigationSearchModifier.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import SwiftUI

struct NavigationSearchModifier: ViewModifier {
    @Binding var text: String
    private let placeholder: String
    private let onSubmit: (String) -> Void
    private let onChange: (String) -> Void
    private let initial: Bool
    
    init(
        text: Binding<String>,
        placeholder: String,
        onSubmit: @escaping (String) -> Void,
        onChange: @escaping (String) -> Void,
        initial: Bool
    ) {
        self._text = text
        self.placeholder = placeholder
        self.onSubmit = onSubmit
        self.onChange = onChange
        self.initial = initial
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 17, *) {
            content
                .searchable(
                    text: $text,
                    placement: .navigationBarDrawer,
                    prompt: placeholder
                )
                .onSubmit(of: .search) {
                    onSubmit(text)
                }
                .onChange(of: text, initial: initial) { _, newValue in
                    onChange(newValue)
                }
        } else {
            content
                .searchable(
                    text: $text,
                    placement: .navigationBarDrawer,
                    prompt: placeholder
                )
                .onSubmit(of: .search) {
                    onSubmit(text)
                }
                .onChange(of: text) { newValue in
                    onChange(newValue)
                }
        }
    }
}

extension View {
    
    func asNavigationSearchable(
        text: Binding<String>,
        placeholder: String,
        onSubmit: @escaping (String) -> Void,
        onChange: @escaping (String) -> Void,
        initial: Bool
    ) -> some View {
        modifier(NavigationSearchModifier(
            text: text,
            placeholder: placeholder,
            onSubmit: onSubmit,
            onChange: onChange,
            initial: initial
        ))
    }
    
}

//
//  AlertModifier.swift
//  ios-coin-pedia-swiftui
//
//  Created by Goo on 4/21/25.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    @Binding var isShow: Bool
    let title: String?
    let message: String?
    let primaryButton: Alert.Button
    var secondaryButton: Alert.Button? = nil
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isShow) {
                if let secondaryButton {
                    Alert(
                        title: Text(title ?? "경고"),
                        message: Text(message ?? "문제가 발생했습니다."),
                        primaryButton: primaryButton,
                        secondaryButton: secondaryButton
                    )
                } else {
                    Alert(
                        title: Text(title ?? "경고"),
                        message: Text(message ?? "문제가 발생했습니다."),
                        dismissButton: primaryButton
                    )
                }
            }
    }
}

extension View {
    func configureAlert(
        isShow: Binding<Bool>,
        title: String?,
        message: String?,
        primaryButton: Alert.Button,
        secondaryButton: Alert.Button? = nil
    ) -> some View {
        modifier(AlertModifier(
            isShow: isShow,
            title: title,
            message: message,
            primaryButton: primaryButton,
            secondaryButton: secondaryButton
        ))
    }
}

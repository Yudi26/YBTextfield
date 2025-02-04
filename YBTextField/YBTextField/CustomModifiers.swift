//
//  Title.swift
//  YBTextField
//
//  Created by Yogesh Bhatt on 17/01/25.
//
import SwiftUI

struct FloatingPlaceholderAnimation: ViewModifier {
    @Binding var isFloatingLabelEnabled: Bool
    @Binding var isFloatingLabelNeeded: Bool
    @Binding var placeholder: String
    @Binding var enteredText: String
    @Binding var textFieldHeight: CGFloat
    @FocusState.Binding var isFocused: Bool
    
    var floatingLabelPadding: CGFloat {
        return -(textFieldHeight * 0.54)
    }
    
    func body(content: Content) -> some View {
        if placeholder.isEmpty {
            content
                .hidden()
        } else if isFloatingLabelNeeded {
            content
                .font(isFloatingLabelEnabled ? .title2: .title)
                .padding(.leading, 3)
                .offset(y: isFloatingLabelEnabled ? floatingLabelPadding : 0) // Start offset
                .animation(.easeInOut(duration: 0.6), value: isFloatingLabelEnabled)
        } else {
            content
                .font(isFloatingLabelEnabled ? .title2: .title)
                .padding(.leading, 3)
        }
    }
}

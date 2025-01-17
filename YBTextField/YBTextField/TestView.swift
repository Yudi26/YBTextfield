//
//  TestView.swift
//  YBTextField
//
//  Created by Yogesh Bhatt on 16/01/25.
//

import SwiftUI

struct TestView: View {
    @State private var showText = false
    @FocusState private var isFocused1
    @FocusState private var isFocused2
    @FocusState private var isFocused3
    
    var body: some View {
        VStack {
            YBTextfield(
                isFloatingLabelNeeded: true,
                enteredText: "",
                placeholder: "Enter Name",
                errorMessage: "",
                focusedField: _isFocused1
            )
            YBTextfield(
                isFloatingLabelNeeded: false,
                enteredText: "",
                placeholder: "Enter SurName",
                errorMessage: "",
                focusedField: _isFocused2
            )
            YBTextfield(isFloatingLabelNeeded: true,
                        enteredText: "I am SDE",
                        placeholder: "aaa",
                        errorMessage: "",
                        focusedField: _isFocused3
            )
        }
    }
}

#Preview {
    TestView()
}

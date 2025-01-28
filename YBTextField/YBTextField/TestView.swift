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
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""
    
    var body: some View {
        VStack {
            YBTextfield(
                isFloatingLabelNeeded: true,
                enteredText: $firstName,
                placeholder: "Enter Name",
                errorMessage: "",
                focusedField: _isFocused1
            )
            YBTextfield(
                isFloatingLabelNeeded: true,
                enteredText: $lastName,
                placeholder: "Enter Last Name",
                errorMessage: "",
                focusedField: _isFocused2
            )
            YBTextfield(isFloatingLabelNeeded: true,
                        enteredText: $age,
                        placeholder: "Enter Age",
                        errorMessage: "",
                        focusedField: _isFocused3
            ).keyboardType(.numberPad)
        }
    }
}

#Preview {
    TestView()
}

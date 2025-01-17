//
//  YBTextFieldApp.swift
//  YBTextField
//
//  Created by Yogesh Bhatt on 15/01/25.
//

import SwiftUI

@main
struct YBTextFieldApp: App {
    @FocusState private var isFocused1
    @FocusState private var isFocused2
    @FocusState private var isFocused3
    @State var enteredText = "sd"
    var body: some Scene {
        WindowGroup {
//            ContentView(isFloatingLabelNeeded: true, enteredText: "", placeholder: "Enter price", errorMessage: "", focusedField: _isfocused)
//            TestView(isFocused1: $isFocused1, isFocused2: $isFocused2, isFocused3: $isFocused3)
            TestView()
        }
    }
}

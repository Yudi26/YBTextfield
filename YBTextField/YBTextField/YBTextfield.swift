//
//  ContentView.swift
//  YBTextField
//
//  Created by Yogesh Bhatt on 15/01/25.
//

import SwiftUI

struct YBTextfield: View {
    @State private var isFloatingLabelEnabled: Bool = false
    @State private var isPlaceholderHidden: Bool = false
    @State var isError: Bool = false
    
    // Client reuqired properties
    @State var isFloatingLabelNeeded: Bool
    @State var enteredText: String
    @State var placeholder: String
    @State var errorMessage: String
    
    @State var height: CGFloat = 50
    
    @FocusState var focusedField
    
    var fontName: String = "Avenir Medium"
    var fontSize: CGFloat = 16
    
    var getColor: Color {
        if isError {
            return .red
        } else if (isFloatingLabelEnabled || isFloatingLabelNeeded) && focusedField {
            return .blue
        } else {
            return .gray
        }
    }
    
    func didTextfieldChanged(text: String) {
        if !isFloatingLabelNeeded && enteredText.count > 0 {
            // flaoting not needed but placeholder always needed
            isPlaceholderHidden = true
        } else if isFloatingLabelNeeded {
            // flaoting needed
            if focusedField && enteredText.count > 0 {
                isFloatingLabelEnabled = true
            }
        } else {
            // placeholder always needed
            isPlaceholderHidden = false
        }
    }
    
    var body: some View {
        
        
        VStack {
            ZStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading) {
                        VStack {
                            VStack {
                                TextField("", text: $enteredText)
                                    .focused($focusedField)
                                    .font(Font(UIFont(name: fontName, size: 20) ?? UIFont.systemFont(ofSize: 18)))
                                    .onChange(of: enteredText) { enteredText in
                                        print("Entered Text: \(enteredText)")
                                        self.didTextfieldChanged(text: enteredText)
                                    }
                            }
                            .padding(20)
                            .frame(height: height)
                            .background(.white)
                        }
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(getColor, lineWidth: 2)
                        }
                        if isError {
                            Text(errorMessage)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(getColor)
                        }
                    }
                    .padding(10)
                }
                //                .frame(height: height)
                // Floating View // Placeholder
                if !isPlaceholderHidden {
                    VStack {
                        Text(placeholder)
                        //                            .font(.title)
                            .font(Font(UIFont(name: fontName, size: 20) ?? UIFont.systemFont(ofSize: 18)))
                            .lineLimit(0)
                        
                    }
                    .foregroundColor(getColor)
                    .padding(5)
                    .background(.white)
                    .padding(.leading, 34)
                    .modifier(FloatingPlaceholderAnimation(isFloatingLabelEnabled: $isFloatingLabelEnabled, isFloatingLabelNeeded: $isFloatingLabelNeeded, placeholder: $placeholder, enteredText: $enteredText, textFieldHeight: $height, isFocused: $focusedField))
                }
            }
            .onAppear {
                if !enteredText.isEmpty {
                    isFloatingLabelEnabled = true
                    focusedField = false
                }
            }
            if !focusedField && enteredText.isEmpty {
                VStack {
                    // Empty view for action
                }.onAppear {
                    isFloatingLabelEnabled = false
                }
            }
        }
        .onTapGesture {
            focusedField = true
            isFloatingLabelEnabled = true
        }
        .padding(.all, 5)
    }
}

#Preview {
    // Tag the dynamic property with `Previewable`.
    @Previewable @State var enteredText = ""
    @FocusState var isFocused: Bool
    // Pass it into your view.
    YBTextfield(isFloatingLabelNeeded: true, enteredText: "", placeholder: "Enter price", errorMessage: "", focusedField: _isFocused)
}

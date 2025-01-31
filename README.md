# YBTextfield
Reusable Textfield in SwiftUI 🚀

# Features 💥:

- You can enable / disable floating lable.
- Labels moves with smooth animation

**Usage**
    
    struct TestView: View {
    @FocusState private var isFocused
    @State private var firstName = ""
    var body: some View {
        VStack {
            YBTextfield(
                isFloatingLabelNeeded: true,
                enteredText: $firstName,
                placeholder: "Enter Name",
                errorMessage: "",
                focusedField: _isFocused1
            )}
    }}

# Upcoming Features 🎁:

- Icon on right side of Textfield
- enums to configure textfield easily
- Inline floating label 





**See Video for Basic Usage of YBTextfield**

https://github.com/user-attachments/assets/b78b857c-adee-4f1f-a6f9-f294258902c3


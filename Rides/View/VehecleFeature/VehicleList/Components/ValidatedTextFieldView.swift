import SwiftUI

struct ValidatedTextFieldView: View {
  @Binding var inputText: String
  @Binding var isValidInput: Bool
  var placeholder: String
  var errorMessage: String?
  var validation: @MainActor (String) -> Bool
  
  var body: some View {
    VStack(alignment: .leading) {
      TextField(placeholder, text: $inputText)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.numberPad)
        .overlay(
          RoundedRectangle(cornerRadius: 5)
            .stroke(isValidInput ? Color.gray : Color.red, lineWidth: 1)
        )
        .onChange(of: inputText) { newValue in
          isValidInput = validation(newValue)
        }
      
      if !isValidInput, let errorMessage = errorMessage {
        Text(errorMessage)
          .font(.caption)
          .foregroundStyle(Color.red)
          .padding(.top, 4)
      }
    }
    .padding(.horizontal, 16)
  }
}

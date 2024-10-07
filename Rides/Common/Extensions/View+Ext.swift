import SwiftUI

// Create a View Modifier for card-like styling
struct CardStyleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(20)
      .frame(height: 270, alignment: .top)
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(20)
      .shadow(radius: 10)
      .padding(.horizontal, 16)
  }
}

// Extension to apply the custom modifier
extension View {
  func cardStyle() -> some View {
    self.modifier(CardStyleModifier())
  }
}

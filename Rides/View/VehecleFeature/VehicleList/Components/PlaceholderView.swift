import SwiftUI

struct PlaceholderView: View {
  var body: some View {
    VStack(spacing: 16) {
      Image(systemName: "tray")
        .font(.system(size: 60))
        .foregroundStyle(.gray)

      Text("No vehicles available")
        .font(.headline)
        .foregroundStyle(.gray)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct PlaceholderView_Previews: PreviewProvider {
  static var previews: some View {
    PlaceholderView()
  }
}

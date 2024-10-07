import SwiftUI

struct InfoRowView: View {
  let title: String
  let descriptions: String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.subheadline)
        .foregroundStyle(Color.gray)
      
      Text(descriptions)
        .font(.body)
        .foregroundStyle(.black)
    }
  }
}

struct InfoRowView_Previews: PreviewProvider {
  static var previews: some View {
    InfoRowView(
      title: "VIN:",
      descriptions: "1HGCM82633A123456"
    )
  }
}

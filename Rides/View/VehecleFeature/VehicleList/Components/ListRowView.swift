import SwiftUI

struct ListRowView: View {
  let vehicle: Vehicle
  
  var body: some View {
    NavigationLink(value: vehicle) {
      HStack {
        VStack(alignment: .leading) {
          Text(vehicle.makeAndModel)
            .font(.subheadline)
            .foregroundStyle(Color.gray)
          
          Text("VIN: \(vehicle.vin)")
            .font(.body)
            .foregroundStyle(.black)
        }
      }
    }
  }
}

struct ListRowView_Previews: PreviewProvider {
  static var previews: some View {
    ListRowView(vehicle: .mock)
  }
}

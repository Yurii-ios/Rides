import SwiftUI

struct VehicleDetailView: View {
  let vehicle: Vehicle
  
  var body: some View {
    ZStack {
      Color.gray.opacity(0.1).ignoresSafeArea()
      
      VStack(alignment: .leading, spacing: 10) {
        InfoRowView(title: "VIN:", descriptions: vehicle.vin)
        
        Divider()
        
        InfoRowView(title: "Make and Model:", descriptions: vehicle.makeAndModel)
        
        Divider()
        
        InfoRowView(title: "Color:", descriptions: vehicle.color)
        
        Divider()
        
        InfoRowView(title: "Type:", descriptions: vehicle.carType)
      }
      .padding(20)
      .frame(height: 270)
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(20)
      .shadow(radius: 10)
      .padding(.horizontal, 16)
    }
    .navigationTitle("Vehicle Details")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct VehicleDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VehicleDetailView(vehicle: .mock)
    }
  }
}

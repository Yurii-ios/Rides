import SwiftUI

struct VehicleDetailView: View {
  private let vehicle: Vehicle
  @StateObject private var viewModel: VehicleDetailViewModel

  init(vehicle: Vehicle) {
    self.vehicle = vehicle
    _viewModel = StateObject(wrappedValue: VehicleDetailViewModel(vehicle: vehicle))
  }

  var body: some View {
    ZStack {
      Color.gray.opacity(0.1).ignoresSafeArea()

      TabView {
        VStack(alignment: .leading, spacing: 10) {
          InfoRowView(title: "VIN:", descriptions: vehicle.vin)

          Divider()

          InfoRowView(title: "Make and Model:", descriptions: vehicle.makeAndModel)

          Divider()

          InfoRowView(title: "Color:", descriptions: vehicle.color)

          Divider()

          InfoRowView(title: "Type:", descriptions: vehicle.carType)
        }
        .cardStyle()
        .tabItem {
          Text("Details")
        }

        VStack(alignment: .leading, spacing: 10) {
          InfoRowView(
            title: "Kilometrage:",
            descriptions: "\(vehicle.kilometrage) km"
          )

          Divider()

          InfoRowView(
            title: "Estimated Emissions:",
            descriptions: "\(viewModel.calculateEmissions(for: vehicle.kilometrage)) units"
          )
        }
        .cardStyle()
        .tabItem {
          Text("Emissions")
        }
      }
      .tabViewStyle(.page)
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

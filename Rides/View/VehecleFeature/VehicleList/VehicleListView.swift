import SwiftUI

struct VehicleListView: View {
  @State private var isValidInput: Bool = true
  @StateObject private var viewModel = VehicleListViewModel()

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        ValidatedTextFieldView(
          inputText: $viewModel.inputCount,
          isValidInput: $isValidInput,
          placeholder: "Enter number of vehicles",
          errorMessage: viewModel.errorMessage,
          validation: viewModel.validateCount
        )

        Button("Fetch Vehicles") {
          Task {
            await viewModel.fetchVehicles()
          }
        }
        .buttonStyle(.borderedProminent)

        ZStack {
          if viewModel.vehicles.isEmpty {
            PlaceholderView()
          } else {
            List(viewModel.vehicles, id: \.id) { vehicle in
              VStack {
                ListRowView(vehicle: vehicle)

                if viewModel.vehicles.last != vehicle {
                  Divider()
                }
              }
              .listRowBackground(Color.clear)
              .listRowSeparator(.hidden)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .scrollContentBackground(.hidden)
            .navigationDestination(for: Vehicle.self) { vehicle in
              VehicleDetailView(vehicle: vehicle)
            }
            .padding(.bottom, 20)
          }
        }
      }
      .background(Color.gray.opacity(0.1))
      .navigationTitle("Vehicles")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Menu {
            Picker("", selection: $viewModel.sortOption) {
              ForEach(VehicleSortOption.allCases, id: \.self) { option in
                Text(option.rawValue).tag(option)
              }
            }
          } label: {
            Text("Sort by")
          }
        }
      }
      .onChange(of: viewModel.sortOption) { newOption in
        viewModel.vehicles = viewModel.sortVehicles(vehicles: viewModel.vehicles, by: newOption)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    VehicleListView()
  }
}

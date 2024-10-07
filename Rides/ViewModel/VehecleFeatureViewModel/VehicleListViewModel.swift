import Foundation

@MainActor
class VehicleListViewModel: ObservableObject {
  @Published var inputCount: String = ""
  @Published var vehicles: [Vehicle] = []
  @Published var sortOption: VehicleSortOption = .vin
  @Published var errorMessage: String?

  private var apiService: APIServiceProtocol

  init(apiService: APIServiceProtocol = APIService()) {
    self.apiService = apiService
  }

  /// Method to sort an array of Vehicle objects based on the specified sort option.
  /// - Parameters:
  ///   - vehicles: The array of Vehicle objects to be sorted.
  ///   - option: The VehicleSortOption used to determine the sorting criteria.
  /// - Returns: A new array of Vehicle objects sorted according to the selected criteria.
  func sortVehicles(vehicles: [Vehicle], by option: VehicleSortOption) -> [Vehicle] {
    switch option {
    case .vin:
      return vehicles.sorted { $0.vin < $1.vin }
    case .carType:
      return vehicles.sorted { $0.carType < $1.carType }
    }
  }

  func fetchVehicles() async {
    guard let count = Int(inputCount), validateCount(inputCount) else { return }
    // add loader logic here if needed
    do {
      let vehicles = try await apiService.fetchVehicles(count: count)
      self.vehicles = self.sortVehicles(vehicles: vehicles, by: self.sortOption)
    } catch {
      // Error handling can be implemented here to handle cases where fetching data fails.
    }
  }

  func validateCount(_ countText: String) -> Bool {
    guard let count = Int(countText), count >= 1 && count <= 100 else {
      errorMessage = "Please enter a number between 1 and 100."
      return false
    }
    errorMessage = nil
    return true
  }
}

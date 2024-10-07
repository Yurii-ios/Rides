import Foundation

class VehicleDetailViewModel: ObservableObject {
  private let vehicle: Vehicle

  init(vehicle: Vehicle) {
    self.vehicle = vehicle
  }

  /// Calculate emissions based on kilometrage
  /// Emission calculation logic:
  /// - If the kilometrage is within the base limit, emissions are calculated using a base emission rate.
  /// - For kilometrage above the base limit, emissions are calculated using a higher rate for the extra kilometers.
  func calculateEmissions(for kilometers: Int) -> Double {
    if kilometers <= 5000 {
      return Double(kilometers)
    } else {
      return 5000 + (Double(kilometers - 5000) * 1.5)
    }
  }
}

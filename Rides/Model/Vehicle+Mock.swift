import Foundation

extension Vehicle {
  static var mock: Vehicle {
    return Vehicle(
      id: 1,
      uid: "2a0081d7-affe-406b-b39f-8a7b30e5b262",
      vin: "1HGCM82633A123456",
      makeAndModel: "Honda Accord",
      color: "Blue",
      transmission: "Automatic",
      driveType: "4x4",
      fuelType: "Gasoline",
      carType: "Sedan",
      carOptions: ["Cruise Control", "A/C", "Navigation System"],
      specs: ["LED Headlights", "All-Wheel Drive", "Heated Seats"],
      doors: 4,
      mileage: 30000,
      kilometrage: 48280,
      licensePlate: "ABC-1234"
    )
  }
}

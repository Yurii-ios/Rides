import Foundation

struct Vehicle: Identifiable, Codable, Hashable {
  let id: Int
  let uid: String
  let vin: String
  let makeAndModel: String
  let color: String
  let transmission: String
  let driveType: String
  let fuelType: String
  let carType: String
  let carOptions: [String]
  let specs: [String]
  let doors: Int
  let mileage: Int
  let kilometrage: Int
  let licensePlate: String
  
  /// A list of keys used for encoding and decoding the model's properties.
  /// This is used to map the model's properties to JSON keys.
  enum CodingKeys: String, CodingKey {
    case id, uid, vin, color, transmission, doors, mileage, kilometrage
    case makeAndModel = "make_and_model"
    case driveType = "drive_type"
    case fuelType = "fuel_type"
    case carType = "car_type"
    case carOptions = "car_options"
    case specs = "specs"
    case licensePlate = "license_plate"
  }
}

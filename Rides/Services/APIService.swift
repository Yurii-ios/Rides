import Foundation

protocol APIServiceProtocol {
  // Function to fetch a specified number of vehicles asynchronously.
  // - Parameter count: The number of vehicles to fetch.
  // - Returns: An array of Vehicle objects.
  func fetchVehicles(count: Int) async throws -> [Vehicle]
}

class APIService: APIServiceProtocol {
  func fetchVehicles(count: Int) async throws -> [Vehicle] {
    // Construct the URL for the API endpoint, using the count parameter for the query string.
    guard let url = URL(string: "https://random-data-api.com/api/vehicle/random_vehicle?size=\(count)") else {
      throw URLError(.badURL)
    }
    // Asynchronously perform the data task to retrieve data from the URL.
    let (data, _) = try await URLSession.shared.data(from: url)

    // Decode the JSON response data into an array of Vehicle objects and return it.
    return try JSONDecoder().decode([Vehicle].self, from: data)
  }
}

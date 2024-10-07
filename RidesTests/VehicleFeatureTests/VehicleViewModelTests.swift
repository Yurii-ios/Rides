import XCTest
@testable import Rides

@MainActor
class VehicleViewModelTests: XCTestCase {

  var viewModel: VehicleListViewModel!

  override func setUp() {
    super.setUp()
    viewModel = VehicleListViewModel()
  }

  func testValidateCountShouldBeSuccess() {
    XCTAssertTrue(viewModel.validateCount("10"))
    XCTAssertTrue(viewModel.validateCount("99"))
  }

  func testValidateCountShouldBeFail() {
    XCTAssertFalse(viewModel.validateCount("0"))
    XCTAssertFalse(viewModel.validateCount("101"))
    XCTAssertFalse(viewModel.validateCount("abc"))
  }
}

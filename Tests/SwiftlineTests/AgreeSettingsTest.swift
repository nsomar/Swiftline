import Foundation
import XCTest
@testable import Swiftline


class AgreeSettingsTest: XCTestCase {
  let settings = AgreeSettings(prompt: "The Prompt is")

  //  it("accepts Yes, yes, Y, y")
  func testItAcceptsYes() {
    XCTAssertEqual(settings.invalidItemMessage("Yes"), nil)
    XCTAssertEqual(settings.invalidItemMessage("Y"), nil)
    XCTAssertEqual(settings.invalidItemMessage("yes"), nil)
    XCTAssertEqual(settings.invalidItemMessage("y"), nil)
  }

  func testItAcceptsNo() {
    XCTAssertEqual(settings.invalidItemMessage("No"), nil)
    XCTAssertEqual(settings.invalidItemMessage("N"), nil)
    XCTAssertEqual(settings.invalidItemMessage("no"), nil)
    XCTAssertEqual(settings.invalidItemMessage("n"), nil)
  }

  //  it("does not accept invalid inputs")
  func testItDoesNotAcceptInvalidInputs() {
    XCTAssertNotEqual(settings.invalidItemMessage("www"), nil)
    XCTAssertNotEqual(settings.invalidItemMessage(""), nil)
  }

  //  it("retunrs the same item as valid item")
  func testItReturnsTheSameItemAsValidItem() {
    XCTAssertEqual(settings.validatedItem(forString: "No"), "No")
    XCTAssertEqual(settings.validatedItem(forString: "Yes"), "Yes")
  }

  //  it("validates Yes, yes, Y, y as true")
  func testItValidatesYesAsTrue() {
    XCTAssertEqual(settings.isPositive("Yes"), true)
    XCTAssertEqual(settings.isPositive("Y"), true)
    XCTAssertEqual(settings.isPositive("yes"), true)
    XCTAssertEqual(settings.isPositive("y"), true)
  }

  //  it("validates No, no, N, n as negative")
  func testItValidatesNoAsTrue() {
    XCTAssertEqual(settings.isPositive("No"), false)
    XCTAssertEqual(settings.isPositive("N"), false)
    XCTAssertEqual(settings.isPositive("no"), false)
    XCTAssertEqual(settings.isPositive("n"), false)
  }

  //  it("retunrs correct invalid message prompt")
  func testReturnsCorrectInvalidMessage() {
    let invalid = settings.invalidItemMessage("")
    XCTAssertEqual(invalid, "Please enter \"yes\" or \"no\".")
  }

  //  it("retunrs correct prompt new message prompt")
  func testReturnsCorrectPromptMessage() {
    let invalid = settings.newItemPromptMessage()
    XCTAssertEqual(invalid, "The Prompt is  ")
  }
  
}

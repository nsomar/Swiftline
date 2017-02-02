import Foundation
import XCTest
@testable import Swiftline


class AgreeTest: XCTestCase {

  var promptPrinter: DummyPromptPrinter!

  override func setUp() {
    promptPrinter = DummyPromptPrinter()
    PromptSettings.printer = promptPrinter
  }

  // it("returns true if yes is passed")
  func testItReturnsTrueIfYesIsPassed() {
    PromptSettings.reader = DummyPromptReader(toReturn:  "Yes")

    let ret = agree("Are you a test?")

    XCTAssertEqual(ret, true)
    XCTAssertEqual(promptPrinter.printed, "Are you a test?  ")
  }

  // it("returns true if n is passed")
  func testItReturnsTrueIfNoIsPassed() {
    PromptSettings.reader = DummyPromptReader(toReturn:  "n")

    let ret = agree("Are you a test?")

    XCTAssertEqual(ret, false)
    XCTAssertEqual(promptPrinter.printed, "Are you a test?  ")
  }

  // it("keeps asking if wrong parameter are passed")
  func testItKeepsAskingIfWrongIsPassed() {
    PromptSettings.reader = DummyPromptReader(toReturn: "a", "n")

    let ret = agree("Are you a test?")

    XCTAssertEqual(ret, false)
    let prompts = "Are you a test?  Please enter \"yes\" or \"no\".\nAre you a test?  "
    XCTAssertEqual(promptPrinter.printed, prompts)
  }

}

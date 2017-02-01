//
//  CommandTests.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 05/11/2016.
//
//

import XCTest
@testable import Swiftline

class AskSettingsTests: XCTestCase {

  func testItReturnsTheDefaultStringIfEmpty() {
    let askSettings = AskSettings<String>()
    askSettings.defaultValue = "Def"
    XCTAssertEqual(askSettings.preparedItem(originalString: ""), "Def")
  }

  func testItDoesNotReturnTheDefaultIfStringIsEmpty() {
    let askSettings = AskSettings<String>()
    askSettings.defaultValue = "Def"
    XCTAssertEqual(askSettings.preparedItem(originalString: "asd"), "asd")
  }

  func testItValidatesWithABlock() {
    let askSettings = AskSettings<String>()
    askSettings.addInvalidCase("") { s in return false }
    XCTAssertEqual(askSettings.invalidItemMessage("ss"), nil)

    askSettings.addInvalidCase("") { s in return true }
    XCTAssertNotEqual(askSettings.invalidItemMessage("ss"), nil)
  }

  func testItReturnsCorrectInvalidMessage() {
    let askSettings = AskSettings<String>()
    XCTAssertEqual(askSettings.invalidItemMessage(nil), "You provided an empty message, pelase enter anything!")
  }

  func testItReturnsCorrectInvalidMessageWhenNotValidInt() {
    let askSettings = AskSettings<Int>()
    XCTAssertEqual(askSettings.invalidItemMessage("dd"), "You must enter a valid Integer.")
  }

  func testItReturnsCorrectInvalidPrompt() {
    let askSettings = AskSettings<String>()
    XCTAssertEqual(askSettings.newItemPromptMessage(), "?  ")
  }
  
}

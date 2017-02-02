//
//  CommandTests.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 05/11/2016.
//
//

import XCTest
@testable import Swiftline

class ChooseSettingsTests: XCTestCase {

  var chooseSettings: ChooseSettings<String>!
  override func setUp() {
    chooseSettings = ChooseSettings<String>()
    chooseSettings.addChoice("one") { "one" }
    chooseSettings.addChoice("two") { "two" }
    chooseSettings.addChoice("three") { "three" }
  }

  func testOneTwoThreAsInputs() {
    XCTAssertEqual(chooseSettings.invalidItemMessage("one"), nil)
    XCTAssertEqual(chooseSettings.invalidItemMessage("two"), nil)
    XCTAssertEqual(chooseSettings.invalidItemMessage("three"), nil)
  }

  func test123AsInputs() {
    XCTAssertEqual(chooseSettings.invalidItemMessage("1"), nil)
    XCTAssertEqual(chooseSettings.invalidItemMessage("2"), nil)
    XCTAssertEqual(chooseSettings.invalidItemMessage("3"), nil)
  }


  func testInvalidInputs() {
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("0"), nil)
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("4"), nil)
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("x"), nil)
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("asd"), nil)
  }


  func testReturnsOneAndTowCorrectly() {
    XCTAssertEqual(chooseSettings.validatedItem(forString: "one"), "one")
    XCTAssertEqual(chooseSettings.validatedItem(forString: "2"), "two")
  }

  func testItReturnsTheCorrectInvalidMessage() {
    XCTAssertEqual(chooseSettings.invalidItemMessage(""), "You must choose one of [1, 2, 3, one, two, three].")
  }

  func testItReturnsTheCorrectPromptMessage() {
    XCTAssertEqual(chooseSettings.newItemPromptMessage(), "?  ")
  }

  func testReturns123AsValidChoices() {
    XCTAssertEqual(chooseSettings.validChoices(), ["1", "2", "3", "one", "two", "three"])
  }

  func testItReturnsTheCorrectInitialPrompt() {
    let items = ["1. one", "2. two", "3. three"]
    XCTAssertEqual(chooseSettings.preparePromptItems(), items)
  }

  func testReturnsOnefor1AnTwofor2() {
    XCTAssertEqual(chooseSettings.choiceForInput("1"), "one")
    XCTAssertEqual(chooseSettings.choiceForInput("two"), "two")
  }


  func testItCreatesPromtWithNumbers() {
    let items = ["1. one", "2. two", "3. three"]
    XCTAssertEqual(chooseSettings.preparePromptItems(), items)
  }

  func testItCreatesPromptWithNumbersAndBrackets() {
    let items = ["1)  one", "2)  two", "3)  three"]
    chooseSettings.indexSuffix = ")  "
    XCTAssertEqual(chooseSettings.preparePromptItems(), items)
  }

  func testItCreatesPromptWithLettersAndDash() {
    let items = ["a - one", "b - two", "c - three"]
    chooseSettings.indexSuffix = " - "
    chooseSettings.index = .letters
    XCTAssertEqual(chooseSettings.preparePromptItems(), items)
  }
}

class ChooseSettingsTests2: XCTestCase {

  var chooseSettings: ChooseSettings<Int>!

  override func setUp() {
    chooseSettings = ChooseSettings<Int>()
    chooseSettings.addChoice("one") { 10 }
    chooseSettings.addChoice("two") { 20 }
    chooseSettings.addChoice("three") { 33 }
  }

  func testAcceptsOneTwoThree() {
    XCTAssertEqual(chooseSettings.invalidItemMessage("one"), nil)
  }

  func testAccepts123() {
    XCTAssertEqual(chooseSettings.invalidItemMessage("1"), nil)
  }

  func testInvalidInputs() {
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("0"), nil)
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("4"), nil)
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("x"), nil)
    XCTAssertNotEqual(chooseSettings.invalidItemMessage("asd"), nil)
  }


  func testReturnsOneAndTowCorrectly() {
    XCTAssertEqual(chooseSettings.validatedItem(forString: "one"), 10)
    XCTAssertEqual(chooseSettings.validatedItem(forString: "2"), 20)
  }


  func testItReturnsTheCorrectInvalidMessage() {
    XCTAssertEqual(chooseSettings.invalidItemMessage(""), "You must choose one of [1, 2, 3, one, two, three].")
  }
  func testItReturnsTheCorrectPromptMessage() {
    XCTAssertEqual(chooseSettings.newItemPromptMessage(), "?  ")
  }

  func testReturns123AsValidChoices() {
    XCTAssertEqual(chooseSettings.validChoices(), ["1", "2", "3", "one", "two", "three"])
  }

  func testItReturnsTheCorrectInitialPrompt() {
    let items = ["1. one", "2. two", "3. three"]
    XCTAssertEqual(chooseSettings.preparePromptItems(), items)
  }

  func testReturnsOnefor1AnTwofor2() {
    XCTAssertEqual(chooseSettings.choiceForInput("1"), 10)
    XCTAssertEqual(chooseSettings.choiceForInput("two"), 20)
  }
  
}

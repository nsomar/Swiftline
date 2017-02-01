//
//  CommandTests.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 05/11/2016.
//
//

import XCTest
@testable import Swiftline

class ChooseTests: XCTestCase {

  var promptPrinter: DummyPromptPrinter!

  override func setUp() {
    promptPrinter = DummyPromptPrinter()
    PromptSettings.printer = promptPrinter
  }

  func testPrintsPromtWithChoices() {
    PromptSettings.reader = DummyPromptReader(toReturn: "1")
    choose("Select one of  ", choices:  "one", "two", "three")

    let prompt = [
      "1. one",
      "2. two",
      "3. three",
      "Select one of  "].joined(separator: "\n")
    XCTAssertEqual(promptPrinter.printed, prompt)
  }

  func testReturnsTheSelectedChoiseFor1() {
    PromptSettings.reader = DummyPromptReader(toReturn: "1")
    let choice = choose("Select one of", choices:  "one", "two", "three")
    XCTAssertEqual(choice, "one")
  }

  func testReturnsTheSelectedChoiseFor2() {
    PromptSettings.reader = DummyPromptReader(toReturn: "2")
    let choice = choose("Select one of", choices:  "one", "two", "three")
    XCTAssertEqual(choice, "two")
  }

  func testKeepsPromptingIfIncorrectAnswer() {
    PromptSettings.reader = DummyPromptReader(toReturn: "x", "y", "three")
    let choice = choose("Select one of  ", choices:  "one", "two", "three")

    let prompt = [
      "1. one\n",
      "2. two\n",
      "3. three\n",
      "Select one of  ",
      "You must choose one of [1, 2, 3, one, two, three].\n?  ",
      "You must choose one of [1, 2, 3, one, two, three].\n?  "].joined(separator: "")
    XCTAssertEqual(promptPrinter.printed, prompt)
    XCTAssertEqual(choice, "three")
  }

  func testDisplaysTheChoicesWithBlock() {
    PromptSettings.reader = DummyPromptReader(toReturn: "1")
    let choice = choose("Select one of  ", type: Double.self) {
      $0.addChoice("one") { 10 }
      $0.addChoice("two") { 20 }
      $0.addChoice("three") { 30 }
    }

    let prompt = [
      "1. one",
      "2. two",
      "3. three",
      "Select one of  "].joined(separator: "\n")
    XCTAssertEqual(promptPrinter.printed, prompt)
    XCTAssertEqual(choice, 10)
  }

  func testItDisplaysTheChoicesWithBlockWhenSelectingTheSecondChoice() {
    PromptSettings.reader = DummyPromptReader(toReturn: "two")
    let choice = choose("Select one of  ", type: Double.self) {
      $0.addChoice("one") { 10 }
      $0.addChoice("two", "three") { 20 }
    }

    let prompt = [
      "1. one",
      "2. two",
      "3. three",
      "Select one of  "].joined(separator: "\n")
    XCTAssertEqual(promptPrinter.printed, prompt)
    XCTAssertEqual(choice, 20)
  }

  func testItDisplaysTheChoicesWithBlockWhenSelectingTheThirdChoice() {
    PromptSettings.reader = DummyPromptReader(toReturn: "3")
    let choice = choose("Select one of  ", type: Double.self) {
      $0.addChoice("one") { 10 }
      $0.addChoice("two", "three") { 20 }
    }

    let prompt = [
      "1. one",
      "2. two",
      "3. three",
      "Select one of  "].joined(separator: "\n")
    XCTAssertEqual(promptPrinter.printed, prompt)
    XCTAssertEqual(choice, 20)
  }

  func testItCreatesAChoiceWithOnlyABlock() {
    PromptSettings.reader = DummyPromptReader(toReturn: "3")
    let choice: Int = choose {
      $0.promptQuestion = "Select one of  "
      $0.addChoice("one") { 10 }
      $0.addChoice("two", "three") { 20 }
    }

    let prompt = [
      "1. one",
      "2. two",
      "3. three",
      "Select one of  "].joined(separator: "\n")
    XCTAssertEqual(promptPrinter.printed, prompt)
    XCTAssertEqual(choice, 20)
  }

  func testItCreatesAChoiceWithOnlyABlockAndAType() {
    PromptSettings.reader = DummyPromptReader(toReturn: "3")
    let choice = choose(Int.self) {
      $0.promptQuestion = "Select one of  "
      $0.addChoice("one") { 10 }
      $0.addChoice("two", "three") { 20 }
    }

    let prompt = [
      "1. one",
      "2. two",
      "3. three",
      "Select one of  "].joined(separator: "\n")
    XCTAssertEqual(promptPrinter.printed, prompt)
    XCTAssertEqual(choice, 20)
  }

}

//
//  CommandTests.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 05/11/2016.
//
//

import XCTest
@testable import Swiftline

class ArgsTests: XCTestCase {

  func testItReturnsCorrectNumberOfArgs() {
    XCTAssertEqual(Args.all.count > 0, true)
  }

  func testItCreatesAHashFromArgs() {
    let args = ["excutable_name", "-f", "file.rb", "--integer", "1", "Some custom one", "one", "two", "--no-ff"]
    let res = Args.parse(argumens: args, cachedResults: nil)

    let result = [
      "f": "file.rb",
      "integer": "1",
      "no-ff": ""]

    XCTAssertEqual(res.flags, result)
    XCTAssertEqual(res.parameters, ["Some custom one", "one", "two"])
    XCTAssertEqual(res.command, "excutable_name")
  }

  func testReturnsEmptyArray() {
    let r = ArgsParser.parseFlags([])
    XCTAssertEqual(r.0.count, 0)
    XCTAssertEqual(r.1.count, 0)
  }

  func testReturnsAllLeadingNonFlagParams() {
    let r = ArgsParser.parseFlags(["omar", "hello", "-f", "test", "--help"])
    XCTAssertEqual(r.1, ["omar", "hello"])
  }

  func testReturnaAllTrailingNonFlagParams() {
    let r = ArgsParser.parseFlags(["-f", "test", "--help", "x",  "omar", "hello"])
    XCTAssertEqual(r.1, ["omar", "hello"])
  }

  func testReturnsAllMixedNonFlagParams() {
    let r = ArgsParser.parseFlags(["-f", "test", "omar", "--help", "x", "hello"])
    XCTAssertEqual(r.1, ["omar", "hello"])
  }

  func testReturnAllFlagsIfTheyAreAllSet() {
    let r = ArgsParser.parseFlags(["-f", "test", "omar", "--help", "x", "hello"])

    XCTAssertEqual(r.0[0].argument.name, "f")
    XCTAssertEqual(r.0[0].value, "test")

    XCTAssertEqual(r.0[1].argument.name, "help")
    XCTAssertEqual(r.0[1].value, "x")
  }

  func testReturnAllFlagsIfSomeAreNotSet() {
    let r = ArgsParser.parseFlags(["-f", "-w", "omar", "--help", "x", "hello"])

    XCTAssertEqual(r.0[0].argument.name, "f")
    XCTAssertEqual(r.0[0].value, nil)

    XCTAssertEqual(r.0[1].argument.name, "w")
    XCTAssertEqual(r.0[1].value, "omar")

    XCTAssertEqual(r.0[2].argument.name, "help")
    XCTAssertEqual(r.0[2].value, "x")
  }

  func testREturnsComplesFalg() {
    let r = ArgsParser.parseFlags(["one", "-f", "-w", "omar", "two", "--help", "x", "hello"])

    XCTAssertEqual(r.1, ["one", "two", "hello"])

    XCTAssertEqual(r.0[0].argument.name, "f")
    XCTAssertEqual(r.0[0].value, nil)

    XCTAssertEqual(r.0[1].argument.name, "w")
    XCTAssertEqual(r.0[1].value, "omar")

    XCTAssertEqual(r.0[2].argument.name, "help")
    XCTAssertEqual(r.0[2].value, "x")
  }

  func testStopsParsingFlagsWhitTerminator() {
    let r = ArgsParser.parseFlags(["one", "-f", "-w", "omar", "two", "--", "--help", "x", "hello"])

    XCTAssertEqual(r.0[0].argument.name, "f")
    XCTAssertEqual(r.0[0].value, nil)

    XCTAssertEqual(r.0[1].argument.name, "w")
    XCTAssertEqual(r.0[1].value, "omar")
  }

  func testITKnowsTheArgTypeOfString() {
    XCTAssertEqual(Argument.ArgumentType("-f"), Argument.ArgumentType.shortFlag)
    XCTAssertEqual(Argument.ArgumentType("--force"), Argument.ArgumentType.longFlag)
    XCTAssertEqual(Argument.ArgumentType("--no-repo-update"), Argument.ArgumentType.longFlag)
    XCTAssertEqual(Argument.ArgumentType("not an arg"), Argument.ArgumentType.notAFlag)
    XCTAssertEqual(Argument.ArgumentType("not-an-arg"), Argument.ArgumentType.notAFlag)

  }

  func testItKnowsAnArgumentFlag() {
    XCTAssertEqual(Argument.ArgumentType.shortFlag.isFlag, true)
    XCTAssertEqual(Argument.ArgumentType.longFlag.isFlag, true)
    XCTAssertEqual(Argument.ArgumentType.notAFlag.isFlag, false)
  }

  func testItNormalizeFlags() {
    XCTAssertEqual(Argument("-f").name, "f")
    XCTAssertEqual(Argument("--force").name, "force")
    XCTAssertEqual(Argument("--no-repo-update").name, "no-repo-update")
    XCTAssertEqual(Argument("not an arg").name, "not an arg")
    XCTAssertEqual(Argument("not-an-arg").name, "not-an-arg")
  }

}

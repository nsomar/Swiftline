//
//  CommandTests.swift
//  Guaka
//
//  Created by Omar Abdelhafith on 05/11/2016.
//
//

import XCTest
@testable import Swiftline

class StringExtensionTests: XCTestCase {

  override func setUp() {
  }

  func testItCanReplaceAString() {
    let str = "Hello World ; BlaBla"
    let toReplace = ";"
    let toReplaceWith = "BBB"
    let expected = "Hello World BBB BlaBla"

    let res = str.replacing(subString: toReplace, withString: toReplaceWith)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringWithSingleCharacter() {
    let str = "Hello World ; BlaBla"
    let toReplace = ";"
    let toReplaceWith = "B"
    let expected = "Hello World B BlaBla"

    let res = str.replacing(subString: toReplace, withString: toReplaceWith)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringWithEmptyString() {
    let str = "Hello World ; BlaBla"
    let toReplace = ";"
    let toReplaceWith = ""
    let expected = "Hello World  BlaBla"

    let res = str.replacing(subString: toReplace, withString: toReplaceWith)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringOnTheBeginning() {
    let str = "; World A BlaBla"
    let toReplace = ";"
    let toReplaceWith = "BBB"
    let expected = "BBB World A BlaBla"

    let res = str.replacing(subString: toReplace, withString: toReplaceWith)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringOnTheEnd() {
    let str = "Hello World A ;"
    let toReplace = ";"
    let toReplaceWith = "BBB"
    let expected = "Hello World A BBB"

    let res = str.replacing(subString: toReplace, withString: toReplaceWith)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringWithMultipleOccurancs() {
    let str = ";Hel;lo ; World A ;"
    let toReplace = ";"
    let toReplaceWith = "BBB"
    let expected = "BBBHelBBBlo BBB World A BBB"

    let res = str.replacing(subString: toReplace, withString: toReplaceWith)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringOfMultiCharacters() {
    let str = "Hello World m;m BlaBla"
    let toReplace = "m;m"
    let toReplaceWith = "BBB"
    let expected = "Hello World BBB BlaBla"

    let res = str.replacing(subString: toReplace, withString: toReplaceWith)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringWithSubrange() {
    let str = ";Hello World ; BlaBla"
    let toReplace = ";"
    let toReplaceWith = "BBB"
    let expected = ";Hello World BBB BlaBla"

    let range = (str.index(str.startIndex, offsetBy: 1)..<str.index(str.endIndex, offsetBy: 0))
    let res = str.replacing(subString: toReplace, withString: toReplaceWith, inRange: range)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringWithSubrangeAtEnd() {
    let str = ";Hello World ; BlaBla;"
    let toReplace = ";"
    let toReplaceWith = "BBB"
    let expected = ";Hello World BBB BlaBla;"

    let range = (str.index(str.startIndex, offsetBy: 1)..<str.index(str.endIndex, offsetBy: -1))
    let res = str.replacing(subString: toReplace, withString: toReplaceWith, inRange: range)

    XCTAssertEqual(res, expected)
  }

  func testItCanReplaceAStringWithSubrangeAtEndWithMultipleOccurances() {
    let str = ";Hello ;World ; BlaBla;"
    let toReplace = ";"
    let toReplaceWith = "BBB"
    let expected = ";Hello BBBWorld BBB BlaBla;"

    let range = (str.index(str.startIndex, offsetBy: 1)..<str.index(str.endIndex, offsetBy: -1))
    let res = str.replacing(subString: toReplace, withString: toReplaceWith, inRange: range)

    XCTAssertEqual(res, expected)
  }
}

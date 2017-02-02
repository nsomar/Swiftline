import Foundation
import XCTest
@testable import Swiftline


class ColorizerTest: XCTestCase {

  func testItReturnsBlackStringForeground() {
    let string  = "the string".f.black
    XCTAssertEqual(string, "\u{001B}[30mthe string\u{001B}[0m")
  }

  func testItReturnsRedStringForeground() {
    let string  = "the string".f.red
    XCTAssertEqual(string, "\u{001B}[31mthe string\u{001B}[0m")
  }

  func testItReturnsGreenStringForeground() {
    let string  = "the string".f.green
    XCTAssertEqual(string, "\u{001B}[32mthe string\u{001B}[0m")
  }

  func testItReturnsYellowStringForeground() {
    let string  = "the string".f.yellow
    XCTAssertEqual(string, "\u{001B}[33mthe string\u{001B}[0m")
  }

  func testItReturnsBlueStringForeground() {
    let string  = "the string".f.blue
    XCTAssertEqual(string, "\u{001B}[34mthe string\u{001B}[0m")
  }

  func testItReturnsMagentaStringForeground() {
    let string  = "the string".f.magenta
    XCTAssertEqual(string, "\u{001B}[35mthe string\u{001B}[0m")
  }

  func testItReturnsCyanStringForeground() {
    let string  = "the string".f.cyan
    XCTAssertEqual(string, "\u{001B}[36mthe string\u{001B}[0m")
  }

  func testItReturnsWhiteStringForeground() {
    let string  = "the string".f.white
    XCTAssertEqual(string, "\u{001B}[37mthe string\u{001B}[0m")
  }

  func testItReturnsBlackStringBackground() {
    let string  = "the string".b.black
    XCTAssertEqual(string, "\u{001B}[40mthe string\u{001B}[0m")
  }

  func testItReturnsRedStringBackground() {
    let string  = "the string".b.red
    XCTAssertEqual(string, "\u{001B}[41mthe string\u{001B}[0m")
  }

  func testItReturnsGreenStringBackground() {
    let string  = "the string".b.green
    XCTAssertEqual(string, "\u{001B}[42mthe string\u{001B}[0m")
  }

  func testItReturnsYellowStringBackground() {
    let string  = "the string".b.yellow
    XCTAssertEqual(string, "\u{001B}[43mthe string\u{001B}[0m")
  }

  func testItReturnsBlueStringBackground() {
    let string  = "the string".b.blue
    XCTAssertEqual(string, "\u{001B}[44mthe string\u{001B}[0m")
  }

  func testItReturnsMagentaStringBackground() {
    let string  = "the string".b.magenta
    XCTAssertEqual(string, "\u{001B}[45mthe string\u{001B}[0m")
  }

  func testItReturnsCyanStringBackground() {
    let string  = "the string".b.cyan
    XCTAssertEqual(string, "\u{001B}[46mthe string\u{001B}[0m")
  }

  func testItReturnsWhiteStringBackground() {
    let string  = "the string".b.white
    XCTAssertEqual(string, "\u{001B}[47mthe string\u{001B}[0m")
  }

  func testItReturnsABoldString() {
    let string  = "the string".s.bold
    XCTAssertEqual(string, "\u{001B}[1mthe string\u{001B}[0m")
  }

  func testItReturnsAnItalicString() {
    let string  = "the string".s.italic
    XCTAssertEqual(string, "\u{001B}[3mthe string\u{001B}[0m")
  }

  func testItReturnsAnUnderlineString() {
    let string  = "the string".s.underline
    XCTAssertEqual(string, "\u{001B}[4mthe string\u{001B}[0m")
  }

  func testItReturnsAnInverseString() {
    let string  = "the string".s.inverse
    XCTAssertEqual(string, "\u{001B}[7mthe string\u{001B}[0m")
  }

  func testItReturnsAStrickThroughString() {
    let string  = "the string".s.strikethrough
    XCTAssertEqual(string, "\u{001B}[9mthe string\u{001B}[0m")
  }

  func testItReturnsABoldOffString() {
    let string  = "the string".s.boldOff
    XCTAssertEqual(string, "\u{001B}[22mthe string\u{001B}[0m")
  }

  func testItReturnsAnItalicOffString() {
    let string  = "the string".s.italicOff
    XCTAssertEqual(string, "\u{001B}[23mthe string\u{001B}[0m")
  }

  func testItReturnsAnUnderlineOffString() {
    let string  = "the string".s.underlineOff
    XCTAssertEqual(string, "\u{001B}[24mthe string\u{001B}[0m")
  }

  func testItReturnsAnInverseOffString() {
    let string  = "the string".s.inverseOff
    XCTAssertEqual(string, "\u{001B}[27mthe string\u{001B}[0m")
  }

  func testItReturnsAStrickThroughOffString() {
    let string  = "the string".s.strikethroughOff
    XCTAssertEqual(string, "\u{001B}[29mthe string\u{001B}[0m")
  }

  func testItReturnsAResetString() {
    let string  = "the string".s.reset
    XCTAssertEqual(string, "\u{001B}[0mthe string\u{001B}[0m")
  }

  func testItReturnsAStringWithMultipleStyles() {
    let string  = "the string".s.bold.f.red.b.white
    XCTAssertEqual(string, "\u{001B}[47;31;1mthe string\u{001B}[0m")
  }
}

import Foundation
import Quick
import Nimble
@testable import Swiftline


class ColorizerTest: QuickSpec {
    override func spec() {        
        
        describe("Foreground Extension") {
            
            it("returns a black string") {
                let string  = "the string".f.Black
                expect(string).to(equal("\u{001B}[30mthe string\u{001B}[0m"))
            }
            
            it("returns a red string") {
                let string  = "the string".f.Red
                expect(string).to(equal("\u{001B}[31mthe string\u{001B}[0m"))
            }
            
            it("returns a green string") {
                let string  = "the string".f.Green
                expect(string).to(equal("\u{001B}[32mthe string\u{001B}[0m"))
            }
            
            it("returns a yellow string") {
                let string  = "the string".f.Yellow
                expect(string).to(equal("\u{001B}[33mthe string\u{001B}[0m"))
            }
            
            it("returns a blue string") {
                let string  = "the string".f.Blue
                expect(string).to(equal("\u{001B}[34mthe string\u{001B}[0m"))
            }
            
            it("returns a magenta string") {
                let string  = "the string".f.Magenta
                expect(string).to(equal("\u{001B}[35mthe string\u{001B}[0m"))
            }
            
            it("returns a cyan string") {
                let string  = "the string".f.Cyan
                expect(string).to(equal("\u{001B}[36mthe string\u{001B}[0m"))
            }
            
            it("returns a white string") {
                let string  = "the string".f.White
                expect(string).to(equal("\u{001B}[37mthe string\u{001B}[0m"))
            }
            
        }
        
        describe("Background Extension") {
            
            it("returns a black string") {
                let string  = "the string".b.Black
                expect(string).to(equal("\u{001B}[40mthe string\u{001B}[0m"))
            }
            
            it("returns a red string") {
                let string  = "the string".b.Red
                expect(string).to(equal("\u{001B}[41mthe string\u{001B}[0m"))
            }
            
            it("returns a green string") {
                let string  = "the string".b.Green
                expect(string).to(equal("\u{001B}[42mthe string\u{001B}[0m"))
            }
            
            it("returns a yellow string") {
                let string  = "the string".b.Yellow
                expect(string).to(equal("\u{001B}[43mthe string\u{001B}[0m"))
            }
            
            it("returns a blue string") {
                let string  = "the string".b.Blue
                expect(string).to(equal("\u{001B}[44mthe string\u{001B}[0m"))
            }
            
            it("returns a magenta string") {
                let string  = "the string".b.Magenta
                expect(string).to(equal("\u{001B}[45mthe string\u{001B}[0m"))
            }
            
            it("returns a cyan string") {
                let string  = "the string".b.Cyan
                expect(string).to(equal("\u{001B}[46mthe string\u{001B}[0m"))
            }
            
            it("returns a white string") {
                let string  = "the string".b.White
                expect(string).to(equal("\u{001B}[47mthe string\u{001B}[0m"))
            }
            
        }
        
        describe("Style Extension") {
            
            it("returns a bold string") {
                let string  = "the string".s.Bold
                expect(string).to(equal("\u{001B}[1mthe string\u{001B}[0m"))
            }
            
            it("returns an italic string") {
                let string  = "the string".s.Italic
                expect(string).to(equal("\u{001B}[3mthe string\u{001B}[0m"))
            }
            
            it("returns an underline string") {
                let string  = "the string".s.Underline
                expect(string).to(equal("\u{001B}[4mthe string\u{001B}[0m"))
            }
            
            it("returns an inverse string") {
                let string  = "the string".s.Inverse
                expect(string).to(equal("\u{001B}[7mthe string\u{001B}[0m"))
            }
            
            it("returns a strikethrough string") {
                let string  = "the string".s.Strikethrough
                expect(string).to(equal("\u{001B}[9mthe string\u{001B}[0m"))
            }
            
            it("returns a boldoff string") {
                let string  = "the string".s.BoldOff
                expect(string).to(equal("\u{001B}[22mthe string\u{001B}[0m"))
            }
            
            it("returns an italic off string") {
                let string  = "the string".s.ItalicOff
                expect(string).to(equal("\u{001B}[23mthe string\u{001B}[0m"))
            }
            
            it("returns an underline off string") {
                let string  = "the string".s.UnderlineOff
                expect(string).to(equal("\u{001B}[24mthe string\u{001B}[0m"))
            }
            
            it("returns an inverse off string") {
                let string  = "the string".s.InverseOff
                expect(string).to(equal("\u{001B}[27mthe string\u{001B}[0m"))
            }
            
            it("returns a strikethrough off string") {
                let string  = "the string".s.StrikethroughOff
                expect(string).to(equal("\u{001B}[29mthe string\u{001B}[0m"))
            }
            
            it("returns a reset style string") {
                let string  = "the string".s.Reset
                expect(string).to(equal("\u{001B}[0mthe string\u{001B}[0m"))
            }
            
        }
        
        describe("Mixing Styles Extension") {
            
            it("returns a bold red with white foreground string ") {
                let string  = "the string".s.Bold.f.Red.b.White
                
                expect(string).to(equal("\u{001B}[47;31;1mthe string\u{001B}[0m"))
            }
        }
        
    }
}

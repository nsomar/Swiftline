import Foundation
import Quick
import Nimble
@testable import Swiftline


class AskerTest: QuickSpec {
    override func spec() {
        
        var promptPrinter: DummyPromptPrinter!
        
        beforeEach {
            promptPrinter = DummyPromptPrinter()
            PromptSettings.printer = promptPrinter
        }
        
        it("reads a string from the stdin") {
            PromptSettings.reader = DummyPromptReader(toReturn: "A String")
            let res = ask("Enter a string")
            
            expect(res).to(equal("A String"))
            expect(promptPrinter.printed).to(equal("Enter a string\n"))
        }
        
        it("reads an Int from the stdin") {
            PromptSettings.reader = DummyPromptReader(toReturn: "1")
            let res = ask("Enter a string", type: Int.self)
            
            expect(res).to(equal(1))
            expect(promptPrinter.printed).to(equal("Enter a string\n"))
        }
        
        it("keeps asking if entered is not an int") {
            PromptSettings.reader = DummyPromptReader(toReturn: "x", "y", "1")
            
            let res = ask("Enter a string", type: Int.self)
            
            let prompt = ["Enter a string",
                "You must enter a valid Integer.",
                "?  You must enter a valid Integer.",
                "?  "].joined(separator: "\n")
            
            expect(res).to(equal(1))
            expect(promptPrinter.printed).to(equal(prompt))
        }
        
        it("reads an double from the stdin") {
            PromptSettings.reader = DummyPromptReader(toReturn: "1")
            let res = ask("Enter a string", type: Double.self)
            
            expect(res).to(equal(1.0))
            expect(promptPrinter.printed).to(equal("Enter a string\n"))
        }
        
        it("keeps asking if validation is false") {
            PromptSettings.reader = DummyPromptReader(toReturn: "1", "2", "3")
            let res = ask("Enter a string") { s in
                s.addInvalidCase("Invalid string") { $0 != "3" }
            }
            
            expect(res).to(equal("3"))
            
            let prompt = ["Enter a string",
                "Invalid string",
                "?  Invalid string\n?  "].joined(separator: "\n")
            
            expect(promptPrinter.printed).to(equal(prompt))
        }
        
        it("ask for confirmation") {
            PromptSettings.reader = DummyPromptReader(toReturn: "val", "Y")
            let res = ask("Enter a string") { $0.confirm = true }
            
            expect(res).to(equal("val"))
            expect(promptPrinter.printed).to(equal("Enter a string\nAre you sure?  "))
        }
        
        it("ask for confirmation, if no is passed it keeps asking") {
            PromptSettings.reader = DummyPromptReader(toReturn: "val", "N", "other val", "y")
            let res = ask("Enter a string") { $0.confirm = true }
            
            expect(res).to(equal("other val"))
            
            let prompt = ["Enter a string",
                "Are you sure?  ?  Are you sure?  "].joined(separator: "\n")
            
            expect(promptPrinter.printed).to(equal(prompt))
        }
        
        it("ask for confirmation, and validates input, if no is passed it keeps asking") {
            
            PromptSettings.reader = DummyPromptReader(toReturn: "1", "n", "10", "9", "yes")
            
            let res = ask("Age?", type: Int.self) {
                $0.confirm = true
                $0.addInvalidCase("Age not correct") { $0 == 10 }
            }
            
            expect(res).to(equal(9))
            
            let prompt = ["Age?",
                "Are you sure?  ?  Age not correct",
                "?  Are you sure?  "
                ].joined(separator: "\n")
            
            expect(promptPrinter.printed).to(equal(prompt))
        }
        
    }
}

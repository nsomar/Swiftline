import Foundation
import Quick
import Nimble
@testable import Swiftline


class AgreeTest: QuickSpec {
    override func spec() {
        
        var promptPrinter: DummyPromptPrinter!
        
        beforeEach {
            promptPrinter = DummyPromptPrinter()
            PromptSettings.printer = promptPrinter
        }
        
        it("returns true if yes is passed") {
            PromptSettings.reader = DummyPromptReader(toReturn:  "Yes")
            
            let ret = agree("Are you a test?")
            
            expect(ret).to(equal(true))
            expect(promptPrinter.printed).to(equal("Are you a test?  "))
        }
        
        it("returns true if n is passed") {
            PromptSettings.reader = DummyPromptReader(toReturn:  "n")
            
            let ret = agree("Are you a test?")
            
            expect(ret).to(equal(false))
            expect(promptPrinter.printed).to(equal("Are you a test?  "))
        }
        
        it("keeps asking if wrong parameter are passed") {
            PromptSettings.reader = DummyPromptReader(toReturn: "a", "n")
            
            let ret = agree("Are you a test?")
            
            expect(ret).to(equal(false))
            let prompts = "Are you a test?  Please enter \"yes\" or \"no\".\nAre you a test?  "
            expect(promptPrinter.printed).to(equal(prompts))
        }
    }
}

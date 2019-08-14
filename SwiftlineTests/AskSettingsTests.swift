import Foundation
import Quick
import Nimble
@testable import Swiftline


class AskSettingsTests: QuickSpec {
    override func spec() {
        
        describe("AskerSettings") {
            
            it("returns the default if string is empty") {
                let askSettings = AskSettings<String>()
                askSettings.defaultValue = "Def"
                expect(askSettings.preparedItem(originalString: "")).to(equal("Def"))
            }
            
            it("does not return the default if string is empty") {
                let askSettings = AskSettings<String>()
                askSettings.defaultValue = "Def"
                expect(askSettings.preparedItem(originalString: "asd")).to(equal("asd"))
            }
        }
        
        describe("AskerValidation") {
            
            it("validates with a block") {
                let askSettings = AskSettings<String>()
                askSettings.addInvalidCase("") { s in return false }
                expect(askSettings.invalidItemMessage("ss")).to(beNil())

                askSettings.addInvalidCase("") { s in return true }
                expect(askSettings.invalidItemMessage("ss")).toNot(beNil())
            }
            
            it("returns correct invalid message") {
                let askSettings = AskSettings<String>()
                expect(askSettings.invalidItemMessage(nil)).to(equal("You provided an empty message, pelase enter anything!"))
            }
            
            it("returns correct invalid message when not valid int") {
                let askSettings = AskSettings<Int>()
                expect(askSettings.invalidItemMessage("dd")).to(equal("You must enter a valid Integer."))
            }
            
            it("returns correct invalid prompt") {
                let askSettings = AskSettings<String>()
                expect(askSettings.newItemPromptMessage()).to(equal("?  "))
            }
        }
    }
}

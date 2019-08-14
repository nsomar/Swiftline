import Foundation
import Quick
import Nimble
@testable import Swiftline


class AgreeSettingsTest: QuickSpec {
    override func spec() {
        
        let settings = AgreeSettings(prompt: "The Prompt is")
        
        it("accepts Yes, yes, Y, y") {
            expect(settings.invalidItemMessage("Yes")).to(beNil())
            expect(settings.invalidItemMessage("Y")).to(beNil())
            expect(settings.invalidItemMessage("yes")).to(beNil())
            expect(settings.invalidItemMessage("y")).to(beNil())
        }
        
        it("accepts No, no, N, n") {
            expect(settings.invalidItemMessage("No")).to(beNil())
            expect(settings.invalidItemMessage("N")).to(beNil())
            expect(settings.invalidItemMessage("no")).to(beNil())
            expect(settings.invalidItemMessage("n")).to(beNil())
        }
        
        it("does not accept invalid inputs") {
            expect(settings.invalidItemMessage("www")).notTo(beNil())
            expect(settings.invalidItemMessage("")).notTo(beNil())
        }
        
        it("retunrs the same item as valid item") {
            expect(settings.validatedItem(forString: "No")).to(equal("No"))
            expect(settings.validatedItem(forString: "Yes")).to(equal("Yes"))
        }
        
        it("validates Yes, yes, Y, y as true") {
            expect(settings.isPositive("Yes")).to(beTrue())
            expect(settings.isPositive("Y")).to(beTrue())
            expect(settings.isPositive("yes")).to(beTrue())
            expect(settings.isPositive("y")).to(beTrue())
        }
        
        it("validates No, no, N, n as negative") {
            expect(settings.isPositive("No")).to(beFalse())
            expect(settings.isPositive("N")).to(beFalse())
            expect(settings.isPositive("no")).to(beFalse())
            expect(settings.isPositive("n")).to(beFalse())
        }
        
        it("retunrs correct invalid message prompt") {
            let invalid = settings.invalidItemMessage("")
            expect(invalid).to(equal("Please enter \"yes\" or \"no\"."))
        }
        
        it("retunrs correct prompt new message prompt") {
            let invalid = settings.newItemPromptMessage()
            expect(invalid).to(equal("The Prompt is  "))
        }
    }
}
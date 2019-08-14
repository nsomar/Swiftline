import Foundation
import Quick
import Nimble
@testable import Swiftline


class ChooseSettingsTests: QuickSpec {
    override func spec() {
        
        describe("simple choices") {
            var chooseSettings: ChooseSettings<String>!
            
            beforeEach {
                chooseSettings = ChooseSettings<String>()
                chooseSettings.addChoice("one") { "one" }
                chooseSettings.addChoice("two") { "two" }
                chooseSettings.addChoice("three") { "three" }
            }
            
            it("accepts one, two, three as inputs") {
                expect(chooseSettings.invalidItemMessage("one")).to(beNil())
                expect(chooseSettings.invalidItemMessage("two")).to(beNil())
                expect(chooseSettings.invalidItemMessage("three")).to(beNil())
            }
            
            it("accepts 1, 2, 3 as inputs") {
                expect(chooseSettings.invalidItemMessage("1")).to(beNil())
                expect(chooseSettings.invalidItemMessage("2")).to(beNil())
                expect(chooseSettings.invalidItemMessage("3")).to(beNil())
            }
            
            it("does not accept 0, 4, x, asd as inputs") {
                expect(chooseSettings.invalidItemMessage("0")).notTo(beNil())
                expect(chooseSettings.invalidItemMessage("4")).notTo(beNil())
                expect(chooseSettings.invalidItemMessage("x")).notTo(beNil())
                expect(chooseSettings.invalidItemMessage("asd")).notTo(beNil())
            }
            
            it("returns one for 1 and two for 2") {
                expect(chooseSettings.validatedItem(forString: "one")).to(equal("one"))
                expect(chooseSettings.validatedItem(forString: "2")).to(equal("two"))
            }
            
            it("returns the correct invalid message") {
                expect(chooseSettings.invalidItemMessage("")).to(equal("You must choose one of [1, 2, 3, one, two, three]."))
            }
            
            it("returns the correct prompt message") {
                expect(chooseSettings.newItemPromptMessage()).to(equal("?  "))
            }
            
            it("returns 1, 2, 3, one, two, three as valid choices") {
                expect(chooseSettings.validChoices()).to(equal(["1", "2", "3", "one", "two", "three"]))
            }
            
            it("returns the correct prompt message") {
                expect(chooseSettings.newItemPromptMessage()).to(equal("?  "))
            }
            
            it("returns the correct initial prompt message") {
                let items = ["1. one", "2. two", "3. three"]
                expect(chooseSettings.preparePromptItems()).to(equal(items))
            }
            
            it("returns one for 1 and two for 2") {
                expect(chooseSettings.choiceForInput("1")).to(equal("one"))
                expect(chooseSettings.choiceForInput("two")).to(equal("two"))
            }
        }
        
        describe("choice with block") {

            var chooseSettings: ChooseSettings<String>!
            
            beforeEach {
                chooseSettings = ChooseSettings<String>()
                chooseSettings.addChoice("one") { "one" }
                chooseSettings.addChoice("two") { "two" }
                chooseSettings.addChoice("three") { "three" }
            }
            
            it("creates prompt with numbers and .") {
                let items = ["1. one", "2. two", "3. three"]
                expect(chooseSettings.preparePromptItems()).to(equal(items))
            }
            
            it("creates prompt with numbers and )") {
                let items = ["1)  one", "2)  two", "3)  three"]
                chooseSettings.indexSuffix = ")  "
                expect(chooseSettings.preparePromptItems()).to(equal(items))
            }
            
            it("creates prompt with letters and -") {
                let items = ["a - one", "b - two", "c - three"]
                chooseSettings.indexSuffix = " - "
                chooseSettings.index = .letters
                expect(chooseSettings.preparePromptItems()).to(equal(items))
            }
        }
        
        describe("choice with block") {
            
            var chooseSettings: ChooseSettings<Int>!
            
            beforeEach {
                chooseSettings = ChooseSettings<Int>()
                chooseSettings.addChoice("one") { 10 }
                chooseSettings.addChoice("two") { 20 }
                chooseSettings.addChoice("three") { 33 }
            }
            
            it("accepts one, two, three as inputs") {
                expect(chooseSettings.invalidItemMessage("one")).to(beNil())
            }
            
            it("accepts 1, 2, 3 as inputs") {
                expect(chooseSettings.invalidItemMessage("1")).to(beNil())
            }
            
            it("does not accept 0, 4, x, asd as inputs") {
                expect(chooseSettings.invalidItemMessage("0")).notTo(beNil())
                expect(chooseSettings.invalidItemMessage("4")).notTo(beNil())
                expect(chooseSettings.invalidItemMessage("x")).notTo(beNil())
                expect(chooseSettings.invalidItemMessage("asd")).notTo(beNil())
            }
            
            it("returns one for 1 and two for 2") {
                expect(chooseSettings.validatedItem(forString: "one")).to(equal(10))
                expect(chooseSettings.validatedItem(forString: "2")).to(equal(20))
            }
            
            it("returns the correct invalid message") {
                expect(chooseSettings.invalidItemMessage("")).to(equal("You must choose one of [1, 2, 3, one, two, three]."))
            }
            
            it("returns the correct prompt message") {
                expect(chooseSettings.newItemPromptMessage()).to(equal("?  "))
            }
            
            it("returns 1, 2, 3, one, two, three as valid choices") {
                expect(chooseSettings.validChoices()).to(equal(["1", "2", "3", "one", "two", "three"]))
            }
            
            it("returns the correct prompt message") {
                expect(chooseSettings.newItemPromptMessage()).to(equal("?  "))
            }
            
            it("returns the correct initial prompt message") {
                let items = ["1. one", "2. two", "3. three"]
                expect(chooseSettings.preparePromptItems()).to(equal(items))
            }
            
            it("returns one for 1 and two for 2") {
                expect(chooseSettings.choiceForInput("1")).to(equal(10))
                expect(chooseSettings.choiceForInput("two")).to(equal(20))
            }
        }
    }
}

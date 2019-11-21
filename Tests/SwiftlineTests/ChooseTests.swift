import Foundation
import Quick
import Nimble
@testable import Swiftline


class ChooseTests: QuickSpec {
    override func spec() {

        var promptPrinter: DummyPromptPrinter!
        
        beforeEach {
            promptPrinter = DummyPromptPrinter()
            PromptSettings.printer = promptPrinter
        }
        
        it("prints a prompt with choices") {
            PromptSettings.reader = DummyPromptReader(toReturn: "1")
            choose("Select one of  ", choices:  "one", "two", "three")
            
            let prompt = [
                "1. one",
                "2. two",
                "3. three",
                "Select one of  "].joined(separator: "\n")
            expect(promptPrinter.printed).to(equal(prompt))
        }
        
        it("return the selected choice for 1") {
            PromptSettings.reader = DummyPromptReader(toReturn: "1")
            let choice = choose("Select one of", choices:  "one", "two", "three")
            expect(choice).to(equal("one"))
        }
        
        it("return the selected choice for two") {
            PromptSettings.reader = DummyPromptReader(toReturn: "two")
            let choice = choose("Select one of", choices:  "one", "two", "three")
            expect(choice).to(equal("two"))
        }
        
        it("keeps prompting if didnt receive the correct answer") {
            PromptSettings.reader = DummyPromptReader(toReturn: "x", "y", "three")
            let choice = choose("Select one of  ", choices:  "one", "two", "three")
            
            let prompt = [
                "1. one\n",
                "2. two\n",
                "3. three\n",
                "Select one of  ",
                "You must choose one of [1, 2, 3, one, two, three].\n?  ",
                "You must choose one of [1, 2, 3, one, two, three].\n?  "].joined(separator: "")
            expect(promptPrinter.printed).to(equal(prompt))
            expect(choice).to(equal("three"))
        }
        
        it("displays choices with blocks correctly") {
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
            expect(promptPrinter.printed).to(equal(prompt))
            expect(choice).to(equal(10))
        }
        
        it("displays choices with blocks correctly and selecting the second choice") {
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
            expect(promptPrinter.printed).to(equal(prompt))
            expect(choice).to(equal(20))
        }
        
        it("displays choices with blocks correctly and selecting the third choice") {
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
            expect(promptPrinter.printed).to(equal(prompt))
            expect(choice).to(equal(20))
        }
        
        it("creates a choose with only a block") {
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
            expect(promptPrinter.printed).to(equal(prompt))
            expect(choice).to(equal(20))
        }
        
        it("creates a choose with only a block and a type") {
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
            expect(promptPrinter.printed).to(equal(prompt))
            expect(choice).to(equal(20))
        }
        
    }
}

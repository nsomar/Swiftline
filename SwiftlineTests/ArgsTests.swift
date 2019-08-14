import Foundation
import Quick
import Nimble
@testable import Swiftline

class ArgsTests: QuickSpec {
  override func spec() {
    
    describe("Args") {
      
      it("returns the correct number of args passed") {
        expect(Args.all.count).to(beGreaterThan(0))
      }
      
      it("returns the exact argument passed to the app") {
        ProcessInfo.internalProcessInfo = DummyProcessInfo("1", "2", "3")
        expect(Args.all).to(equal(["1", "2", "3"]))
      }
      
      it("creats a hash from passed args") {
        ProcessInfo.internalProcessInfo = DummyProcessInfo("excutable_name", "-f", "file.rb", "--integer", "1", "Some custom one", "one", "two", "--no-ff")
        let result = [
          "f": "file.rb",
          "integer": "1",
          "no-ff": ""]
        
        expect(Args.parsed.flags).to(equal(result))
        expect(Args.parsed.parameters).to(equal(["Some custom one", "one", "two"]))
        expect(Args.parsed.command).to(equal("excutable_name"))
      }
    }
    
    describe("ArgsParser") {
      
      it("returns empty for empty array") {
        let r = ArgsParser.parseFlags([])
        expect(r.0.count).to(equal(0))
        expect(r.1.count).to(equal(0))
      }
      
      it("returns all leading non flag parameters") {
        let r = ArgsParser.parseFlags(["omar", "hello", "-f", "test", "--help"])
        expect(r.1).to(equal(["omar", "hello"]))
      }
      
      
      it("returns all tailling non flag parameters") {
        let r = ArgsParser.parseFlags(["-f", "test", "--help", "x",  "omar", "hello"])
        expect(r.1).to(equal(["omar", "hello"]))
      }
      
      
      it("returns all mixed non flag parameters") {
        let r = ArgsParser.parseFlags(["-f", "test", "omar", "--help", "x", "hello"])
        expect(r.1).to(equal(["omar", "hello"]))
      }
      
      it("returns all flags if they are all set") {
        let r = ArgsParser.parseFlags(["-f", "test", "omar", "--help", "x", "hello"])
        
        expect(r.0[0].argument.name).to(equal("f"))
        expect(r.0[0].value).to(equal("test"))
        
        expect(r.0[1].argument.name).to(equal("help"))
        expect(r.0[1].value).to(equal("x"))
      }
      
      it("returns all flags if some are not set") {
        let r = ArgsParser.parseFlags(["-f", "-w", "omar", "--help", "x", "hello"])
        
        expect(r.0[0].argument.name).to(equal("f"))
        expect(r.0[0].value).to(beNil())
        
        expect(r.0[1].argument.name).to(equal("w"))
        expect(r.0[1].value).to(equal("omar"))
        
        expect(r.0[2].argument.name).to(equal("help"))
        expect(r.0[2].value).to(equal("x"))
      }
      
      it("parses complex flags configuration") {
        let r = ArgsParser.parseFlags(["one", "-f", "-w", "omar", "two", "--help", "x", "hello"])
        
        expect(r.1).to(equal(["one", "two", "hello"]))
        
        expect(r.0[0].argument.name).to(equal("f"))
        expect(r.0[0].value).to(beNil())
        
        expect(r.0[1].argument.name).to(equal("w"))
        expect(r.0[1].value).to(equal("omar"))
        
        expect(r.0[2].argument.name).to(equal("help"))
        expect(r.0[2].value).to(equal("x"))
      }
      
      it("stops parsing flags when -- is found") {
        let r = ArgsParser.parseFlags(["one", "-f", "-w", "omar", "two", "--", "--help", "x", "hello"])
        
        expect(r.1).to(equal(["one", "two", "--help", "x", "hello"]))
        
        expect(r.0[0].argument.name).to(equal("f"))
        expect(r.0[0].value).to(beNil())
        
        expect(r.0[1].argument.name).to(equal("w"))
        expect(r.0[1].value).to(equal("omar"))
      }
    }
    
    describe("Argument") {
      
      it("knows the arg type for a string") {
        expect(Argument.ArgumentType("-f"))
          .to(equal(Argument.ArgumentType.shortFlag))
        
        expect(Argument.ArgumentType("--force"))
          .to(equal(Argument.ArgumentType.longFlag))
        
        expect(Argument.ArgumentType("--no-repo-update"))
          .to(equal(Argument.ArgumentType.longFlag))
        
        expect(Argument.ArgumentType("not an arg"))
          .to(equal(Argument.ArgumentType.notAFlag))
        
        expect(Argument.ArgumentType("not-an-arg"))
          .to(equal(Argument.ArgumentType.notAFlag))
      }
      
      it("knows if an argument is a flag") {
        expect(Argument.ArgumentType.shortFlag.isFlag)
          .to(beTrue())
        
        expect(Argument.ArgumentType.longFlag.isFlag)
          .to(beTrue())
        
        expect(Argument.ArgumentType.notAFlag.isFlag)
          .to(beFalse())
      }
      
      
      it("normalize a flag") {
        expect(Argument("-f").name)
          .to(equal("f"))
        
        expect(Argument("--force").name)
          .to(equal("force"))
        
        expect(Argument("--no-repo-update").name)
          .to(equal("no-repo-update"))
        
        expect(Argument("not an arg").name)
          .to(equal("not an arg"))
        
        expect(Argument("not-an-arg").name)
          .to(equal("not-an-arg"))
      }
      
    }
    
  }
}

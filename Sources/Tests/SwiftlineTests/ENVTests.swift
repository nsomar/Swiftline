import Foundation
import Quick
import Nimble
@testable import Swiftline


class ENVTests: QuickSpec {
  override func spec() {
    
    beforeEach {
      CommandExecutor.currentTaskExecutor = ActualTaskExecutor()
    }
    
    it("returns nil when key does not exists") {
      expect(Env.get("AAAAA"))
        .to(beNil())
    }
    
    it("Reads environment variables") {
      Env.set("SomeKey", "SomeValue")
      expect(Env.get("SomeKey")).to(equal("SomeValue"))
    }
    
    it("clears key when nil is passed") {
      Env.set("SomeKey", "SomeValue")
      expect(Env.get("SomeKey")).to(equal("SomeValue"))
      
      Env.set("SomeKey", nil)
      expect(Env.get("SomeKey")).to(beNil())
    }
    
    it("clears all env vars") {
      Env.set("SomeKey", "SomeValue")
      expect(Env.get("SomeKey")).to(equal("SomeValue"))
      
      Env.clear()
      expect(Env.get("SomeKey")).to(beNil())
    }
    
    it("return all keys") {
      Env.clear()
      Env.set("key1", "value1")
      Env.set("key2", "value2")
      
      expect(Env.keys).to(equal(["key1", "key2"]))
      Env.clear()
      expect(Env.keys.count).to(equal(0))
    }
    
    it("return all values") {
      Env.clear()
      Env.set("key1", "value1")
      Env.set("key2", "value2")
      
      expect(Env.values).to(equal(["value1", "value2"]))
    }
    
    it("checks if key exists") {
      Env.set("key1", "value1")
      expect(Env.hasKey("key1")).to(beTrue())
      
      Env.clear()
      expect(Env.hasKey("key1")).to(beFalse())
    }
    
    it("checks if value exists") {
      Env.set("key1", "value1")
      expect(Env.hasValue("value1")).to(beTrue())
      
      Env.clear()
      expect(Env.hasValue("value1")).to(beFalse())
    }
    
    it("enumerates keys and values") {
      Env.clear()
      Env.set("key1", "value1")
      Env.set("key2", "value2")
      
      Env.eachPair {
        expect(["key1", "key2"]).to(contain($0))
        expect(["value1", "value2"]).to(contain($1))
      }
    }
    
  }
}

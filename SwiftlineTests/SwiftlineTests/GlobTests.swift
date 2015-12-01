import Foundation
import Quick
import Nimble
@testable import Swiftline

class GlobTests: QuickSpec {
    override func spec() {
      
      it("expands globs") {
        let expanded = Glob.expand("\(NSFileManager.defaultManager().currentDirectoryPath)/*")
        expect(expanded.count).to(beGreaterThan(0))
      }

    }
}

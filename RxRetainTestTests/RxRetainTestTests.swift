import XCTest
import Quick
import Nimble
import SpecLeaks
@testable import RxRetainTest


class SomeViewControllerTests: QuickSpec {
    
    override func spec() {
        describe("StrongReferenceLeakViewController") {
            let vc = LeakTest {
                return StrongReferenceLeakViewController()
            }
            it("must leak") {
                expect(vc).to(leak())
            }
        }
        
        describe("NoApparentLeakViewController") {
            let vc = LeakTest {
                return NoApparentLeakViewController()
            }
            it("must leak") {
                expect(vc).to(leak())
            }
        }
        
        describe("WeakReferenceLeakViewController") {
            let vc = LeakTest {
                return NoApparentLeakViewController()
            }
            it("must leak") {
                expect(vc).to(leak())
            }
        }
        
        describe("TakeOneLeakViewController") {
            let vc = LeakTest {
                return NoApparentLeakViewController()
            }
            it("must leak") {
                expect(vc).to(leak())
            }
        }
    }
}

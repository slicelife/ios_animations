import XCTest
import Animations

class AnimationsTests: XCTestCase {

    func testTimeSpec() throws {
        let timeSpec = TimeSpec(start: 0, duration: 1)
        XCTAssert(timeSpec.start == 0)
        XCTAssert(timeSpec.duration == 1)
    }
}

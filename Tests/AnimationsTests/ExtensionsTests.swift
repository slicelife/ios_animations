import XCTest
import Animations

class ExtensionsTests: XCTestCase {

    func testRectCenterPoint() throws {
        let rect = CGRect(x: 0, y: 0, width: 10, height: 10)

        let uut = rect.centerPoint

        XCTAssertEqual(uut.x, 5)
        XCTAssertEqual(uut.y, 5)
    }

    func testPointTranslatedBy() throws {
        let point = CGPoint.zero

        let uut = point.translatedBy(x: 3, y: 3)

        XCTAssertEqual(uut.x, 3)
        XCTAssertEqual(uut.y, 3)
    }

    func testViewSetAnchorCoordinateIsCallable() throws {
        let uut = UIView()
        XCTAssertTrue(uut.setAnchorCoordinate is ((CGPoint) -> ()) )
    }
}

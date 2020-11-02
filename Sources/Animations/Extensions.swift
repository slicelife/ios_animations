#if os(iOS) || os(tvOS)
import UIKit

extension CGRect {
    public var centerPoint: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

extension CGPoint {
    public func translatedBy(x deltaX: CGFloat, y deltaY: CGFloat) -> CGPoint {
        return CGPoint(x: x + deltaX,
                       y: y + deltaY)
    }
}

extension UIView {
    public func setAnchorCoordinate(_ coordinate: CGPoint) {
        var newPoint = CGPoint(x: coordinate.x / bounds.size.width, y: coordinate.y / bounds.size.height)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y)

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x * bounds.size.width

        position.y -= oldPoint.y
        position.y += newPoint.y * bounds.size.height

        layer.position = position
        layer.anchorPoint = newPoint
    }
}
#endif

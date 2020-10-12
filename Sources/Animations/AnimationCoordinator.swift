import UIKit

public typealias PropertyAnimationBlock = () -> Void
public typealias PostAnimationBlock = () -> Void

public class AnimationCoordinator {
    public enum Pace {
        case linear
        case cubic(CGFloat, CGFloat, CGFloat, CGFloat)
        var timingCurveProvider: UITimingCurveProvider {
            switch self {
            case .linear: return UICubicTimingParameters(animationCurve: .linear)
            case let .cubic(x1, y1, x2, y2): return UICubicTimingParameters(controlPoint1: CGPoint(x: x1, y: y1), controlPoint2: CGPoint(x: x2, y: y2))
            }
        }
    }
    private struct Animation {
        let time: TimeInterval
        let duration: TimeInterval
        let pace: UITimingCurveProvider
        let animationBlock: PropertyAnimationBlock
        let completionBlock: PostAnimationBlock?
        var complete: Bool = false
    }
    private var animations = [Animation]()
    public private(set) var duration: TimeInterval = 0.0
    public var complete: Bool { animations.map { $0.complete }.reduce(true, { $0 && $1 }) }
    private var completion: (() -> Void )?

    private func tryToComplete() { if complete { completion?() } }

    required init() { }

    public static var new: Self { Self() }

    public func addPropertyAnimation(at time: TimeInterval = 0.0,
                                     for duration: TimeInterval,
                                     pace: Pace = .linear,
                                     animations: @escaping PropertyAnimationBlock,
                                     completion: PostAnimationBlock? = nil) -> Self {
        self.animations.append(Animation(time: time, duration: duration, pace: pace.timingCurveProvider, animationBlock: animations, completionBlock: completion))
        self.duration = max(self.duration, time + duration)
        return self
    }

    public func start(completion: (() -> Void)? = nil) {
        self.completion = completion
        guard duration > 0 else { return }

        for index in animations.indices {
            let propAnimator = UIViewPropertyAnimator(duration: animations[index].duration, timingParameters: animations[index].pace)
            propAnimator.addAnimations(animations[index].animationBlock)
            propAnimator.addCompletion { _ in
                self.animations[index].completionBlock?()
                self.animations[index].complete = true
                self.tryToComplete()
            }
            propAnimator.startAnimation(afterDelay: animations[index].time)
        }
    }
}

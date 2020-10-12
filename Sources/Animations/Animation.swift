import UIKit

public struct Animation {
    indirect enum Operation {
        case none
        case animation(Animation)
    }
    fileprivate let duration: TimeInterval
    fileprivate let delay: TimeInterval
    fileprivate let options: UIView.AnimationOptions
    fileprivate let animations: () -> Void
    fileprivate var previousAnimation: Operation

    public static func make(duration: TimeInterval,
                            delay: TimeInterval = 0.0,
                            options: UIView.AnimationOptions = [],
                            animations: @escaping () -> Void) -> Self {

        return Animation(duration: duration,
                         delay: delay,
                         options: options,
                         animations: animations,
                         previousAnimation: .none)
    }

    public func then(duration: TimeInterval,
                     delay: TimeInterval = 0.0,
                     options: UIView.AnimationOptions = [],
                     animations: @escaping () -> Void) -> Self {
        return Animation(duration: duration,
                         delay: delay,
                         options: options,
                         animations: animations,
                         previousAnimation: .animation(self))
    }

    public func start(completion: ((Bool) -> Void)? = nil) {
        let executeAnimation = {
            UIView.animate(withDuration: self.duration,
                           delay: self.delay,
                           options: self.options,
                           animations: self.animations,
                           completion: completion)
        }

        if case let .animation(animation) = self.previousAnimation {
            animation.start(completion: { _ in executeAnimation() })
        } else {
            executeAnimation()
        }
    }
}

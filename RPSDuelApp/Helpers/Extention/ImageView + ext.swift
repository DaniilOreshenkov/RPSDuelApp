import UIKit

extension UIImageView {
    func startAnimate() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 0.0
        animation.fromValue = 0.0
        animation.toValue = 1.0
        layer.add(animation, forKey: "alphaAnimation")
    }
}

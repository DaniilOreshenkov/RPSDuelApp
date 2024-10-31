import UIKit

final class CircleLayers: CALayer {
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        bounds = CGRect(origin: CGPoint(x: -(bounds.size.width / 2), y: -(bounds.size.height / 2)), size: bounds.size)
        position = CGPoint(x: (bounds.size.width / 2), y: (bounds.size.height / 2))
        
        setupAppearance()
    }
    
    func startAnimate() {
        animateCircle()
    }
    
    func stopAnimate() {
        backgroundColor = UIColor.clear.cgColor
    }
    
    private func setupAppearance() {
        backgroundColor = UIColor.clear.cgColor
        cornerRadius = bounds.width / 2
    }
    
    private func animateCircle() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.2
        
        bounds.size = CGSize(width: bounds.width, height: bounds.height)
        cornerRadius = self.bounds.width / 2
        
        add(animation, forKey: "bounds.scale")
    }
}

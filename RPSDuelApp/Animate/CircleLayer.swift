import UIKit

class CircleLayer: CALayer {
    
    let checkmark = CheckmarkLayer()
    
    override init() {
        super.init()
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        self.bounds = frame
        
        addSublayer(checkmark)
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimate() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.3
        
        bounds.size = CGSize(width: 30, height: 30)
        cornerRadius = self.bounds.width / 2
        
        add(animation, forKey: "bounds.scale")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.checkmark.startAnimate()
        }
    }
    
    private func setupAppearance() {
        backgroundColor = UIColor.systemGreen.cgColor
        cornerRadius = bounds.width / 2
    }
}

import UIKit

class CheckmarkLayer: CALayer {
    
    var path: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    
    var timer: Timer?
    var progress: CGFloat = 0
    
    override init() {
        super.init()
        
        setupSublayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimate() {
        Timer.scheduledTimer(timeInterval: 0.02,
                             target: self,
                             selector: #selector(self.updateShapeLayer),
                             userInfo: nil,
                             repeats: true)
    }
    
    private func setCheckmarkPath() -> UIBezierPath {
        path = UIBezierPath()
        path.move(to: CGPoint(x: -5, y: 0))
        path.addLine(to: CGPoint(x: -1, y:  +7))
        path.addLine(to: CGPoint(x:  +5, y:  -5))
        return path
    }
    
    private func setCheckmarkShapeLayer() -> CAShapeLayer {
        shapeLayer = CAShapeLayer()
        shapeLayer.path = setCheckmarkPath().cgPath
        shapeLayer.strokeEnd = self.progress
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineCap = .round
        return shapeLayer
    }
    
    private func setupSublayer() {
        addSublayer(setCheckmarkShapeLayer())
    }
    
    @objc func updateShapeLayer() {
        progress += 0.1
        shapeLayer.strokeEnd = progress
        
        if progress >= 1.0 {
            timer?.invalidate()
            timer = nil
        }
    }
}


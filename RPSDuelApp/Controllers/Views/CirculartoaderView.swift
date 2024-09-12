import UIKit

class CircularLoaderView: UIView {
    
    let circularPathLayer = CAShapeLayer()
    let circularRadius: CGFloat = 10
    
    var progress: CGFloat {
        get {
            circularPathLayer.strokeEnd
        }
        
        set {
            if newValue > 1 {
                circularPathLayer.strokeEnd = 1
            } else if newValue < 0 {
                circularPathLayer.strokeEnd = 0
            } else {
                circularPathLayer.strokeEnd = newValue
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circularPathLayer.frame = bounds
        circularPathLayer.path = circularPath().cgPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        progress = 0.3
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        circularPathLayer.frame = bounds
        circularPathLayer.lineWidth = 2
        circularPathLayer.fillColor = UIColor.clear.cgColor
        circularPathLayer.strokeColor = UIColor.orange.cgColor
        
        layer.addSublayer(circularPathLayer)
    }
    
    func circularFrame() -> CGRect {
        var circularFrame = CGRect(x: 0,
                                   y: 0,
                                   width: 2 * circularRadius,
                                   height:  2 * circularRadius)
        let circularPathBounds = circularPathLayer.bounds
        circularFrame.origin.x = circularPathBounds.midX - circularFrame.midX
        circularFrame.origin.y = circularPathBounds.midY - circularFrame.midY
        return circularFrame
    }
    
    func circularPath() -> UIBezierPath {
        UIBezierPath(ovalIn: circularFrame())
    }
}

import UIKit

class CircleTrim: UIView {
    
    let arcsLayer = ArcsLayer()
    let circle = CircleLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(arcsLayer)
//        layer.addSublayer(circle)
        arcsLayer.isHidden = true
        circle.isHidden = true
//        animateViews()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        arcsLayer.bounds = frame
//        animateArc() 
        a1()
        animateViews() 
    }
    
    func a1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.circle.isHidden = false
            self.arcsLayer.isHidden = true
            self.arcsLayer.removeFromSuperlayer()
        }
        animateArc()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateViews() {
        layer.addSublayer(circle)
        self.circle.startAnimate()
    }
    
    func animateArc() {
        arcsLayer.isHidden = false
        arcsLayer.startAnimate()
    }
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat.pi / 180.0
    }
}

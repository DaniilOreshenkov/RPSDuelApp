import UIKit

class ArcsLayer: CALayer {
    
    let arсBig = CALayer()
    let arcSmall = CALayer()
    
    override func layoutSublayers() {
        super.layoutSublayers()
        self.bounds = frame
        setupSublayer()
//        startAnimate()
    }
    
    func startAnimate() {
        animateArcBig()
        animateArcSmall()
    }
    
    func stopAnimate() {
        animateArcBig()
    }
    
    private func setupSublayer() {
        addSublayer(arсBig)
        addSublayer(arcSmall)
        arсBig.addSublayer(setShapeLayer(path: setPath(startAngle: 345.0,
                                                       endAngle: 15.0,
                                                       radius: 2)))
        arcSmall.addSublayer(setShapeLayer(path: setPath(startAngle: 150.0,
                                                         endAngle: 180.0,
                                                         radius: 3)))
    }
    
    
    private func setPath(startAngle: CGFloat, endAngle: CGFloat, radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX,
                                                   y: bounds.midY),
                                radius: bounds.width / radius,
                                startAngle: startAngle.toRadians(),
                                endAngle: endAngle.toRadians(),
                                clockwise: false)
        return path
    }
    
    private func setShapeLayer(path: UIBezierPath) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor(resource: .gray).cgColor
        shapeLayer.strokeEnd = 0.8
        shapeLayer.lineWidth = 4
        return shapeLayer
    }
    
    private func animateArcBig() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = Double.pi * 2 // Полный оборот
        rotationAnimation.duration = 5
//        rotationAnimation.isRemovedOnCompletion = true
        rotationAnimation.repeatCount = .infinity
        
        arсBig.add(rotationAnimation, forKey: "rotation")
        
    }
    
    private func animateArcSmall() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = -CGFloat.pi * 2
        rotationAnimation.duration = 5
//        rotationAnimation.isRemovedOnCompletion = true
        rotationAnimation.repeatCount = .infinity
        
        arcSmall.add(rotationAnimation, forKey: "rotationAnimation")
        
    }
    
}


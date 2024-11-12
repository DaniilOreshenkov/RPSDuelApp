import UIKit

class ArcsLayers: CALayer {
    
    var arсBig = CALayer()
    let arcSmall = CALayer()
    
    override init() {
        super.init()
        
        setupSublayer()
        animateArcBig()
        animateArcSmall()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        bounds = CGRect(origin: CGPoint(x: -(bounds.size.width / 2), y: -(bounds.size.height / 2)), size: bounds.size)
        position = CGPoint(x: (bounds.size.width / 2), y: (bounds.size.height / 2))
        
        setupSublayer()
        animateArcBig()
        animateArcSmall()
    }
    
    
    func startAnimate() {
        arсBig.isHidden = false
        arcSmall.isHidden = false
    }
    
    func stopAnimate() {
        arсBig.isHidden = true
        arcSmall.isHidden = true
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
        let path = UIBezierPath(arcCenter: CGPoint(x: 0,
                                                   y: 0),
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
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.strokeEnd = 0.8
        shapeLayer.lineWidth = 2
        return shapeLayer
    }
    
    private func animateArcBig() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = 5
        rotationAnimation.repeatCount = .infinity
        
        arсBig.add(rotationAnimation, forKey: "rotation")
        
    }
    
    private func animateArcSmall() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = -CGFloat.pi * 2
        rotationAnimation.duration = 5
        rotationAnimation.repeatCount = .infinity
        
        arcSmall.add(rotationAnimation, forKey: "rotationAnimation")
    }
}

//

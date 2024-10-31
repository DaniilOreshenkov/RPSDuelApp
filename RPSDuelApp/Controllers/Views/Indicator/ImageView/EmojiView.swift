import UIKit
import SnapKit

final class EmojiView: UIView {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayouts()
        animateImageView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bounds = CGRect(origin: CGPoint(x: -(bounds.size.width / 2), y: -(bounds.size.height / 2)), size: bounds.size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageView(image: UIImage) {
        imageView.image = image
    }
    
    func startAnimate() {
        imageView.startAnimate()
    }
    
    private func setupViews() {
        addSubview(imageView)
    }
    
    private func setupLayouts() {
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    private func animateImageView()  {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 1.0
        animation.fromValue = 0.0
        animation.toValue = CGFloat.pi / 12.0
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        imageView.layer.add(animation, forKey: "swingAnimation")
    }
}

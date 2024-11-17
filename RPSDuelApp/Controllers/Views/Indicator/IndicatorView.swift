import UIKit

class IndicatorView: UIView {
    private let arcsLayer = ArcsLayers()
    private let circleLayer = CircleLayers()
    private let emojiView = EmojiView()
    private var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupAppearance()
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        setupLayouts()
        arcsLayer.startAnimate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(color: UIColor, image: UIImage) {
        circleLayer.backgroundColor = color.cgColor
        emojiView.setImageView(image: image)
    }
    
    func startAnimate() {
        arcsLayer.startAnimate()
        circleLayer.stopAnimate()
        emojiView.isHidden = true
    }
    
    func stopAnimate() {
        arcsLayer.stopAnimate()
        circleLayer.startAnimate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { [weak self] _ in
            guard let self = self else { return  }
            emojiView.isHidden = false
            emojiView.startAnimate()
        })
    }
    
    private func setupViews() {
        layer.addSublayer(arcsLayer)
        layer.addSublayer(circleLayer)
        addSubview(emojiView)
    }
    
    private func setupLayouts() {
        arcsLayer.bounds = bounds
        circleLayer.bounds = frame
        emojiView.bounds = bounds
    }
    
    private func setupAppearance() {
        emojiView.isHidden = true
    }
}

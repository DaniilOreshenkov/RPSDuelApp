import UIKit
import SnapKit

final class OpponentView: UIView {
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = R.RPSFond.setFont(size: 23)
        return label
    }()
    
    private let cupImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .cup)
        return imageView
    }()
    
    private let opponentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 23)
        return label
    }()
    
    private let indicatorView = IndicatorView()
    
    private var winCount: Int = 0
    
    init() {
        super.init(frame: CGRect.zero)
        indicatorView.bounds = frame
        
        setupViews()
        setupLayouts()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setOpponent(model: OpponentViewModel) {
        nameLabel.text = model.name
        opponentImageView.image = model.image
        counterLabel.text = String(model.counter)
    }
    
    func setIndicatorView(color: UIColor, image: UIImage) {
        indicatorView.set(color: color, image: image)
        indicatorView.set(color: color, image: image)
    }
    
    func performAnAnimation(value: Bool) {
        if value {
            indicatorView.startAnimate()
        } else {
            indicatorView.stopAnimate()
        }
    }
    
    func countingWin() {
        winCount += 1
        counterLabel.text = String(winCount)
    }
    
    func reset() {
        winCount = 0
        counterLabel.text = String(winCount)
    }
    
    private func setupViews() {
        [
            counterLabel,
            cupImageView,
            opponentImageView,
            nameLabel,
            indicatorView
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayouts() {
        counterLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        cupImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(counterLabel).offset(20)
        }
        
        opponentImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(cupImageView).offset(80)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(opponentImageView.snp.trailing).offset(30)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    private func setupAppearance() {
        layer.cornerRadius = 25
        backgroundColor = UIColor(resource: .secondary)
        counterLabel.text = "\(winCount)"
    }
}

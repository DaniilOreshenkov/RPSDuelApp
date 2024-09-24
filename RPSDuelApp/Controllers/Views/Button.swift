import UIKit
import SnapKit

//MARK: - переименовать класс, анимация сделать, марки 

enum RPS: String {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
}

class Button: UIButton {
    
    private let rps: RPS
    
    private let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(value: RPS) {
        self.rps = value
        super.init(frame: CGRect.zero)
        
        setupViews()
        setupLayouts()
        setupAppearance()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(pictureImageView)
    }
    
    private func setupLayouts() {
        pictureImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupAppearance() {
        layer.cornerRadius = 16
        backgroundColor = UIColor(resource: .secondary)
    }
    
    private func setupImage() {
        pictureImageView.image = UIImage(named: rps.rawValue)
    }
}

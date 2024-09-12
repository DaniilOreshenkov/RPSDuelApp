import UIKit
import SnapKit


//MARK: - icon robot, icon user, animation checkmark, 

enum Opponent {
    case user
    case robot
}

class OpponentView: UIView {
    
    // MARK: - Private Properties
    private var winCount: Int = 0
    private let opponent: Opponent
    
    private let counterWinsLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: "Arial", size: 23)
        return label
    }()
    
    private let cupImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .cup)
        return imageView
    }()
    
    private let opponentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .avatar)
        return imageView
    }()
    
    private let nameOpponentLabel: UILabel = {
        let label = UILabel()
        label.text = "User"
        label.font = UIFont(name: "Arial", size: 23)
        return label
    }()
    
    private let checkMarkView = CircleTrim()
    
    // MARK: - Initializers
    
    init(opponent: Opponent) {
        self.opponent = opponent
        super.init(frame: CGRect.zero)
        checkMarkView.bounds = frame
        backgroundColor = UIColor.red
        
        setupViews()
        setupLayouts()
        setupAppearance()
        setupText()
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Puble Methods
    
    func countingWin() {
        winCount += 1
        counterWinsLabel.text = String(winCount)
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        [
            counterWinsLabel,
            cupImageView,
            opponentImageView,
            nameOpponentLabel,
            checkMarkView
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayouts() {
        
        snp.makeConstraints { make in
            make.height.equalTo(87)
        }
        
        counterWinsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        cupImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(counterWinsLabel).offset(20)
        }
        
        opponentImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(cupImageView).offset(80)
        }
        
        nameOpponentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(opponentImageView.snp.trailing).offset(30)
        }
        
        checkMarkView.snp.makeConstraints { make in
            make.centerY.equalTo(60)
            make.trailing.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
        }

        
    }
    
    private func setupAppearance() {
        layer.cornerRadius = 25
        backgroundColor = UIColor(resource: .secondary)
    }
    
    private func setupText() {
        let name = opponent == Opponent.user ? "User" : "Robot"
        nameOpponentLabel.text  = name
    }
    
    private func setupImage() {
        let image = opponent == Opponent.user ? UIImage(resource: .avatar) : UIImage(resource: .robot)
        opponentImageView.image = image
    }
}

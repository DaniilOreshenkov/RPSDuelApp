import UIKit
import SnapKit

final class RPSDuelViewController: UIViewController {
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let robotOpponentView = OpponentView(opponent: .robot)
    private let robotButton = Button(value: .rock)
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 45, weight: .black)
        return label
    }()
    
    private let rockButton = Button(value: .rock)
    private let scissorsButton = Button(value: .scissors)
    private let paperButton = Button(value: .paper)
    private let userOpponentView = OpponentView(opponent: .user)

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(userOpponentView)
        
            
        setupViews()
        setupLayouts()
        setupAppearance()
        setupTarget()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        [
            robotOpponentView,
            robotButton,
            vsLabel,
            rockButton,
            scissorsButton,
            paperButton,
            userOpponentView,
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayouts() {
        
        robotOpponentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        robotButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(vsLabel.snp.top).offset(-30)
            make.height.equalToSuperview().multipliedBy(0.141)
            make.width.equalToSuperview().multipliedBy(0.28)
        }
        
        vsLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        userOpponentView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-70)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        scissorsButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.width.equalToSuperview().multipliedBy(0.28)
            make.height.equalToSuperview().multipliedBy(0.141)
            make.bottom.equalTo(userOpponentView.snp.top).offset(-20)
        }
        
        paperButton.snp.makeConstraints { make in
            make.leading.equalTo(scissorsButton.snp.trailing).offset(16)
            make.width.equalToSuperview().multipliedBy(0.28)
            make.height.equalToSuperview().multipliedBy(0.141)
            make.bottom.equalTo(userOpponentView.snp.top).offset(-20)
        }
        
        rockButton.snp.makeConstraints { make in
            make.leading.equalTo(paperButton.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalToSuperview().multipliedBy(0.28)
            make.height.equalToSuperview().multipliedBy(0.141)
            make.bottom.equalTo(userOpponentView.snp.top).offset(-20)
        }
    }
    
    private func setupAppearance() {
        view.backgroundColor = UIColor(resource: .background)
    }
    
    private func setupTarget() {
        paperButton.addTarget(self, action: #selector(paperDidTap), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(paperDidTap), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(paperDidTap), for: .touchUpInside)
    }
    
    @objc private func paperDidTap() {
        userOpponentView.countingWin()
//        userOpponentView.
    }
}
#Preview(traits: .portrait) {
    RPSDuelViewController()
}

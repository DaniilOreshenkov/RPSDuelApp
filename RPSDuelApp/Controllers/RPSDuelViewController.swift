import UIKit
import SnapKit

final class RPSDuelViewController: UIViewController {
    
    //MARK: - DOTO: настроить констрейны, робот вид, настроить тему светлый и темный, сделать логика побед
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    private let robotOpponentView = OpponentView(opponent: .robot)
    private let robotButton = UserActionButton(value: .rock)
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 45, weight: .black)
        return label
    }()
    
    private let timerView = TimerView()
    private let rockButton = UserActionButton(value: .rock)
    private let scissorsButton = UserActionButton(value: .scissors)
    private let paperButton = UserActionButton(value: .paper)
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
            timerView,
            rockButton,
            scissorsButton,
            paperButton,
            userOpponentView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
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
        
        
        timerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.bottom.equalTo(paperButton.snp.top).offset(-30)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        
        vsLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(timerView.snp.top).offset(-30)
        }
        
        timerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.bottom.equalTo(paperButton.snp.top).offset(-30)
            make.height.equalToSuperview().multipliedBy(0.1)
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

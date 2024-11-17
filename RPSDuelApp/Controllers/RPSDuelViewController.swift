import UIKit
import SnapKit

final class RPSDuelViewController: UIViewController {
    
    // MARK: - Private Properties UI
    private let roundLabel: UILabel = {
        let label = UILabel()
        label.text = R.Localisable.round.value
        label.textAlignment = .left
        label.textColor = .label
        label.font = R.RPSFond.setFont(size: 23)
        return label
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .label
        label.font = R.RPSFond.setFont(size: 23)
        return label
    }()
    
    private let robotOpponentView = OpponentView()
    
    private let robotImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .questionOutlined)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let robotResultView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.borderWidth = 6
        view.layer.cornerRadius = 25
        view.layer.borderColor = UIColor(resource: .gray).cgColor
        view.backgroundColor = UIColor(resource: .secondary)
        return view
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = R.Localisable.vs.value
        label.textAlignment = .center
        label.textColor = .label
        label.font = R.RPSFond.setFont(size: 45)
        return label
    }()
    
    private let gameStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 40
        return view
    }()
    
    private let counterStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        return view
    }()
    
    private let robotStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fill
        view.spacing = 20
        return view
    }()
    
    private let userStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    private let buttonsStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.spacing = 5
        return view
    }()
    
    private let rockButton = BaseButton(value: .rock)
    private let scissorsButton = BaseButton(value: .scissors)
    private let paperButton = BaseButton(value: .paper)
    
    private let userOpponentView = OpponentView()

    // MARK: - Private Properties
    private let user =  OpponentFactory.shared.createOpponent(type: .user)
    private let robot = OpponentFactory.shared.createOpponent(type: .robot)
    private var rounds = 10
    private var currentRoundIndex = 1
    private var answer: R.ResultGame?
    
    private var alertPresent: AlertPresent?
    private var logicGame = GameRepository.shared
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userOpponentView.setOpponent(model: user)
        robotOpponentView.setOpponent(model: robot)
        
        setupViews()
        setupLayouts()
        setupAppearance()
        
        setDelegate()
        setTarget()
    }
    
    // MARK: Setup UI
    
    private func setupViews() {
        robotResultView.addSubview(robotImageView)
        
        [
            gameStackView
        ].forEach {
            view.addSubview($0)
        }
        
        [
            robotStackView,
            userStackView
        ].forEach {
            gameStackView.addArrangedSubview($0)
        }
        
        [
            roundLabel,
            counterLabel
        ].forEach {
            counterStackView.addArrangedSubview($0)
        }
        
        [
            counterStackView,
            robotOpponentView,
            robotResultView,
            vsLabel
        ].forEach {
            robotStackView.addArrangedSubview($0)
        }
        
        [
            buttonsStackView,
            userOpponentView
        ].forEach {
            userStackView.addArrangedSubview($0)
        }
        
        [
            rockButton,
            scissorsButton,
            paperButton
        ].forEach {
            buttonsStackView.addArrangedSubview($0)
        }
    }
    
    private func setupLayouts() {
        gameStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.85)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        
        counterStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        
        robotStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        
        robotResultView.snp.makeConstraints { make in
            make.width.equalTo(robotResultView.snp.height)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        robotOpponentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(gameStackView.snp.height).multipliedBy(0.10)
        }
        
        userStackView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.29)
        }
        
        userOpponentView.snp.makeConstraints { make in
            make.height.equalTo(gameStackView.snp.height).multipliedBy(0.1)
        }
        
        robotImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupLayerImageView(basic: Bool) {
        if basic == true {
            robotImageView.snp.removeConstraints()
            robotImageView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        } else {
            robotImageView.snp.removeConstraints()
            robotImageView.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
                make.horizontalEdges.equalToSuperview()
                make.top.equalToSuperview().offset(16)
            }
        }
    }
    
    private func setupAppearance() {
        view.backgroundColor = UIColor(resource: .background)
        counterLabel.text = "\(currentRoundIndex)/\(rounds)"
    }
    
    private func setDelegate() {
        let alertPresent = AlertPresent()
        alertPresent.delegate = self
        self.alertPresent = alertPresent
    }
    
    private func setTarget() {
        paperButton.addTarget(self, action: #selector(paperDidTap), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(scissorsDidTap), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(rockDidTap), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    private func backToBasics() {
        robotImageView.image = UIImage(resource: .questionOutlined)
        counterLabel.text = "\(currentRoundIndex)/\(rounds)"
        userOpponentView.performAnAnimation(value: true)
        robotOpponentView.performAnAnimation(value: true)
        [
            paperButton,
            scissorsButton,
            rockButton,
        ].forEach {
            $0.backgroundColor = UIColor(resource: .secondary)
            $0.isEnabled = true
        }
    }
    
    private func showNextAlert(completion: (() -> Void)? = nil) {
        guard let answer = answer else { return }
        let alertModel = AlertModel(
            title: R.AlertRound.title.value,
            text: answer.value,
            buttonText: R.AlertRound.button.value) { [weak self] _ in
                guard let self = self else { return }
                backToBasics()
                setupLayerImageView(basic: true)
                completion?()
            }
        alertPresent?.showAlert(model: alertModel)
    }
    
    private func showFinishResultAlert() {        
        let textMessage = String(
            format: R.AlertFinish.message.value,
                                 logicGame.showEndResult(),
                                 logicGame.victoryCount,
                                 logicGame.defeatCount,
                                 logicGame.drawCount
        )
        
        let alertModel = AlertModel(
            title: R.AlertFinish.title.value,
            text: textMessage,
            buttonText: R.AlertFinish.button.value) { [weak self] _ in
                guard let self = self else { return }
                currentRoundIndex = 1
                backToBasics()
                
                logicGame.resetResult()
                robotOpponentView.reset()
                userOpponentView.reset()
            }
        
        alertPresent?.showAlert(model: alertModel)
    }
    
    private func willGetResult() {
        self.paperButton.isEnabled = false
        self.rockButton.isEnabled = false
        self.scissorsButton.isEnabled = false
        
        showNextRoundOrResults()
    }
    
    private func determineWinner(userPlayer: GameOption) {
        let resultRandom = logicGame.randomGameOption()
        answer = logicGame.determineWinner(playerOption: userPlayer, computerOption: resultRandom)
        
        robotImageView.image = UIImage(named: "\(resultRandom)")
        setupLayerImageView(basic: false)
        robotImageView.startAnimate()
        
        switch answer {
        case .victory:
            userOpponentView.countingWin()
            robotOpponentView.setIndicatorView(color: UIColor.systemPink, image: UIImage.defeat)
            userOpponentView.setIndicatorView(color: UIColor.systemGreen, image: UIImage.victory)
        case .defeat:
            robotOpponentView.countingWin()
            robotOpponentView.setIndicatorView(color: UIColor.systemGreen, image: UIImage.victory)
            userOpponentView.setIndicatorView(color: UIColor.systemPink, image: UIImage.defeat)
        case .draw:
            robotOpponentView.setIndicatorView(color: UIColor.purple, image: UIImage.draw)
            userOpponentView.setIndicatorView(color: UIColor.purple, image: UIImage.draw)
        case nil:
            return
        }
    }
    
    private func showNextRoundOrResults() {
        if currentRoundIndex == rounds {
            userOpponentView.performAnAnimation(value: false)
            robotOpponentView.performAnAnimation(value: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.showNextAlert {
                    self.showFinishResultAlert()
                }
            }
        } else {
            currentRoundIndex += 1
            userOpponentView.performAnAnimation(value: false)
            robotOpponentView.performAnAnimation(value: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.showNextAlert()
            }
        }
    }
    
    // MARK: - @objc
    @objc private func paperDidTap() {
        paperButton.backgroundColor = UIColor.purple
        determineWinner(userPlayer: .paper)
        willGetResult()
    }
    
    @objc private func rockDidTap() {
        rockButton.backgroundColor = UIColor.purple
        determineWinner(userPlayer: .rock)
        willGetResult()
    }
    
    @objc private func scissorsDidTap() {
        scissorsButton.backgroundColor = UIColor.purple
        determineWinner(userPlayer: .scissors)
        willGetResult()
    }
}

// MARK: - AlertPresentDelegate
extension RPSDuelViewController: AlertPresentDelegate {
    func didShow(_: AlertPresent, alert: UIViewController) {
        present(alert, animated: true)
    }
}

#Preview(traits: .portrait) {
    RPSDuelViewController()
}

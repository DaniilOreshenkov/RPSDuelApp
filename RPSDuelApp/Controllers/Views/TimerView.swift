import UIKit
import SnapKit

//MARK: - таймер, раунд, настроить шрифт цвет 

class TimerView: UIView {
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:29"
        label.font = UIFont(name: "Arial", size: 32)
        label.textColor = UIColor(resource: .text)
        label.textAlignment = .center
        return label
    }()
    private let roundLabel: UILabel = {
        let label = UILabel()
        label.text = "Round 2"
        label.textColor = UIColor(resource: .text)
        label.font = UIFont(name: "Arial", size: 23)
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayouts()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [
            timerLabel,
            roundLabel,
        ].forEach {
            addSubview($0)
        }
    }
    
    private func setupLayouts() {
        timerLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        roundLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(timerLabel.snp.bottom).offset(10)
        }
    }
    
    private func setupAppearance() {
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor(resource: .secondary).cgColor
    }
}

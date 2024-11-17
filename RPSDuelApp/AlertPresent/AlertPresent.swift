import UIKit

class AlertPresent: AlertPresentProtocol {
    
    weak var delegate: AlertPresentDelegate?
    
    func showAlert(model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.text,
            preferredStyle: .alert
        )
        let button = UIAlertAction(title: model.buttonText, style: .default, handler: model.completion)
        alert.addAction(button)
        delegate?.didShow(self, alert: alert)
    }
}

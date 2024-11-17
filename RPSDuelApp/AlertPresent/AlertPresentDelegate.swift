import UIKit

protocol AlertPresentDelegate: AnyObject {
    func didShow(_: AlertPresent, alert: UIViewController)
}

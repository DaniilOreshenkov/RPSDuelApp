import Foundation
import UIKit

//Resources
enum R {
    enum String {
        static let round = "Round:"
        static let vs = "VS"
        static let userName = "User"
        static let robotName = "Robot"
    }
    
    enum Fond {
        static func setFont(size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size)
        }
    }
    
}

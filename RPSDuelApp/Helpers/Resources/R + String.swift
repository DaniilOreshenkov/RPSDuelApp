import Foundation

extension R {
    enum Localisable: String {
        case round
        case vs
        case userName
        case robotName
        
        var value: Swift.String {
            NSLocalizedString(self.rawValue, comment: "")
        }
    }
    
    enum ResultGame: String {
        case victory
        case defeat
        case draw
        
        var value: Swift.String {
            NSLocalizedString(self.rawValue, comment: "")
        }
    }
    
    enum AlertRound: String {
        case title = "titleRound"
        case button = "buttonTextRound"
        
        var value: Swift.String {
            NSLocalizedString(self.rawValue, comment: "")
        }
    }
    
    enum AlertFinish: String {
        case title = "titleFinish"
        case message = "messageFinish"
        case button = "buttonTextFinish"
        
        var value: Swift.String {
            NSLocalizedString(self.rawValue, comment: "")
        }
    }
}

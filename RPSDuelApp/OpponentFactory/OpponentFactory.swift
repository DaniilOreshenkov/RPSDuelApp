import UIKit

enum OpponentType {
    case user
    case robot
}

final class OpponentFactory: OpponentFactoryProtocol {
    static var shared = OpponentFactory()
    
    private init() {}
    
    private let user = OpponentViewModel(
        counter: 0,
        image: UIImage(resource: .avatar),
        name: R.Localisable.userName.value
    )
    private let robot = OpponentViewModel(
        counter: 0,
        image: UIImage(resource: .robot),
        name: R.Localisable.robotName.value
    )
    
    func createOpponent(type: OpponentType) -> OpponentViewModel {
        switch type {
        case .user:
            return user
        case .robot:
            return robot
        }
    }
}

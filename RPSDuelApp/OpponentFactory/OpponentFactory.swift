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
        name: R.String.userName
    )
    private let robot = OpponentViewModel(
        counter: 0,
        image: UIImage(resource: .robot),
        name: R.String.robotName
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

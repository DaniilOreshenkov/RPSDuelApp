import Foundation

protocol OpponentFactoryProtocol {
    func createOpponent(type: OpponentType) -> OpponentViewModel
}

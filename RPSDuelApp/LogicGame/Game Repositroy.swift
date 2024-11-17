import UIKit

final class GameRepository {
    static let shared = GameRepository()
    
    private init() {}
    
     var victoryCount = 0
     var defeatCount = 0
     var drawCount = 0
    
    func randomGameOption() -> GameOption {
        let random = Int.random(in: 0...2)
        switch random {
        case 0:
            return .rock
        case 1:
            return .scissors
        case 2:
            return .paper
        default:
            assertionFailure("random can be between 0..2")
            return .paper
        }
    }
    
    func determineWinner(playerOption: GameOption, computerOption: GameOption) -> R.ResultGame {
        if playerOption == computerOption {
            drawCount += 1
            return .draw
        } else if (playerOption == .rock && computerOption == .scissors) ||
                  (playerOption == .scissors && computerOption == .paper) ||
                  (playerOption == .paper && computerOption == .rock) {
            victoryCount += 1
            return .victory
        } else {
            defeatCount += 1
            return .defeat
        }
    }
    
    func showEndResult() -> String {
        if victoryCount == defeatCount {
            return R.ResultGame.draw.value
        } else if victoryCount > defeatCount {
            return R.ResultGame.victory.value
        } else {
            return R.ResultGame.defeat.value
        }
    }
    
    func resetResult() {
        victoryCount = 0
        defeatCount = 0
        drawCount = 0
    }
}

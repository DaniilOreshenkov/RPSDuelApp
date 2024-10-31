import UIKit

enum GameOption {
    case rock
    case scissors
    case paper
}

enum ResultGame: String {
    case victory = "Вы победили!"
    case defeat = "Компьютер победили!"
    case draw = "Ничья!"
}

final class LogicGame {
    static let shared = LogicGame()
    
    private init() {}
    
     var victory = 0
     var defeat = 0
     var draw = 0
    
    func randomGameOption() -> GameOption {
        let random = Int.random(in: 0...2)
        switch random {
        case 0:
            return .rock
        case 1:
            return .scissors
        default:
            return .paper
        }
    }
    
    func determineWinner(playerOption: GameOption, computerOption: GameOption) -> ResultGame {
        if playerOption == computerOption {
            draw += 1
            return ResultGame.draw
        } else if (playerOption == .rock && computerOption == .scissors) ||
                  (playerOption == .scissors && computerOption == .paper) ||
                  (playerOption == .paper && computerOption == .rock) {
            victory += 1
            return ResultGame.victory
        } else {
            defeat += 1
            return ResultGame.defeat
        }
    }
    
    func showEndResult() -> String {
        if victory == defeat {
            return "Ничья"
        } else if victory > defeat {
            return "Вы победили!"
        } else {
            return"Компьютер победили!"
        }
    }
    
    func resetResult() {
        victory = 0
        defeat = 0
        draw = 0
    }
}

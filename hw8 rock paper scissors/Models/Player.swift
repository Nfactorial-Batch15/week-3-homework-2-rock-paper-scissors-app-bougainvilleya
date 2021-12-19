//
//  Player.swift
//  hw8 rock paper scissors
//
//  Created by Leyla Nyssanbayeva on 16.12.2021.
//

import Foundation

enum Gestures{
    case rock
    case paper
    case scissors
}

class Player{
    var pick: Gestures = Gestures.paper
    var score = 0
    
    func generateGesture() {
        let randomInt = Int.random(in: 1...3)
        switch randomInt{
        case 1:
            self.pick = Gestures.rock
        case 2:
            self.pick = Gestures.paper
        case 3:
            self.pick = Gestures.scissors
        default:
            print("Error in func GenerateGesture().")
        }
        print("Call GenerateGesture() -> ", self.pick)
    }
    
    func convertToGesture(choice: String) -> Gestures {
        var choosedGesture = Gestures.paper

        switch choice{
        case "rock":
            choosedGesture = Gestures.rock
        case "paper":
            choosedGesture = Gestures.paper
        case "scissors":
            choosedGesture = Gestures.scissors
        default:
            print("Wrong choice!")
        }
        print("Call Method ConvertToGesture() -> ", choosedGesture)
        return choosedGesture
    }
    
    static func play(player1: Player, player2: Player) -> String {
        var result = ""
        switch player1.pick{
        case Gestures.rock:
            if player2.pick == Gestures.rock{
                result = "Tie!"
            }
            else if player2.pick == Gestures.paper{
                result = "Lose"
                player2.score += 1
            }
            else{
                result = "Win!"
                player1.score += 1
            }
        case Gestures.paper:
            if player2.pick == Gestures.rock{
                result = "Win!"
                player1.score += 1
            }
            else if player2.pick == Gestures.paper{
                result = "Tie!"
            }
            else{
                result = "Lose"
                player2.score += 1
            }
        case Gestures.scissors:
            if player2.pick == Gestures.rock{
                result = "Lose"
                player2.score += 1
            }
            else if player2.pick == Gestures.paper{
                result = "Win!"
                player1.score += 1
            }
            else{
                result = "Tie!"
            }
        }
        return result
    }
}

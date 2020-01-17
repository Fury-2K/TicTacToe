//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Manas Aggarwal on 14/01/20.
//  Copyright © 2020 Manas Aggarwal. All rights reserved.
//

import Foundation
import UIKit

class GameViewModel {
    
    // Player move = o
    // Computer move = x
    var board: [String] = ["", "", "", "", "", "", "", "", ""]

    func isWinner(_ futureBoard: [String], _ char: String) -> Bool {
        if futureBoard[0] == futureBoard[1] && futureBoard[1] == futureBoard[2] && futureBoard[2] == char {
            return true
        }
        if futureBoard[3] == futureBoard[4] && futureBoard[4] == futureBoard[5] && futureBoard[5] == char {
            return true
        }
        if futureBoard[6] == futureBoard[7] && futureBoard[7] == futureBoard[8] && futureBoard[8] == char {
            return true
        }
        if futureBoard[0] == futureBoard[3] && futureBoard[3] == futureBoard[6] && futureBoard[6] == char {
            return true
        }
        if futureBoard[1] == futureBoard[4] && futureBoard[4] == futureBoard[7] && futureBoard[7] == char {
            return true
        }
        if futureBoard[2] == futureBoard[5] && futureBoard[5] == futureBoard[8] && futureBoard[8] == char {
            return true
        }
        if futureBoard[0] == futureBoard[4] && futureBoard[4] == futureBoard[8] && futureBoard[8] == char {
            return true
        }
        if futureBoard[2] == futureBoard[4] && futureBoard[4] == futureBoard[6] && futureBoard[6] == char {
            return true
        }
        return false
    }
    
    func getPossibleMoves(_ btnArray: [UIButton]) -> [Int] {
        var possibleMoves: [Int] = []
        for i in 0..<btnArray.count {
            if !btnArray[i].isOccupied {
                possibleMoves.append(i)
            }
        }
        return possibleMoves
    }
    
    func isBoardFull(_ btnArray: [UIButton]) -> Bool {
        return getPossibleMoves(btnArray).isEmpty
    }
    
    func computerMove(_ btnArray: [UIButton]) -> Int {
        let possibleMoves: [Int] = getPossibleMoves(btnArray)
        
        for letter in ["x", "o"] {
            for posi in possibleMoves {
                var futureBoard = board
                futureBoard[posi] = letter
                if isWinner(futureBoard, letter) {
                    return posi
                }
            }
        }
        
        var cornersOpen: [Int] = []
        for posi in possibleMoves {
            if [0, 2, 6, 8].contains(posi) {
                cornersOpen.append(posi)
            }
        }
        
        if cornersOpen.count > 0 {
            return cornersOpen.randomElement()!
        }
        
        if possibleMoves.contains(5) { return 5 }
        
        var edgesOpen: [Int] = []
        for posi in possibleMoves {
            if [1, 3, 5, 7].contains(posi) {
                edgesOpen.append(posi)
            }
        }
        
        if edgesOpen.count > 0 {
            return edgesOpen.randomElement()!
        }
        return 0
    }
    
}

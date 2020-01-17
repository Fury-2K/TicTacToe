//
//  GameBoardViewController.swift
//  TicTacToe
//
//  Created by Manas Aggarwal on 08/01/20.
//  Copyright © 2020 Manas Aggarwal. All rights reserved.
//

import UIKit

class GameBoardViewController: UIViewController {

    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    var btnArray: [UIButton] = []
    let viewModel: GameViewModel = GameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBoard()
    }

    func setupBoard() {
        btnArray = [btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9]
        for i in 0..<btnArray.count {
            btnArray[i].backgroundColor = .clear
            btnArray[i].tag = i
            btnArray[i].addTarget(self, action: #selector(boardBtnTapped(_:)), for: .touchUpInside)
        }
    }
    
    func updateBoard() {
        if !viewModel.isBoardFull(btnArray) {
            if viewModel.isWinner(viewModel.board, "o") {
                print("Lucky!")
            } else if !viewModel.isWinner(viewModel.board, "x") {
                let computerMovePosi = viewModel.computerMove(btnArray)
                btnArray[computerMovePosi].backgroundColor = .green
                viewModel.board[computerMovePosi] = "x"
                if viewModel.isWinner(viewModel.board, "x") {
                    print("Losser!")
                    return
                }
            } else {
                print("Losser!")
            }
        } else {
            print("Tie Game!")
        }
    }
    
    @IBAction func startBtnTapped(_ sender: UIButton) {
        updateBoard()
        startBtn.isHidden = true
    }
    
    @objc func boardBtnTapped(_ sender: UIButton) {
        if !sender.isOccupied {
            sender.backgroundColor = .red
            viewModel.board[sender.tag] = "o"
            updateBoard()
        }
    }
    
}

extension UIButton {
    
    var isOccupied: Bool {
        return backgroundColor == .red || backgroundColor == .green
    }
    
}

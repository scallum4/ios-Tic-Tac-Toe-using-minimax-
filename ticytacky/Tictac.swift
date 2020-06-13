//
//  tictac.swift
//  ticytacky
//
//  Created by Callum Smith on 10/06/2020.
//  Copyright © 2020 Callum Smith. All rights reserved.
//

import Foundation

class Tictac{
    var turn = true;
    var board: [[Int]] = [[0,0,0], [0,0,0], [0,0,0]]
    
    init(){
    }
    
    func getTurn() -> Int{
        if(turn){
            return 1
        }
        return 2
    }
    
    func turnAsNum(input: Bool) -> Int{
        if(input){
            return 2
        }
        return 1
    }
    
    func isAvalible(x: Int, y: Int) -> Bool{
        if(board[x][y] == 0){
            return true
        }
        return false
    }
    
    func isEnd() -> Int{
        return isEnd(forBoard: board)
    }
    
    func isEnd(forBoard: [[Int]]) -> Int{
        var draw = true
        var r1 = [0,0,0]
        var r2 = [0,0,0]
        var r3 = [0,0,0]
        
        for a in 0...2{
            for b in 0...2{
                r1[b] = forBoard[a][b]
                r2[b] = forBoard[b][a]
            }
            if(r1[0] != 0 && r1[0] == r1[1] && r1[0] == r1[2]){
                return r1[0]
            } else if(r2[0] != 0 && r2[0] == r2[1] && r2[0] == r2[2]){
                return r2[0]
            }
            r3[a] = forBoard[a][a]
        }
        if(r3[0] != 0 && r3[0] == r3[1] && r3[0] == r3[2]){
            return r3[0]
        }
        if(forBoard[0][2] != 0 && forBoard[0][2] == forBoard[1][1] && forBoard[0][2] == forBoard[2][0]){
            return forBoard[0][2]
        }
        
        for x in 0...2{
            for y in 0...2{
                if(forBoard[x][y] == 0){
                    draw = false
                }
            }
        }
        if(draw){
            return 0
        }
        
        return -1
    }
    
    func turnTaken(x: Int, y: Int) -> Int{
        if(!isAvalible(x: x, y: y)){
            return 0
        }
        board[x][y] = 1
        turn = !turn
        print("done")
        return board[x][y]
    }
    
    func reset(){
        turn = true;
        board = [[0,0,0], [0,0,0], [0,0,0]]
    }
    
    func compsTurn() -> [Int]{
        var bestMoveX = -1
        var bestMoveY = -1
        var bestResult = -10000
        for x in 0...2{
            for y in 0...2{
                if(board[x][y] == 0){
                    var tempBoard = board
                    tempBoard[x][y] = 2
                    let result = compLogic(newBoard: tempBoard, player: false)
                    tempBoard[x][y] = 0
                    if(result > bestResult){
                        bestResult = result
                        bestMoveX = x
                        bestMoveY = y
                    }
                }
            }
        }
        board[bestMoveX][bestMoveY] = 2
        turn = !turn
        return [bestMoveX, bestMoveY]
    }
    
    //make it so that it returns an array [Score, xpos, ypos] ????
    
    func compLogic(newBoard: [[Int]], player: Bool) -> Int{
        var tempBoard = newBoard
        var bestScore = 0
        let winner = isEnd(forBoard: tempBoard)
        if(winner == 2){
            return 10
        } else if(winner == 1){
            return -10
        } else if(winner == 0){
            return 0
        }
        
        if(player){
            bestScore = -1000
        } else{
            bestScore = 1000
        }
        for x in 0...2{
            for y in 0...2{
                if tempBoard[x][y] == 0{
                    tempBoard[x][y] = turnAsNum(input: player)
                    let score = compLogic(newBoard: tempBoard, player: !player)
                    tempBoard[x][y] = 0
                    if player && score > bestScore{
                        bestScore = score
                    }else if !player && score < bestScore{
                        bestScore = score
                    }
                }
            }
        }
        return bestScore
         
    }
}

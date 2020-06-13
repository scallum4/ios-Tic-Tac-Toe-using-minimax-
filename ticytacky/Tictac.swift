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
    
    struct bestChoice{
        var score = 0
        var xPos = -1
        var yPos = -1
    }
    
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
    
    func turnTaken(x: Int, y: Int) -> Bool{
        if(!isAvalible(x: x, y: y)){
            return false
        }
        board[x][y] = 1
        turn = !turn
        return true
    }
    
    func reset(){
        turn = true;
        board = [[0,0,0], [0,0,0], [0,0,0]]
    }
    
    func compsTurn() -> [Int]{
        let result = compLogic(newBoard: board, compsTurn: true)
        board[result.xPos][result.yPos] = 2
        turn = !turn
        return [result.xPos, result.yPos]
    }
    
    //make it so that it returns an array [Score, xpos, ypos] ????
    
    func compLogic(newBoard: [[Int]], compsTurn: Bool) -> bestChoice{
        var tempBoard = newBoard
        var result = bestChoice()
        switch isEnd(forBoard: tempBoard){
        case 0:
            result.score = 0
            return result
        case 1:
            result.score = -10
            return result
        case 2:
            result.score = 10
            return result
        default:
            break
        }
        
        if(compsTurn){
            result.score = -1000
        }else {
            result.score = 1000
        }
        
        for x in 0...2{
            for y in 0...2{
                if tempBoard[x][y] == 0{
                    tempBoard[x][y] = turnAsNum(input: compsTurn)
                    let choice = compLogic(newBoard: tempBoard, compsTurn: !compsTurn)
                    tempBoard[x][y] = 0
                    if compsTurn && choice.score > result.score || !compsTurn && choice.score < result.score{
                        result.score = choice.score
                        result.xPos = x
                        result.yPos = y
                    }
                }
            }
        }
        return result
    }
}

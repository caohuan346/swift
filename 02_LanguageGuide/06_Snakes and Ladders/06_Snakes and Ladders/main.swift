//
//  main.swift
//  06_Snakes and Ladders
//
//  Created by hc on 14-6-12.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation

//  while ////////////////////////////////////////////////////////////////////////////////////////////
let finalSquare = 25
var board = Int[](count: finalSquare + 1, repeatedValue: 0)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02

board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {
    //roll the dice
    if ++diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
    if square < board.count {
         println("diceRoll is \(diceRoll), square is \(square), and board[square] is \(board[square])")
        square += board[square]
        
       
    }
}

println("game over")



//1:  use do...while  ////////////////////////////////////////////////////////////////////////

square = 0
diceRoll = 0
do {
    if ++diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
    if square < board.count {
        println("diceRoll is \(diceRoll), square is \(square), and board[square] is \(board[square])")
        square += board[square]
    }
} while square < finalSquare


println("game over again")


//3:  Labeled Statements  ////////////////////////////////////////////////////////////////////////
square = 0
diceRoll = 0

gameLoop: while square != finalSquare {
    println("diceRoll is \(diceRoll), square is \(square), and board[square] is \(board[square])")
    if ++diceRoll == 7 {diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
        
    }
}
println("game over three")
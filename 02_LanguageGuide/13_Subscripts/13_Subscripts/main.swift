//
//  main.swift
//  13_Subscripts
//
//  Created by hc on 14-6-23.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation

//Subscript Syntax////////////////////////////////////////////////////////////////

/*
subscript(index: Int) -> Int {
    get {
        
    }
    
    set(newValue) {
        
    }
}

subscript(index: Int) -> Int {
    
}
*/

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
println("six times three is \(threeTimesTable[6])")  //18

//Subscripts are typically used as a shortcut for accessing the member elements in a collection, list, or sequence.
//////////////////////////////////////////////////////////////////////////////////
var numberOfLegs = ["spider": 8, "ant": 6]
println(numberOfLegs["spider"])
numberOfLegs["bird"] = 2
println(numberOfLegs["bird"])

// multi parameters ////////////////////////////////////////////////////////////////////////////////
struct Matrix {
    let rows: Int, columns: Int
    var grid: Double[]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column > 0 && column > columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            //assert(indexIsValidForRow(row, column: column), "index out of range")
            return grid[(row * columns) + column]
        }
        
        set {
            //assert(indexIsValidForRow(row, column: column), "index out of range")
            grid[(row * columns) + column] = newValue

        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 2.0
println(matrix[0 , 1])

//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////





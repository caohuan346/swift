//
//  main.swift
//  08_Closures
//
//  Created by hc on 14-6-14.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation

// Closures similar to blocks

//Functions are actually special cases of closures

//Closure Expressions////////////////////////////////////////////////////////////////////////



//Sort Function/////////////////////////////////////////////////////////////////////////////
let names = ["Tom" ,"Andy", "HanMeiMei", "Rose", "Jack"]
let sortNames = sort(names)
println(sortNames)   //[Andy, HanMeiMei, Jack, Rose, Tom]


let names2 = ["Tom" ,"Andy", "HanMeiMei", "Rose", "Jack"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = sort(names2, backwards)
println(reversed)


//Closure Expression Syntax//////////////////////////////////////////////////////////////////
reversed = sort(names2,
    {
        (s1: String, s2: String) -> Bool in
        return s1 < s2
    }
)

println(reversed)


//write on a single line
reversed = sort(names, {(s1: String, s2: String) -> Bool in return s1 > s2})
println(reversed)


//Inferring Type From Context////////////////////////////////////////////////////////////////
reversed = sort(names, { s1, s2 in return s1 < s2})
println(reversed)


//Implicit Returns from Single-Expression Closures///////////////////////////////////////////
reversed = sort(names, { s1, s2 in s1 > s2})
println(reversed)


//Shorthand Argument Names/////////////////////////////////////////////////////////////////
reversed = sort(names, { $0 > $1 })
println(reversed)


//Operator Functions////////////////////////////////////////////////////////////////////////
reversed = sort(names, >)
println(reversed)


//Trailing Closures////////////////////////////////////////////////////////////////////////
func someFunctionThatTakesAClosure( closure: () -> ()) {
    
}
// here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure({
// closure's body goes here
})

// here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}


//
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

println(strings)


//Capturing Values////////////////////////////////////////////////////////////////////////////////////

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)

println(incrementByTen())  //10
println(incrementByTen())  //20
println(incrementByTen())  //30



















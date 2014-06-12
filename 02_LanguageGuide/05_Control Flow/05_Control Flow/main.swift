//
//  main.swift
//  05_Control Flow
//
//  Created by hc on 14-6-11.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation

// For Loops //////////////////////////////////////////////////////////////////////////////////////////

for i in 1...9 {
    for j in 1...i {
        print("\(j)*\(i) = \(i * j) ")
    }
    println()
}

let base = 2
let power = 5
var answer = 1
for _ in 1...power {
    answer *= base
}

println("\(base) to the power of \(power) is \(answer)")


let names = ["Tom", "Jack", "Rose", "CH"]
for name in names {
    print(name + " ")
}


let numberOfLegs = ["spider":8 ,"ant":6, "cat":4]

for (animalName, legCount) in numberOfLegs {
    println("\(animalName) has \(legCount) legs")
}

for character in "hello world" {
    println(character)
}


// For-Condition-Increment /////////////////////////////////////////////////////////////////////
for var index = 0; index < 3; ++index {
    println("index is \(index)")
}



////////////////////////////////////////////////////////////////////////////////////////////////////
// Switch ///////////////////////////////////////////////////////////////////////////////////////////
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    println("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    println("\(someCharacter) is a consonant")
default:
    println("\(someCharacter) is not a vowel or a consonant")
}

// NO fallthrough////////////////////////////////////////////////////////////////
let anotherChar: Character = "a"
switch anotherChar {
//case "a":   “report a compile-time error
    case "b":
        println("the letter is \(anotherChar)")
    default:
        println("Not the letter A")
}


//Range Matching////////////////////////////////////////////////////////////////
let count = 300_000_000_000
let countedThings = " people on earth"
var naturalCount: String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of "
case 1000...999_999:
    naturalCount = "thousands of "
default:
    naturalCount = "millions and millions of"
}
println("There are \(naturalCount) \(countedThings)")



// Tuples //////////////////////////////////////////////////////////////
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    println("at the origin")
case (_, 0):
    println("on the x-axis")
case (0, _):
    println("on the y-axis")
case (-2...2, -2...2):
    println("inside the box")
default:
    println("outside the box")
}

//Value Bindings  //////////////////////////////////////////////////////////////
let anotherPoint = (1, 0.8)
switch anotherPoint {
case (let x, 0):
    println(" on x-axis and x value is \(x) ")
case (0, let y):
    println(" on y-axis and x value is \(y) ")
case let (x, y):
    println(" somewhere else at \(x), \(y)")
}


//Where//////////////////////////////////////////////////////////////////////////////
let yetAnotherPoint = (-1, 1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    println("x == y")
case let (x, y) where x == -y:
    println("x == -y")
case let (x, y):
    println("\(x),\(y)")
}


//Control Transfer Statements////////////////////////////////////////////////////////


//Continue
let inputStr = "Noting is impossible if you set you mind to do it"
var outputStr = ""
for char in inputStr {
    switch char {
    case "a", "e", "i", "o":
        continue
    default:
        outputStr += char
    }
}

println(outputStr)


//Break ///////////////////////////////////////////////////////////////////////////
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "一":
    possibleIntegerValue = 1
case "2", "二":
    possibleIntegerValue = 2
case "3", "三":
    possibleIntegerValue = 3
case "4", "四":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    println("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    println("An integer value could not be found for \(numberSymbol).")
}



//Fallthrough//////////////////////////////////////////////////////////////////////////

let integerToDesc = 5
var descStr = " the number \(integerToDesc) is"
switch integerToDesc {
case 2, 3, 5, 7, 11, 13, 17, 19:
    descStr += " a prime number and also"
    fallthrough
default:
    descStr += " an integer"
}

println(descStr)

//Labeled Statements //////////////////////////////////////////////////////////////////

























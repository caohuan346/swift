//
//  main.swift
//  05_Control Flow
//
//  Created by hc on 14-6-11.
//  Copyright (c) 2014年 hc. All rights reserved.
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







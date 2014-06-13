//
//  main.swift
//  07_Functions
//
//  Created by hc on 14-6-13.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation

//Defining and Calling Functions
func sayHello(personName: String)-> String {
    let greeting = " say hello to \(personName)"
    return greeting
}

println(sayHello("caohuan"))


//without parmmeters
func sayHelloworld()-> String {
    return "hello world"
}
println(sayHelloworld())


//without return values:    return a special value of type Void

func sayGoodBye(personName: String) {
    println("say good bye to \(personName)")
}

sayGoodBye("tom")


//
func printAndCount(stringToPrint: String) -> Int{
    println(stringToPrint)
    return countElements(stringToPrint);
}

func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}

printAndCount("Hello world")
printWithoutCounting("Hello world")


//return mutable values: by use tuple
func count(string: String) -> (vowels:Int, consonant: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for char in string {
        switch String(char).lowercaseString {
        case "a", "e", "i", "o", "u":
            ++vowels
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
            "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                ++consonants
        default:
            ++others
        }
    }
    
    return (vowels,consonants, others)
}


println(count("ajfklasdjtewwiuqqwiiaijsdis345352122322   jijibsosooeweesaajljdsfgfdgl"))
var countTuple = count("ajfklasdjtewwiuqqwiiaijsdis345352122322   jijibsosooeweesaajljdsfgfdgl")
println("\(countTuple.vowels)")


//External Parameter Names/////////////////////////////////////////////////////////
func joinStr(s1: String, joiner: String, s2: String) -> String {
    return s1 + joiner + s2
}

println(joinStr("aaa", ",", "bbbb"))


//
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String{
    return s1 + joiner + s2
}

println(join(string:"sdfdsfsd", toString:"1`11111", withJoiner:"_"))


//Shorthand External Parameter Names////////////////////////////////////////////////
func containChar(#string: String, #characterToFind: Character) -> Bool{
    for char in string {
        if char == characterToFind {
            return true
        }
    }
    return false
}

println(containChar(string:"aaaaaaa", characterToFind: "b"))  //false



//Default Parameter Values///////////////////////////////////////////////////////////

func join2(string s1: String, toString s2: String, withJoiner joiner: String = "****") -> String{
    return s1 + joiner + s2
}

println(join2(string:"sdfdsfsd", toString:"1`11111", withJoiner:"_"))
println(join2(string:"sdfdsfsd", toString:"1`11111"))


//External Names for Parameters with Default Values//////////////////////////////////
func joinStr3(s1: String, joiner: String = "", s2: String) -> String {
    return s1 + joiner + s2
}

//if is has Default Values when the function be called,it can use external names
println(joinStr3("aaa", joiner:",", "bbbb"))


//Variadic Parameters////////////////////////////////////////////////////////////////
func averageNumbers(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

println(averageNumbers(1.2, 1.4, 1.6,1.7, 1.3))


//Constant and Variable Parameters///////////////////////////////////////////////
func alignRight(var string: String, count: Int, pad: Character) -> String {
    let needPadCount = count - countElements(string)
    for _ in 1...needPadCount {
        string = pad + string
    }
    return string
}

let originalStr = "hello"
let padedStr = alignRight(originalStr, 15, "-")
println(padedStr)



//In-Out Parameters////////////////////////////////////////////////////////////////////
func swapTowInts(inout a: Int, inout b: Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 5

//ampersand , means &
swapTowInts(&someInt, &anotherInt)
println("some int is \(someInt), and anotherInt is \(anotherInt)")


//Function Types////////////////////////////////////////////////////////////////////////

//(Int, Int) -> Int   :  A function type that has two parameters, both of type Int, and that returns a value of type Int


//Using Function Types/////////////////////////////////////////////////////////////////
func addTwoInts (a :Int, b:Int) -> Int{
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
println(mathFunction(2, 4))


let anotherMathFunc = addTwoInts
println(anotherMathFunc(2, 7))



//Function Types as Parameter Types////////////////////////////////////////////////////

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("result is \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 10, 20)


//Function Types as Return Types//////////////////////////////////////////////////////
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunc(backwordFlag: Bool) -> (Int) ->Int {
    return backwordFlag ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunc(currentValue > 0)
println(moveNearerToZero)

println("begin to counting:")
while currentValue != 0 {
    println("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
println("zero")


//Nested Functions//////////////////////////////////////////////////////////////////////
func chooseStepFunc2(backwards: Bool) -> (Int) -> Int {
    func stepForward2(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward2(input: Int) -> Int {
        return input - 1
    }
    return backwards ? stepBackward2 : stepForward2
}

var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunc2(currentValue2 > 0)

while currentValue2 != 0 {
    println("\(currentValue2)")
    currentValue2 = moveNearerToZero2(currentValue2)
}



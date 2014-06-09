//
//  main.swift
//  01_TheBasic
//
//  Created by hc on 14-6-7.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation

//“Declaring Constants and Variables”
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

//定义多个变量
var x = 0.0, y = 1.2, z = 4.5

//类型注解
var welcomeMsg: String
welcomeMsg = "Hello"

//可以用任何字符来标记常量或变量，包括Unicode
let π = 3.141592653
let 你好 = "hello happy"
let 🐶🐮 = "dog and cow"
println(你好)
println(🐶🐮)
var 🐮🐮: String
🐮🐮 = "two pigs"
println(🐮🐮)
var pigStr = "🐮🐮"
println(pigStr)


//one line ,use ;
let cat = "🐱"; println(cat)


//Integers////////////////////////////////////////////////////////////////////////////
let minValue = UInt8.min
println(minValue) //0
let maxValue = UInt8.max
println(maxValue) //255







//没提交之后的////////////////////////////////////////////////////////////////////////////

let paddedDouble = 0000012.12;
println(paddedDouble)
let oneMillion = 1_000_000
println(oneMillion)
let justOverOneMillion = 1_000_000.000___________000_1
println(justOverOneMillion)


 // overflow
//let cannotBeNegative: UInt = -1
//let tooBig: UInt8 = UInt8.max + 1
//println(tooBig)
//println(tooBig)

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
//let twoThousandAndOne = twoThousand + one
let twoThousandAndOne = twoThousand + UInt16(one)
println(twoThousandAndOne)


let three = 3
let pointOrWhatEver = 0.1415926
let pi = Double(three) + pointOrWhatEver
println(pi)

let four = 4
let intSum = four + Int(pi)
println(intSum)


//Type Aliases/////////////////////////////////////////////////////////////////////////
// Type Aliases可以知道

typealias CHUInt = UInt16
let CHUIntMax = CHUInt.max
println(CHUIntMax)  //65535


//Booleans///////////////////////////////////////////////////////////////

let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    println("yes")
}else{
    println("NO")
}


//i 不是逻辑值
//let i = 1
//if i {
//    println(i)
//}



let i = 1
if i == 1 {
    println(i)
}

//Tuples 元组；数组；重数 ///////////////////////////////////////////////////////////////

let http404Error = (404,"Not Found")
println(http404Error)

//分解元组
let (statusCode, statusMsg) = http404Error
println(" the statusCode is \(statusCode), and status message is \(statusMsg)")

//如果只需要一部分，使用_忽视其他部分
let (justTheStatusCode, _) =  http404Error
println("the status code is \(justTheStatusCode)")

//通过索引访问
println(" the status code is \(http404Error.0)")
println(" the status code is \(http404Error.1)")


//tuple已定义时，可以在tuple中命名单独的元素
let http200Status = (statusCode: 200, description: "ok")
println(" the status code is \(http200Status.statusCode)")


//元组作为方法的返回值是非常有用的


//Optionals///////////////////////////////////////////////////////////////
let possibleInt = "123"
let convertedInt = possibleInt.toInt()  //返回的时一个optional Int，相当于Int?
println(convertedInt)

let possibleInt2 = "ch,hello"
let convertedInt2 = possibleInt2.toInt()
println(convertedInt2)  //nil

if convertedInt2 {
    println("\(possibleInt2) has value of \(convertedInt2!)")
}else{
    println("\(possibleInt2) could not be converted to an integer")
}

//optional bindings ////////////////////////////////////////////////////////////////////

//“set a new constant called actualNumber to the value contained in the optional.”
//“If the conversion is successful, the actualNumber constant becomes available for use within the first branch of the if statement. ”
if let actualNumber = convertedInt2 {
    println("\(possibleInt2) has value of \(convertedInt2!)")
    println(actualNumber)
}else{
    println("\(possibleInt2) could not be converted to an integer")
}


// nil ////////////////////////////////////////////////////////////////////
//swift中的nil不是一个指针，可以赋值给任何类型

var serverResponseCode: Int? = 404
serverResponseCode = nil
println(serverResponseCode)  //nil


var surveyAnswer: String?
println(surveyAnswer)  //nil   


let possibleString: String? = "an optional String"
println(possibleString!)

let assumeString: String! = "An implicitly unwrapped optional string"
println(assumeString)

if assumeString {
    println(assumeString)
}

if let definiteString = assumeString {
    println(definiteString)
}

//Assertions 断言////////////////////////////////////////////////////////////////////
let age = -3
//assert(age >= 0,"a person`s age can not less than zero")  //false ,app terminated
assert(age <= 0,"a person`s age can not less than zero")  //true ,continues

//assert(age >= 0)







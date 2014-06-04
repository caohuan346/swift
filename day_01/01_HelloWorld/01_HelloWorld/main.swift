//
//  main.swift
//  01_HelloWorld
//
//  Created by hc on 14-6-4.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation

///////////////////////////////////////////////
//1：类似于脚本语言，下面的代码即是一个完整的Swift程序。
println("Hello, World!")

///////////////////////////////////////////////
//2：Swift使用var声明变量，let声明常量。
var myVar = 42
myVar = 50
let myConstant = 42
//myConstant = 60  //错误

println(myVar)
println(myConstant)

///////////////////////////////////////////////
//Swift支持类型推导（Type Inference），所以上面的代码不需指定类型，如果需要指定类型：
let explicitDouble : Double = 70
println(explicitDouble)

///////////////////////////////////////////////
//Swift不支持隐式类型转换（Implicitly casting），所以下面的代码需要显式类型转换（Explicitly casting）：
let lable = "the width is "
let width = 94
let result = lable + String(width)
println(result)

//字符串格式化/////////////////////////////////////////////
//Swift使用\(item)的形式进行字符串格式化：
let apples = 4
let oranges = 5
let appleSummary = "i have \(apples) apples"
let appleAndOrange = "i have \(apples) apples and \(oranges) oranges"
println(appleSummary)
println(appleAndOrange)


//数组和字典///////////////////////////////////////////////////////////////////////////
//Swift使用[]操作符声明数组（array）和字典（dictionary）：
var shoppingList = ["catfish","water","tulips", "blue paint"]
shoppingList[1] = "bottle of water"
println(shoppingList[1])
println(shoppingList[2])

var occupationsDic = [
    "key1":"value1",
    "key2":"value2",
]

println(occupationsDic["key1"])
occupationsDic["key2"] = "value2222"
println(occupationsDic["key2"])


//一般使用初始化器（initializer）语法创建空数组和空字典：
let emptyArr = String[]()
let emptyDic = Dictionary<String,Float>()
//emptyArr[1] = "value1"
//println(emptyArr[1])


//控制流///////////////////////////////////////////////////////////////////////////
//Swift的条件语句包含if和switch，循环语句包含for-in、for、while和do-while，循环/判断条件不需要括号，但循环/判断体（body）必需括号：

let scoreArr = [25,30,45,45,49,29,78]
var sumScore = 0
for score in scoreArr{
    if score > 30 {
        sumScore += 3
    } else {
        sumScore += 1
    }
}
println(sumScore)


//可空类型///////////////////////////////////////////////////////////////////////////
//结合if和let，可以方便的处理可空变量（nullable variable）。对于空值，需要在类型声明后添加?显式标明该类型可空。
var optionalStr: String? = "Hello happy"
println(optionalStr == nil)  //false

var optName: String? = "John Snow"
var gretting = "Hello"
if let name = optName {
    gretting = "Hello,\(name)"
}
println(gretting)


//灵活的switch///////////////////////////////////////////////////////////////////////////
//Swift中的switch支持各种各样的比较操作：
let vegetable = "red papper"
switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
        println(vegetableComment)
    
    case "red papper","watercress":
        let vegetableComment = "That would make a good tea sandwich."
        println(vegetableComment)
   
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
        println(vegetableComment)

    default:
        let vegetableComment = "Everything tastes good in soup."
        println(vegetableComment)
}


//其它循环///////////////////////////////////////////////////////////////////////////
//for-in除了遍历数组也可以用来遍历字典：
let interestDic = [
    "Prime":[2,6,5,4,2,66,45,7,44],
    "Fibonacci":[1,1,2,5,4,5,8,9],
    "Square":[1,3,5,88,3],
]

var largestNumber = 0
for (kind, numbers) in interestDic {
    for number in numbers {
        if number > largestNumber {
            largestNumber = number
        }
    }
}
println(largestNumber)


//while循环和do-while循环：///////////////////////////////////////////////////////////////////
///while
var n = 2
while n<10 {
    n = n * 2
}
println(n)

//do-while
var m = 2
do {
    m = m * 2
} while m < 20
println(m)


////////////////////////////////////////////////////////////////////////////////////////////
//Swift支持传统的for循环，此外也可以通过结合..（生成一个区间）和for-in实现同样的逻辑。
var firstLoop = 0
for i in 0..10 {
    firstLoop += i
}
println("..for:" + String(firstLoop))

var secondForLoop = 0
for var i = 0;i<3; ++i{
    secondForLoop += i
}
println(secondForLoop)

//注意：Swift除了..还有...：..生成前闭后开的区间，而...生成前闭后闭的区间。
var thirdForLoop = 0
for i in 0...3 {
    thirdForLoop += i
}
println(thirdForLoop)












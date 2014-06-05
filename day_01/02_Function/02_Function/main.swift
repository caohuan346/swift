//
//  main.swift
//  02_Function
//
//  Created by hc on 14-6-4.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation

//函数和闭包////////////////////////////////////////////////////////////////////
//Swift使用func关键字声明函数：
func greet(name: String,day: String) -> String {
    return "Hello \(name),today is \(day)."
}

var greetStr = greet("ch","Tuesday")
println(greetStr)


//通过元组（Tuple）返回多个值：
func getGasPrices() -> (Double,Double,Double) {
    return (3.56,5.66,3.79)
}

var gasPrices = getGasPrices()
println(gasPrices)


//支持带有变长参数的函数：
func sumOf(numbers: Int...) ->Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

var sum = sumOf(1,2,5,4,6)
println(sum)

//函数也可以嵌套函数：
func returnFifiteen() ->Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
var fifiteen = returnFifiteen()
println(fifiteen)


//作为头等对象，函数既可以作为返回值，也可以作为参数传递：
func makeIncrementer() -> (Int -> Int) {
    func addNumber(number: Int) -> Int {
        return number + 1
    }
    return addNumber
}
var increment = makeIncrementer()
var incrementValue = increment(7)
println(incrementValue)


//
func hasAnyMatches(list: Int[], condition: Int->Bool) ->Bool {
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [12,22,9,34,45]
var matchFlag = hasAnyMatches(numbers, lessThanTen)
println(matchFlag)


//闭包////////////////////////////////////////////////////////////////////
//本质来说，函数是特殊的闭包，Swift中可以利用{}声明匿名闭包：
//FIXME
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
//var mapResult =


//FIXME
//当闭包的类型已知时，可以使用下面的简化写法：
numbers.map({number in 3 * number})


//FIXME
//此外还可以通过参数的位置来使用参数，当函数最后一个参数是闭包时，可以使用下面的语法：
sort([1,3,4,6,4,12,2]) {$0 > $1}

































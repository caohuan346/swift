//
//  main.swift
//  :
//
//  Created by hc on 14-6-6.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation


//调用方法////////////////////////////////////////////////////////////////////
//Swift中，函数的参数名称只能在函数内部使用，但方法的参数名称除了在内部使用外还可以在外部使用（第一个参数除外），例如：
class Counter {
    var count: Int = 0
    
//    init(count: Int){
//        self.count = count
//    }
    
    //注意Swift支持为方法参数取别名：在上面的代码里，numberOfTimes面向外部，times面向内部。
    func incrementBy(amount: Int, nuberOfTimes times: Int) {
        count += amount * times
    }
}

var counter = Counter()
counter.incrementBy(2, nuberOfTimes: 7)
println(counter.count)


//?的另一种用途////////////////////////////////////////////////////////////////////
//使用可空值时，?可以出现在方法、属性或下标前面。如果?前的值为nil，那么?后面的表达式会被忽略，而原表达式直接返回nil，例如：
//当optionalCounter为nil时，count属性调用会被忽略。
let optionalCounter: Counter? = Counter()
let counterCount = optionalCounter?.count
println(counterCount)


// 枚举和结构 ////////////////////////////////////////////////////////////////////
//枚举:使用enum创建枚举——注意Swift的枚举可以关联方法：
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDesc() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.toRaw()   //to Raw
println(aceRawValue)


//使用toRaw和fromRaw在原始（raw）数值和枚举值之间进行转换：
if let convertedRank = Rank.fromRaw(2) {
    let threeDesc = convertedRank.simpleDesc()
    println(threeDesc)
    //println(convertedRank.simpleDesc())
}

//注意枚举中的成员值（member value）是实际的值（actual value），和原始值（raw value）没有必然关联。
//一些情况下枚举不存在有意义的原始值，这时可以直接忽略原始值：
enum Suit {
    case Spades, Hearts, Diamonds, Clubs

    func simpleDesc() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDesc = hearts.simpleDesc()
println(heartsDesc)

//除了可以关联方法，枚举还支持在其成员上关联值，同一枚举的不同成员可以有不同的关联的值：
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese")

var serverResponse: String
switch success {
    
    case let .Result(sunrise, sunset):
        serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    case let .Error(error):
        serverResponse = "Failure... \(error)"
}

println(serverResponse)


// 结构 ////////////////////////////////////////////////////////////////////
//Swift使用struct关键字创建结构。结构支持构造器和方法这些类的特性。结构和类的最大区别在于：结构的实例按值传递（passed by value），而类的实例按引用传递（passed by reference）。
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDesc() -> String {
        return "The \(rank.simpleDesc()) of the \(suit.simpleDesc())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDesc()
println(threeOfSpades)
println(threeOfSpadesDescription)










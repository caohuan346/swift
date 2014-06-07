//
//  main.swift
//  05_ProtocolAndExtension
//
//  Created by hc on 14-6-6.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation

//协议（protocol）和扩展（extension）/////////////////////////////////////////////////////////////

//协议（protocol）/////////////////////////////////////////////////////////////
//Swift使用protocol定义协议：
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//类型、枚举和结构都可以实现（adopt）协议：
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "simpleDescription property"
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust();
let aDesc = a.simpleDescription
println(aDesc)


//结构实现
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDesc = b.simpleDescription
println(bDesc)


//扩展/////////////////////////////////////////////////////////////
//扩展用于在已有的类型上增加新的功能（比如新的方法或属性），Swift使用extension声明扩展：
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

let intV = 7.simpleDescription
println(intV)
//let aaa = 7.adjust()
//println(aaa)


//泛型（generics）/////////////////////////////////////////////////////////////
//Swift使用<>来声明泛型函数或泛型类型：
func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[] {
    var result = ItemType[]()
    for i in 0..times {
        result += item
    }
    return result
}

let repeatResult = repeat("knock", 4)
println(repeatResult)

//Swift也支持在类、枚举和结构中使用泛型：
enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
println(possibleInteger)









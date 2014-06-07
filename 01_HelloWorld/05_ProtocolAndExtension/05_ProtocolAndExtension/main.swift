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


//有时需要对泛型做一些需求（requirements），比如需求某个泛型类型实现某个接口或继承自某个特定类型、两个泛型类型属于同一个类型等等，Swift通过where描述这些需求：
func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
let flag = anyCommonElements([1, 2, 3], [3])
println(flag)







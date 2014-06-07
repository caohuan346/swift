//
//  main.swift
//  03_ClassAndObject
//
//  Created by hc on 14-6-5.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation

//类和对象////////////////////////////////////////////////////////////////////
//创建和使用类

//Swift使用class创建一个类，类可以包含字段和方法：
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

//创建Shape类的实例，并调用其字段和方法。
var shape = Shape()
shape.numberOfSides = 7
var sidesDesc = shape.simpleDescription()
println(sidesDesc)


//通过init构建对象，既可以使用self显式引用成员字段（name），也可以隐式引用（numberOfSides）。
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name:String) {
        self.name = name
    }
    
    init(numberOfSides:Int, name:String) {
        self.numberOfSides = numberOfSides
        self.name = name
    }
    
    func simpleDescription() ->String{
        return "A shape with \(numberOfSides) sides"
    }
    
    func simpleDescription2() ->String{
        return "\(name) with \(numberOfSides) sides"
    }
}

var namedShape = NamedShape(name:"namedShape")
namedShape.numberOfSides = 10
var namedShapeSDesc = namedShape.simpleDescription()
println(namedShapeSDesc)

var namedShape2 = NamedShape(numberOfSides:10,name:"namedShape")
namedShape2.numberOfSides = 10
var namedShapeSDesc2 = namedShape2.simpleDescription2()
println(namedShapeSDesc2)

//使用deinit进行清理工作。


//继承和多态////////////////////////////////////////////////////////////////////
//Swift支持继承和多态（override父类方法）：
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength:Double,name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->Double {
        return sideLength * sideLength
    }
    
    //注意：如果这里的simpleDescription方法没有被标识为override，则会引发编译错误。
    override func simpleDescription() ->String {
        return "A square with sides of length \(sideLength)"
    }
}


let test = Square(sideLength:5.5, name: "test square")
var squareArea = test.area()
var squareDesc = test.simpleDescription()
println(squareDesc + ",area  is " + String(squareArea))



//属性////////////////////////////////////////////////////////////////////
//为了简化代码，Swift引入了属性（property），见下面的perimeter字段：
class EquilTriangle: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        //：赋值器（setter）中，接收的值被自动命名为newValue。
        sideLength = newValue / 3.0
    }
    }

    override func simpleDescription() -> String{
        return "A equilTriangle with side of length \(sideLength)"
    }
}

var triangle = EquilTriangle(sideLength:6.0, name: "my equil triangle")
println(triangle.perimeter) //get
triangle.perimeter = 12     //set
println(triangle.sideLength)



//willSet和didSet////////////////////////////////////////////////////////////////////
/*
EquilateralTriangle的构造器进行了如下操作：
    为子类型的属性赋值。
    调用父类型的构造器。
    修改父类型的属性。
*/

//如果不需要计算属性的值，但需要在赋值前后进行一些操作的话，使用willSet和didSet：
//从而保证triangle和square拥有相等的sideLength。
class TriangleAndSquare{
    var triangle: EquilTriangle {
    willSet{
        //square.sideLength = newValue.sideLength
    }
    }
    var square: Square {
    willSet{
        triangle.sideLength = newValue.sideLength
    }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilTriangle(sideLength: size, name: name)
    }
}

var aTriangleAndSquare = TriangleAndSquare(size: 10.5, name: "my triangleAndSquare")
println(aTriangleAndSquare.triangle.sideLength)
aTriangleAndSquare.square = Square(sideLength: 50, name: "larger square")
println(aTriangleAndSquare.triangle.sideLength)






//
//  main.swift
//  12_Methods
//
//  Created by hc on 14-6-23.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation

//Instance Methods//////////////////////////////////////////////////////////////////////////////
class Counter {
    var count = 0
    func increment() {
        count++
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let aCounter = Counter()
aCounter.increment()        //1
println(aCounter.count)
aCounter.incrementBy(10)    //11
println(aCounter.count)
aCounter.reset()            //0
println(aCounter.count)


//Local and External Parameter Names for Methods///////////////////////////////////////////
class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    
    func incrementBy2(amount: Int, #numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

var counter2 = Counter2()
counter2.incrementBy(4, numberOfTimes: 5)   //first param :local   others:both local and external
println(counter2.count)   //20
counter2.incrementBy2(1, numberOfTimes: 2)
println(counter2.count)   //22


//The self Property//////////////////////////////////////////////////////////////////////////////
class Counter3 {
    var count = 0
    func increment() {
        self.count++
    }
    
    func incrementBy(amount: Int) {
        self.count += amount
    }
    
    func reset() {
        self.count = 0
    }
}

let aCounter3 = Counter3()
aCounter3.increment()        //1
println(aCounter3.count)
aCounter3.incrementBy(10)    //11
println(aCounter3.count)
aCounter3.reset()            //0
println(aCounter3.count)

////////////////////////////////////////////////////////////////////////////////
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    println("yes")   //yes
}else {
    println("no")
}


//Modifying Value Types from Within Instance Methods///////////////////////////////////////////////
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint2 = Point2()
somePoint2.moveByX(2.0, y: 3.0)
println("\(somePoint2.x),\(somePoint2.y)")  //2.0,3.0


let fixedPoint = Point2(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)
//it is a constant ,so cos an error


//Assigning to self Within a Mutating Method/////////////////////////////////////////////////////////
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}
var point3 = Point3()
point3.moveByX(10, y: 10)
println("\(point3.x),\(point3.y)")  //10.0,10.0
point3.moveByX(10, y: 10)
println("\(point3.x),\(point3.y)")  //20.0,20.0

////////////////////////////////////////////////////////////////////////////////
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
println(ovenLight.hashValue)  //2
ovenLight.next()
println(ovenLight.hashValue)  //0


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//Type Methods////////////////////////////////////////////////////////////////
class SomeClass {
    class func someTypeMethod() {
        println("type method implementation goes here")
    }
}

SomeClass.someTypeMethod()

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
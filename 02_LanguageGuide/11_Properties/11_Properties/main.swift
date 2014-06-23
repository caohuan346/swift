//
//  main.swift
//  11_Properties
//
//  Created by hc on 14-6-22.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation


//Stored Properties////////////////////////////////////////////////////////////
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//rangeOfThreeItems.length = 4   //error
println(rangeOfThreeItems.firstValue )
println(rangeOfThreeItems.length )


//Stored Properties of Constant Structure Instances/////////////////////////////
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 0  //error,cos the rangeOfFourItems is a constant

//The same is not true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.

//Lazy Stored Properties//////////////////////////////////////////////////////////
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    @lazy var importer = DataImporter()
    var data = String[]()
}

let manager = DataManager()
manager.data += "some data"
manager.data += "some more data"
println(manager.importer.fileName)
//the DataImporter instance for the importer property has now been created
//data.txt


//Stored Properties and Instance Variables//////////////////////////////////////////////////////////
//what's this

//Computed Properties///////////////////////////////////////////////////////////////////////////
//which do not actually store a value
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
    get{
        let centerX = origin.x + (size.width / 2)
        let centerY = origin.y + (size.height / 2)
        return Point(x: centerX, y: centerY)
    }
    
    set(newCenter) {
        origin.x = newCenter.x - (size.width / 2)
        origin.y = newCenter.y - (size.height / 2)
    }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSqueareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
println("square.origin is now at (\(square.origin.x), \(square.origin.y))")
println("square.center is now at (\(square.center.x), \(square.center.x))")

//Shorthand Setter Declaration//////////////////////////////////////////////////////////
//a default name of newValue is used
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
    get {
        let centerX = origin.x + (size.width / 2)
        let centerY = origin.y + (size.height / 2)
        return Point(x: centerX, y: centerY)
    }
    set {
        origin.x = newValue.x - (size.width / 2)
        origin.y = newValue.y - (size.height / 2)
    }
    }
}


//Read-Only Computed Properties//////////////////////////////////////////////////////////
//with a getter but no setter is known as a read-only computed property
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 3.0)
println("\(fourByFiveByTwo.volume)")


//Property Observers//////////////////////////////////////////////////////////
class StepCounter {
    var totalSteps: Int = 0 {
    willSet(newTotalSteps){
        println("about to set totalSteps tobn \(newTotalSteps)")
    }
    didSet {
        if totalSteps > oldValue {
            println("added \(totalSteps - oldValue) steps")
        }
    }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
stepCounter.totalSteps = 896

//about to set totalSteps tobn 200
//added 200 steps
//about to set totalSteps tobn 200   // same, break didSet
//about to set totalSteps tobn 360
//added 160 steps
//about to set totalSteps tobn 896
//added 536 steps
//about to set totalSteps tobn 896   // same, break didSet


//Global and Local Variables//////////////////////////////////////////////////////////

//Type Properties/////////////////////////////////////////////////////////////////////

//Type Property Syntax//////////////////////////////////////////////////////////

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
    // return an Int value here
        return 10
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        // return an Int value here
        return 10
    }
}

class SomeClass {
    class var computedTypeProperty: Int {
        // return an Int value here
        return 15
    }
}

//Querying and Setting Type Properties//////////////////////////////////////////////////////////
println(SomeClass.computedTypeProperty)         //15
println(SomeEnumeration.computedTypeProperty)   //10
println(SomeEnumeration.storedTypeProperty)     //some value


////////////////////////////////////////////////////////////

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0  // every time u input
    var currentLevel: Int = 0{
    didSet{
        if currentLevel > AudioChannel.thresholdLevel {
            currentLevel = AudioChannel.thresholdLevel
        }
        
        if currentLevel > AudioChannel.maxInputLevelForAllChannels {
             AudioChannel.maxInputLevelForAllChannels = currentLevel
        }
    }
    }
}

var leftChannel = AudioChannel()
var rightChanel = AudioChannel()
leftChannel.currentLevel = 7
println(leftChannel.currentLevel)   //7
println(rightChanel.currentLevel)   //0
println(AudioChannel.maxInputLevelForAllChannels)  //7


rightChanel.currentLevel = 11
println(leftChannel.currentLevel)   //7
println(rightChanel.currentLevel)   //10
println(AudioChannel.maxInputLevelForAllChannels)  //10


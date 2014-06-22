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





////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////































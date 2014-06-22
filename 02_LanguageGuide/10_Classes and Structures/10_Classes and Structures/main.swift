//
//  main.swift
//  10_Classes and Structures
//
//  Created by hc on 14-6-22.
//  Copyright (c) 2014Y hc. All rights reserved.
//

import Foundation

class SomeClass {
    
}

struct SomeStructure {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?  //? must have, optional type.
}


//Class and Structure Instances///////////////////////////////////////////////////
var someResolution = Resolution()
var someVideoMode = VideoMode()

//Accessing properties///////////////////////////////////////////////////

println("\(someResolution.width)")
println("\(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
println("\(someVideoMode.resolution.width)")

//Unlike Objective-C, Swift enables you to set sub-properties of a structure property directly.


//Memberwise Initializers for Structure Types////////////////////////////////////
let vga = Resolution(width:100, height:50)
println("\(vga.width), \(vga.height)")

//Unlike structures, class instances do not receive a default memberwise initializer


//Structures and Enumerations Are Value Types
var cinema = vga //are two completely different instances behind the scenes.
println("\(cinema.width), \(cinema.height)")

cinema.width = 200
println("\(cinema.width ),\(vga.width)")


//the same to emumerations
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.North
let rememberedDirection = currentDirection
currentDirection = .West
if rememberedDirection == .West {
    println("bingo！！")
}else{
    println("not the same")
}


//Classes Are Reference Types////////////////////////////////////////////////////////
//reference types are not copied when they are assigned to a variable or constant
let tenEighty = VideoMode()
tenEighty.resolution = vga
tenEighty.interlaced = true
tenEighty.name = "10001"
tenEighty.frameRate = 25.0

let anotherTenEighty = tenEighty
anotherTenEighty.name = "10002"

println("\(tenEighty.name)")
//they are just two different names for the same single instance.


//Identity Operators////////////////////////////////////////////////////////////////////
//Identical to (===)
//Not identical to (!==)
//Use these operators to check whether two constants or variables refer to the same single instance

if tenEighty === anotherTenEighty {
    println("refer to the same Resolution instance")
}


//Choosing Between Classes and Structures///////////////////////////////////////////////////

//structure instances are always passed by value, and class instances are always passed by reference

//Swift’s Array and Dictionary types are implemented as structures.

//Assignment and Copy Behavior for Dictionaries/////////////////////////////////////////////
var ages = ["Tome": 23, "Rose": 20, "Jack": 40, "HanMeiMei":16]
var copiedAges = ages
copiedAges["Rose"] = 22
println(ages["Rose"])   //also 20,keys and values are also copied


//Assignment and Copy Behavior for Arrays///////////////////////////////////////////////////
var a = [1, 2, 3]
var b = a
var c = a

println(a[1])   //2
println(b[1])   //2
println(c[1])   //2

a[1] = 20
println(a[1])   //20
println(b[1])   //20
println(c[1])   //20
//did not change array's length


//if append a new item to array a,then a is separate copy of the array
a += 3
a[0] = 11
println(a[0])   //11
println(b[0])   //1
println(c[0])   //1


//Ensuring That an Array Is Unique/////////////////////////////////////////////////////////////
var aa = [1, 2, 3]
var bb = aa
var cc = aa
bb.unshare()
bb[0] = 1111
println(aa[0])   //1
println(bb[0])   //1111
println(cc[0])   //1


//Checking Whether Two Arrays Share the Same Elements///////////////////////////////////////////
if bb == cc {
    println("bb and cc still share the same elements")
}else {
    println("bb and cc refer to two independent sets of array elements")  //yes
}

if aa == cc {
    println("aa and cc still share the same elements")  //yes
}else {
    println("aa and cc refer to two independent sets of array elements")
}

if bb[0...1] === bb[0...1] {
    println("These two subarrays share the same elements.")  //yes
} else {
    println("These two subarrays do not share the same elements.")
}

//Forcing a Copy of an Array//////////////////////////////////////////////////////////////////////////
var names = ["Tom", "Jack", "Rose", "HanMeiMei"]
var copiedNames = names.copy()
names[1] = "little Jack"
println(copiedNames[1])  // still Jack















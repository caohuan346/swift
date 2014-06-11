//
//  main.swift
//  04_Collection Types
//
//  Created by hc on 14-6-10.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation


// Array////////////////////////////////////////////////////////////////////////////////////

var shoppingList: String[] = ["eggs", "milk", "vegetables"]

//Accessing and Modifying an Array//////////////////////////////////////////////////////
println("we need by \(shoppingList.count) good")

if shoppingList.isEmpty {
    println(" no good need to buy")
}else{
    println("we need by \(shoppingList.count) good")
}

//add a new item to the end of an array
shoppingList.append("apple juice")
println("\(shoppingList[3])")

//  += add a element
shoppingList += "orange"
println("\(shoppingList[4])")

//add elements to a array
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]


//change item
shoppingList[0] = "six eggs"
println("\(shoppingList)")

//modified by range
shoppingList[4...6] = ["Bananas", "Apples"]
println("\(shoppingList)")

//insert
shoppingList .insert("bread", atIndex: 0)
println(shoppingList)

//remove
let removeItem = shoppingList .removeAtIndex(1)
println(shoppingList)
println(removeItem)


//remove last
let removedLast = shoppingList.removeLast()
println(removedLast)

//Iterating Over an Array
for item in shoppingList {
    println(item)
}

//enumerate//////////////////////////////////////////
for (index, value) in enumerate(shoppingList) {
    println("item \(index + 1) : \(value)")
}


//Creating and Initializing an Array//////////////////////////////////////////
var someInts = Int[]()
println(someInts.count)  //0


someInts.append(3)
println(someInts)   //[3]

someInts = []   //[]
println(someInts)

// init and default value
var	threeDoubles  = Double[](count: 3, repeatedValue:0.1)
println(threeDoubles)  //[0.1,0.1,0.1]

//add arrays together
var anotherThreeDoubles = Double[](count:4,  repeatedValue:2.1)
println(threeDoubles + anotherThreeDoubles)   //[0.1, 0.1, 0.1, 2.1, 2.1, 2.1, 2.1]


//Dictionaries////////////////////////////////////////////////////////////////////////////////////
//KeyType must be hashable:such as String, Int, Double, and Bool

//Dictionary Literals
var airports: Dictionary<String,String> = ["TYO":"Tokyo", "DUB":"Dublin"]
println("\(airports)")

//Accessing and Modifying a Dictionary/////////////////////////////////////////////////////////
println(airports.count)

println(airports["TYO"])

airports["TYO"] = "Tokyo city"
println(airports["TYO"])

//exist, add
if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    println("the old value for DUB is \(oldValue)")
}


//add
if let oldValue2 = airports.updateValue("xxxxxx", forKey: "CHI") {
    println("the old value for CHI is \(oldValue2)")
}

//add ,isn't easy?
airports["AA"] = "AAaaaaaa"
airports["BB"] = "BBbbbbbb"
println(airports)

println(airports["CHI"])


if let airportName = airports["TYO"] {
    println(" The name of the airport is \(airportName)")
}else {
    println(" The name of the airport is not exsit in dic")
}


//remove 1
airports["APL"] = "Apple International"
println(airports["APL"])
airports["APL"] = nil


//remove 1

if let removedValue = airports.removeValueForKey("AA") {
    println("remove value is \(removedValue)")
} else {
    println("there is not exsit a value for key AA")
}


//Iterating Over a Dictionary /////////////////////////////////////////////////////////

for (airportCode, airportName) in airports {
    println(" airportCode is \(airportCode), airportName is \(airportName)")
}


//user keys and values propertier
for airportCode in airports.keys {
    println("airportCode: \(airportCode)")
}

for airportCode in airports.keys {
    println("----airportCode: \(airportCode),and airportName: \(airports[airportCode])")
}


for airportName in airports.values {
    println("airportName:\(airportName)")
}

let airportCodes = airports.keys
let airportValues = airports.values


//createing an empty dictionary
var namesOfIntegers = Dictionary<Int,String>()
namesOfIntegers[1] = "one"
namesOfIntegers[2] = "two"
namesOfIntegers[3] = "three"
namesOfIntegers[4] = "four"
println(namesOfIntegers)

//var namesOfIntegers2 = [:]
//namesOfIntegers[1] = "one"
//namesOfIntegers[2] = "two"
//namesOfIntegers[3] = "three"
//namesOfIntegers[4] = "four"
//println(namesOfIntegers)


//  If you create an array or a dictionary and assign it to a variable, the collection that is created will be mutable. This means that you can change (or mutate) the size of the collection after it is created by adding more items to the collection, or by removing existing items from the ones it already contains. Conversely, 

//if you assign an array or a dictionary to a constant, that array or dictionary is immutable, and its size cannot be changed.









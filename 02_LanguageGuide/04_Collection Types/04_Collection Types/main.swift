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

println(airports["CHI"])

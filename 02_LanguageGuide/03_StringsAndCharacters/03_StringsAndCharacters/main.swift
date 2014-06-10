//
//  main.swift
//  03_StringsAndCharacters
//
//  Created by hc on 14-6-10.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation

let someString = "Some string literal value"
println(someString)

let someString2 = "Some \0 string \\ literal \t value \n Some \r string \" literal \' value"
println(someString2)

let wiseWord = "\"Imagination is more important than knowledge"

let dollarSign = "\x24"
println(dollarSign)   //$   Unicode

let blackHeart = "\u2665"
println(blackHeart)  //♥  Unicode

let sparklingHeart = "\U0001F496"  // 💖, unicode


// init an empty string
var emptyString = ""

var anotherEmptyString = String()

if anotherEmptyString.isEmpty {
    println("Nothing to see here")
}

//String Mutability
var varStr = "Horse"
varStr += " and carriage"

println(varStr)

let constantStr = "Highlander"
//caonstantStr += " and anotherEmptyString "


var str1 = "str1"
var str2 = str1
str1 = "str1 modified"
println(str2)

//字符串是字符数组
for character in "Dog!🐶" {
    println(character)
}

let yenSign: Character = "￥"


let unusualStr = "Dog!🐶Dog!🐶Dog!🐶Dog!🐶Dog!🐶"
println("has \(countElements(unusualStr)) character")


let string1 = "string1"
let char1: Character = "!"
let stringPlusChar = string1 + char1
println(stringPlusChar)


let quotation = "we are one"
let sameQuotation = "we are one"
if   quotation == sameQuotation {
    println("YEs,we are one")
}


//Prefix an Suffix Equality//////////////////////////////////////////////////////////////
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

if romeoAndJuliet[0].hasPrefix("Act") {
    println("bingo, you found it")
}


//Uppercase and Lowercase Strings//////////////////////////////////////////////////////////////
let normal = "How do you do,I'am fine,Thank you"
println(normal.lowercaseString)
println(normal.uppercaseString)



//Unicode////////////////////////////////////////////////////////////////////////////////////
let dogStr = "Dog!🐶"


//UTF-8//////////////////////////////////
for char in dogStr.utf8 {
    print("\(char) ") //68 111 103 33 240 159 144 182
}
println()

for utf16char in dogStr.utf16 {
    print("\(utf16char) ") //68 111 103 33 55357 56374
    
}
println()


///Unicode Scalars////////////////////////////////////////////////////////////////////////
for scalar in dogStr.unicodeScalars {
    print("\(scalar.value) ")  //68 111 103 33 128054
    
}
println()

for scalar in dogStr.unicodeScalars {
    print("\(scalar) ")   //D o g ! 🐶 
}
println()








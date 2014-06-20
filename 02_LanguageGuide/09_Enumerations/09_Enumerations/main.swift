//
//  main.swift
//  09_Enumerations
//
//  Created by hc on 14-6-16.
//  Copyright (c) 2014 hc. All rights reserved.
//

import Foundation

//Enumeration Syntax////////////////////////////////////////////////////////////
enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.East
println(directionToHead)

//after directionToHead is declared as a CompassPoint ,you can set it with a dot syntax
directionToHead = .West

//Matching Enumeration Values with a Switch Statement
directionToHead = .South

switch directionToHead {
case .East:
    println("East")
case .North:
    println("North")
case .West:
    println("West")
case .South:
    println("South")
}


let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    println("Earth")
default:
    println("not Earth")
}


//Associated Values///////////////////////////////////////////////////////////////////////////
enum Barcode {
    case UPCA(Int, Int, Int)
    case QRcode(String)
}

var aProductBarcode = Barcode.UPCA(8, 85909_51226, 3)
aProductBarcode = .QRcode("ABCDEFGHIJKLMNOP")
println(aProductBarcode)


//switch aProductBarcode {
//    case .UPCA
//    
//}

















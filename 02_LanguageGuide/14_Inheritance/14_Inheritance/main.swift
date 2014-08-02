//
//  main.swift
//  14_Inheritance
//
//  Created by hc on 14-8-2.
//  Copyright (c) 2014 happy. All rights reserved.
//

import Foundation

//Define a base class/////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}

let someVehicle = Vehicle()
println(someVehicle.maxPassengers)
println(someVehicle.description())

//subClassing /////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Bicycle: Vehicle {
    override func description() -> String {
        return "A bicycle with \(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    init() {
        super.init()
        numberOfWheels = 2
    }
}
let aBicycle = Bicycle()
println(aBicycle.numberOfWheels)
println(aBicycle.description())

class Tandem: Bicycle {
    init() {
        super.init()
        maxPassengers = 2
    }
}
let aTandem = Tandem()
println(aTandem.numberOfWheels)
println(aTandem.description())


///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////

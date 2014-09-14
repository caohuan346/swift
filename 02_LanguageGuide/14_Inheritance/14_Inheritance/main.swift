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
class Car: Vehicle {
    var speed: Double = 0.0
    init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    
    override func description() -> String {
        return super.description() + "; "
        + "traveling at \(speed) mph"
    }
}

var aCar = Car()
aCar.maxPassengers = 5
println(aCar.maxPassengers)
println(aCar.description())
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

class SpeedLimitedCar: Car {
    override var speed: Double {
    get {
        return super.speed;
    }
    set {
        super.speed = min(newValue, 40.0)
    }
    }
}

let limitedCar = SpeedLimitedCar()
limitedCar.speed = 60.0
println("speed:\(limitedCar.speed)")
println(limitedCar.description())
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
    didSet {
        gear = Int(speed / 10.0) + 1
    }
    }
    
    override func description() -> String  {
        return super.description() + "in gear \(gear)"
    }
}

var automaticCar = AutomaticCar()
automaticCar.speed = 1000
println(automaticCar.description())
///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////////////

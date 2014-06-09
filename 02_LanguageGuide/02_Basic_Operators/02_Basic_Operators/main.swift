//
//  main.swift
//  02_Basic_Operators
//
//  Created by hc on 14-6-9.
//  Copyright (c) 2014年 hc. All rights reserved.
//

import Foundation

//Assignment Operator////////////////////////////////////////////////////////////////////////////
let a = 10
var b = 5
b = a
println(b)


let (x, y ,z) = (1, 2, 2)
if x == y {
    println("x=y")
}else if (y == z){
    println("y=z")
}

//Arithmetic Operators 算术符号////////////////////////////////////////////////////////////////////////////
var c = 5, d = 10
println("\(c+d) \(d/5)  \(c*d) \(d-5)")

//swift不允许值溢出


println("hello" + " caohuan")

let dog: Character = "🐶"
let cow: Character = "🐮"
let dogAndCow = dog + cow
println(dogAndCow)



//Remainder Operator  余数操作 (modulo operator)符////////////////////////////////////////////////////////////////////////////

let aa = 31
let bb = 5
println(aa % bb)



//Floating-Point Remainder Calculations///////////////////////////////////////////////////////////
println(8%2.5)   //0.5
println(-8%2.5)  //-0.5


//“Increment and Decrement Operators ////////////////////////////////////////////////////////////
var i = 0
println(++i)  //1

i = 0
println(i++) // 0


























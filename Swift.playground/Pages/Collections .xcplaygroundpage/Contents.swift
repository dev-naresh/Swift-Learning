//: [Previous](@previous)

import Foundation

var arr : [Int] = Array()
var arr1 : Array<Int> = []
//var set = Set()

arr.append(2)

arr[0] = 3

print(arr)
print(arr1)


//enum direction : String {
//    case north
//    case south
//    case east
//    case west
//}

class Alpha{
    var int : Int
    init(_ int : Int){
        self.int = int
    }
}

//var alpha : Set<Alpha> = Set()
var alpha : [String: Alpha] = ["naresh" : Alpha(4)]

print(alpha["naresh"] as Any)
print(alpha["naresh"]!)
//var asd : [Int]? =  nil

var a : Int? = 4
print(a as Any)
print(a!)

//print(asd?.count)

var tup = (2, "dksla", 2)
print(tup.1)


func temp() -> Int {
    return 9
}

var temp1 = temp()

temp1

class Temp {
    func temp() -> Int {
        return 9
    }
    var num : Int
//    var num3 = num
    
    var num2 : Int {
        return num * 2
    }
//    var mi = num2
    
    lazy var temp1 = temp()
    init(_ a : Int){
        num = a
    }

}

var lh = Temp(6)
print(lh.temp1)


enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
var rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

//class hashable : Hashable {
//
//}




//var naveendir : direction = .northeast

//var direct : Set<direction> = Set()

//direct.insert(naveendir)
//for i in direct{
//    print(i)
//}


//: [Next](@next)



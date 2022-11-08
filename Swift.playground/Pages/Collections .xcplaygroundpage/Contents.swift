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


enum enumTemp {
    case a, b, c
    init?(char : Character) {
        switch char {
        case "a": self = .a
        case "b": self = .b
        case "c": self = .c
        default : return nil
        }
    }
}

var aEnum = enumTemp(char: "d")

print(aEnum ?? 0)


//Failable delegation

class FailTemp {
    var a : Int
    required init() {
        self.a = 0
    }
    init?(_ a : Int, _ b : Int) {
        self.a = a
    }
//    init(){
//
//    }
}

//class op {
//
//}
//
////extension op {
////
////
////}

class Fail2 : FailTemp {
    required init() {
        super.init()
    }
    
    init?(_ a : Int) {
        super.init(a , 0)
    }
    override init(_ a: Int, _ b: Int) {
        super.init(a,b)!
    }
}

var fail2 = Fail2(2)

//print(Fail2(1)?.a ?? 0)
print(fail2?.a ?? 0)

//: [Next](@next)

struct Num {
    var num1 : Int
    var num2 : Int
    init(_ a :Int,_ b :Int){
        num1 = a
        num2 = b
    }
}
//var a = 9
var b = 4

var nm : Num = {
    var nu =  Num(1, 3)
    nu.num2 = 900
    return nu
}()

print(nm.num1,nm.num2)

var clo : Void = {
    print("Closure activated")
}()

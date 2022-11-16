//: [Previous](@previous)

import Foundation

struct NestTemp {
    enum NestTempEnum {
    case name, age, gender
    }
    
//    var
}
class NestTempClass {
    var alt : Int
    init(_ a : Int) {
        self.alt = a
    }
}

var a = NestTemp()

//var am = NestTemp.NestTempClass(9)

enum Temp {
    case fads
}

var m : Temp = Temp.fads

print(NestTemp.NestTempEnum.age)

var n : NestTemp.NestTempEnum = NestTemp.NestTempEnum.age

func ads(_ d : NestTemp.NestTempEnum) {
    
}

ads(n)
//: [Next](@next)

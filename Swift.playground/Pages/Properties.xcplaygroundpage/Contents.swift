//: [Previous](@previous)

import Foundation


//Computed properties
//class Comp {
//    var a : Int = 0
//    var b : Int = 0
//
//    var comp : (Int, Int) {
//        set(a: Int,b: Int){
//            if a % 2 == 0, b % 2 == 0 {
//                self.a = a % 2
//                self.b = b % 2
//            }
//        }
//        get{
//            (self.a,self.b)
//        }
//    }
//}
//
//var compAc = Comp()
//compAc.comp = (a: 10,b: 6)
//
//print(compAc.comp.a)

@propertyWrapper
struct SmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}


struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"

enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

var sizeRect = SizedRectangle()


struct A {
    var a : Int = 0
//    {
//        return 5
//    }
    
    init() {
        self.init(a: 5)
    }
    init(a:Int){
        self.a = a
    }
}

class B {
    var a = A()
    
    func temo(){
//        a.a = 5
        print(a.a)
    }
    
//    init() {
//
//    }
}

var b = B()
b.temo()


//: [Next](@next)

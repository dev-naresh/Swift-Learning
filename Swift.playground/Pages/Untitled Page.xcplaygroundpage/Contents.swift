//: [Previous](@previous)

import Foundation

@propertyWrapper
struct Props {
    private var a : Int
//    private(set) var projectedValue :
    
    
    
    var wrappedValue : Int {
        get {
            return a
        }
        set {
            if(newValue > 0){
                a = newValue
            }
        }
    }
     
    init() {
        self.a = 0
    }
    
    init(_ a : Int) {
        self.a = a
    }
}

struct Props2 {
    @Props var a : Int
}

var prop2 = Props2()

prop2.a = -9

print(prop2.a)



struct Subscript {
    var arr : Int = 0
    var a : Int = 0
    
    subscript() -> (Int, Int) {
        get {
            print("naveen")
            return arr
        }
        set {
            print("set Naveen")
            arr = newValue
        }
    }
}

var num = Subscript(arr:3)

print(num[])
num[] = 91
print(num[])



//: [Next](@next)

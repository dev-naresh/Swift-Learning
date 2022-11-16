//: [Previous](@previous)

import Foundation

@propertyWrapper
struct Props {
    private var a : Int
    private(set) var projectedValue : Bool
    
    var wrappedValue : Int {
        get {
            return a
        }
        set {
            if(newValue > 0){
                a = newValue
                projectedValue = true
            }
        }
    }
//    var wrappedValue : String {
//        get {
//            return b
//        }
//        set {
//                b = newValue
//        }
//    }
     
    init() {
        self.a = 0
        projectedValue = false
    }
    
    init(_ a : Int) {
        self.a = a
        projectedValue = true
    }
}

struct Props2 {
    @Props var a : Int
}

var prop2 = Props2()

prop2.a = -9

print(prop2.a)

struct Subscript {
    var arr : [Int] = [1]
    var a : Int = 0

    subscript(_ x : [Int])  -> [Int] {
        get {
            print("naveen")
            return arr
        }
        set{
            self.arr = newValue
        }
    }
    
    subscript(_ a : Int) -> Int {
        return self.a
    }
    
    var b : Int {
        get {
            return a
        }
        set {
            self.a = newValue
        }
    }
}

var num = Subscript()

num.arr
print("This is \(num[0])")
num.b = 9
print(num[8])

var a = [1 : "One"]

a[1]

print(num.b)

//print(num[])
num[num.arr] = [7,6]
print(num[num.arr])

extension Subscript {
    init(_ a : Int) {
        self.a = a
    }
}

var b = Subscript(3)

print(b.a)

//: [Next](@next)

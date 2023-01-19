//: [Previous](@previous)

import Foundation

class A {
    var a: [Int] = [2]

    subscript(a: Int) -> Int{
        get {
            return a
        }
        set {
            self.a.append(newValue)
        }
    }
}

var m: A = A()
m[10] = 3
m[10] = 9
print(m.a)
print(m[10])

//error handling

enum Errors: Error {
    case NumError
}

func errCheck(_ num: Int) throws -> Int {
    guard num > 0 else {
        throw Errors.NumError
    }
    return num
}

do{
//    try errCheck(1)
    try errCheck(-1)
}
var f = try? errCheck(1)
print(f ?? 0)
protocol APro{
    
}
extension Int: APro{
    
}

func gen<T: APro> (a: T) -> T {
    var m: T
    m = a
    print(m)
    return m
}

gen(a:3)

protocol AB {
    associatedtype U
}

class AM<U> {
    var a: U?

    func gen1 (a: U) -> U {
        var m: U
        m = a
        print(m)
        return m
    }

    
    
}

var am: AM = AM<Int>()
am.gen1(a: 33)

//class A {
//    var a: Int
//    weak var b: B?
//
//    init(_ a: Int) {
//        self.a = a
//    }
//}
//
//class B {
//    var b: Int
//    var a: A?
//
//    init(_ b: Int) {
//        self.b = b
//    }
//}

//var aA: A = A(9)
//var bB: B? = B(10)

//aA.b = bB
//bB?.a = aA
//
//bB = nil

var testClo: () -> Void = {}
func test(_ clo: @escaping () -> Void) {
    testClo = clo
}

test() {
    print("escaping closure")
}

testClo()


  


//: [Next](@next)

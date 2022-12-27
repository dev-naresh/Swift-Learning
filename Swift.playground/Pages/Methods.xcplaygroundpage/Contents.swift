//: [Previous](@previous)

import Foundation

//class method execution example
class classTemp {
    static func staticFunc() {
        
    }
    class func classFunc() {
        
    }
}

class classTemp2 : classTemp {
//    override static func staticFunc(){
//
//    }
    
    override class func classFunc() {
        
    }
}



//Initializer delegation

//Structures based
struct Adel {
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

var a = Adel()

//Class based

class DelTemp {
    
    var num1 : Int
    var num2 : Int
    var num3 : Int
    var no = 1000
    
    
    init(_ num1 : Int, _ num2 : Int, _ num3 : Int) {
        self.num1 = num1
        self.num2 = num2
        self.num3 = num3
    }
    
    convenience init(_ num1 : Int) {
        self.init(num1,0,0)
    }
    
    convenience init(_ num1 : Int, _ num2 : Int) {
        self.init(num1, num2, 0)
    }
}

class DelTemp2 : DelTemp {
    
    var num : Int
    
//    override init(_ num1: Int, _ num2: Int, _ num3: Int) {
//        <#code#>
//    }
    
    init(_ num : Int, _ num1 : Int, _ num2 : Int, _ num3 : Int) {
        self.num = num
        super.init(num1, num2, num3)
//        super.init(<#T##num1: Int##Int#>)
       no = 99
    }
    
    convenience init(_ num : Int) {
        self.init(num, 0, 0, 0)
//        self.num = num
    }
}

var deltemp2c = DelTemp2(1)
print(deltemp2c.num, deltemp2c.num1, deltemp2c.num2, deltemp2c.num3)
var deltemp2d = DelTemp2(1, 2, 3, 4)
print(deltemp2d.num, deltemp2d.num1, deltemp2d.num2, deltemp2d.num3)
var deltempc1 = DelTemp(1)
print(deltempc1.num1, deltempc1.num2, deltempc1.num3)
var deltempc2 = DelTemp(1, 2)
print(deltempc2.num1, deltempc2.num2, deltempc2.num3)


class TempA {
    var a : Int?
    
    func m() {
        print("M invoked")
    }
    
}

class TempB : TempA{
    var num  : Int
    
    init(_ a : Int) {
        self.num = 0
    }
    
    func x() {
        
    }
//    convenience override init(){
//        //num = 0
//        self.init(0)
//    }
}

var tempb : TempA? = TempB(4)

tempb?.m()

var aAs : Int? = 9

print(aAs as Any)

print()

var choice : (Int, Int) = (9, 4)

switch choice {
case let x :
    print(x)
    break
case let ("f", y) as (String, Double) :
    print()
    break
}

class typeA {
    func a(){
        print("Super class")
    }
}

class typeB : typeA {
    override func a() {
        print("Sub Class")
    }
}

var typeb : typeA = typeB()
var typea: typeA = typeA()
typeb.a()
typea.a()
typea as typeA
typeb.a()
print(typea is typeA)

//let atype = typea as typeB

//if let x = tempb as? TempB {
//    print("S")
//}
//
//print(tempb?.a ?? 0)

struct sdfdfa {
    
}

var saldfj : sdfdfa


var arrA = [1,2,3] 
var arrN = [4,5,5]

var any : [Any] = [2, "k", typea]

var anyobj : [AnyObject] = [typea]

typea.a()
if let m = typeb as? typeB {
    m.a()
}


protocol Aprot{
    
}

protocol Bprot{
    
}

extension Aprot {
    func aprot(){
        print("Hello")
   }
}

class Aclass: Aprot {
    
}
var acls = Aclass()


extension Aclass {
    func printable(){
        print("Aclass")
    }
}
acls.aprot()
extension Array : Aprot where Element : Aprot {
    func s(){
        print("sdf")
    }
}
var arr: [Aclass] = [Aclass(),Aclass(),Aclass()]

arr.s()
var arr2: [Any] = [1,2,3,4,Aclass()]

struct Equal : Equatable {
    static func ==(lhs: Equal, rhs: Equal) -> Bool{
            return false
    }
}

//: [Next](@next)

class Temp {
    var a: Int
    var b: Int
    
    init (_ a: Int, _ b: Int) {
        self.a = a
        self.b = b
    }
//    init (_ struc: AB) {
//        self.a = struc.a
//        self.b = struc.b
//    }
    convenience init (_ struc: AB) {
        self.init(struc.a, struc.b)
    }
}

struct AB {
    var a = 3
    var b = 4
}

var template = Temp(AB())

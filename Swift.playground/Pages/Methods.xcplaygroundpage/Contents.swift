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
    
    init(_ a : Int) {
        self.a = a
    }
    
    convenience init() {
     //   self.a = 1
        self.init(1)
    }
    
    convenience init (_ a : Int , _ b :Int) {
        print("con")
        self.init()
    }
}

class TempB : TempA{
    var num  : Int
    
    override init(_ a : Int) {
        self.num = 0
        super.init(a)
    }
//    convenience override init(){
//        //num = 0
//        self.init(0)
//    }
}

var tempb : TempB? = TempB(4)

print()

print(tempb?.a ?? 0)


//: [Next](@next)

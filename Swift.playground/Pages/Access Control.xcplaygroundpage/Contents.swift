//: [Previous](@previous)

import Foundation


class A {
    private var x = 10
    private func someMethod() {}
    
    func pk()  {
        print(y)
    }
    
}

//internal class B: A {
//    override internal func someMethod() {}
//}


postfix operator ++

//precedencegroup Increment {
//    assignment : true
//}

postfix func ++ (_ op: inout Int){
    op += 1
}

var i = 0
i++
print(i)


extension A {
    var re : Int{
        return x
    }
    
    private var y : Int {
        return 0
    }
}


var a = A()
print(a.re)
a.pk()


private protocol AProto {
//    associatedtype Element
    var a : Int {get}
}

//extension AProto where Element: Hashable{
//    func zyx(){
//       print("zyx")
//    }
//}

struct AClass : AProto, Hashable{
//    typealias Element = AClass
    
    var a : Int = 0
    
    var b : Int = 9
}



var apro = AClass()

print(apro is AProto ? true : false)

@objc protocol Apro {
    @objc optional var aa : Int { get }
}

class AA : Apro{
    var aa : String = "asd"
}

var aaa = AA()
print(aaa.aa)
//apro.zyx()


//: [Next](@next)

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


//Memory safety

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
struct str {
    var name : String
    var point : Int
}
var s = str(name: "person1", point: 33)
func kop(n : inout String , z : inout Int){
    
}
func d(v : str)->str{
    var l = v
    kop(n: &l.name, z: &l.point)
    return l
}
s = d(v: s)
func balancechecking(){
    var playerOneScore = 42
    var playerTwoScore = 30
    balance(&playerOneScore, &playerTwoScore)  // OK
//    balance(&playerOneScore, &playerOneScore)
}

balancechecking()

//: [Next](@next)

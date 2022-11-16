//: [Previous](@previous)

import Foundation

protocol ProtTemp {
    var proA : Int? { get }
    
    func proFunc(_ new : Int?)
}

class ProtTempClass : ProtTemp {
    var proA : Int?
    
    init! () {
        self.proA = nil
    }
    
    func proFunc(_ newA : Int?){
        print(newA as Any)
    }
}

var protemp : ProtTempClass? = ProtTempClass()
//protemp.proA = 4
protemp?.proFunc(protemp!.proA)


protocol A {
    
}

@objc protocol B {
    @objc optional var c : Int {get}
}

protocol AB : A, B {
    
}

struct Acls: A , Hashable{
    
}

extension Array : A  where Element: A & Hashable {
    
}

var arrProt = [Acls(), Acls()]

var acls1: A = Acls()

print(acls1 as? Acls ?? 0 )

struct Bcls {
    
}


func generics <T: Equatable,U> (a: T, b: U){
    
}

//generics(a: Bcls(), b: "sfd")
struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var s1 = Stack<String>()
s1.push("safda")


protocol Container {
    associatedtype Item : Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct M{
    
}

struct N : Equatable{
    
}

//struct L : Container {
//    typealias T = N
//    var arr : [T] = []
//    mutating func append(_ item: T) {
//        arr.append(item)
//    }
//    var count: Int {
//        arr.count
//    }
//    subscript(i: Int) -> T {
//        arr[i]
//    }
//}
open class nn{
    
}
protocol Na {
    associatedtype T
    func call(_ a : Int)
}
struct Navee<T> : Na{
    var num : Int = 1
    var n : T
    func call(_ a : Int){
        print(a)
    }
}


var obj1 = Navee<Int>(n: 3)
var obj2 = Navee<String>(n: "naveen")

//obj1 === obj2

func returnObj<T>(_ a : T) -> some Na {
    Navee(n: a)
}

print(returnObj(3))
print(returnObj("naveen"))
//: [Next](@next)

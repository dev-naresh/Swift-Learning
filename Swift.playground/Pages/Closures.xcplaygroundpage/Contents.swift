//: [Previous](@previous)

import Foundation

//Closure

var clofunc : (() -> Void) = {
    print("Closure")
}

clofunc()


func norFunc(  _ closure : () -> Void){
    closure()
}

norFunc(clofunc)


//Autoclosure

struct Employee {
    var empId : Int
    var empType : String
    
//    init(_ empId : Int, _ empType : String){
//        self.empId = empId
//        self.empType = empType
//    }
}

var emp1 = Employee(empId : 3,empType: "Dev")

func access(_ accessclo : @autoclosure () -> String){
    if accessclo() == "Dev" {
        print("Access allowed")
        return
    }
    print("Invalid access")
}

access(emp1.empType)


//Escaping Closure

var tempEsc : (() -> Void) = {}
 
func escFunc(_ escFunc : @escaping () -> Void){
    tempEsc = escFunc
    print("escFunc is invoked")
}


escFunc(clofunc)
tempEsc()

//Trailing closure

func trailFunc(clo: () -> Int, clo2: () -> Int){
    print(clo())
    print(clo2())
}

trailFunc(){
    return 9
}clo2: {
    return 10
}

enum direct {
    case north
    case south
}

//for d in direct.allCases {
//    print(d)
//}


func temp(_ a : Int) {
    
}

temp(7)

struct Student {
    var name: String
    var age: Int
    var gender: Character
}

var student = [ Student(name: "a", age: 23, gender: "M"),
                Student(name: "b", age: 33, gender: "F"),
                Student(name: "c", age: 32, gender: "M"),
                Student(name: "d", age: 19, gender: "F")]

var num: [Int] = [1,2,3,4,5,7]

print(student.filter{ $0.age > 20 })
print(student.filter{ $0.gender == "F" })
print(num.reduce(0, +))
//print(student.sorted{ $0 < $1 })

//: [Next](@next)
